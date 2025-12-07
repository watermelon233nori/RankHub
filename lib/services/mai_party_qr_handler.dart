import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/pages/mai_party_queue_page.dart';
import 'package:rank_hub/services/qr_code_scanner_service.dart';
import 'package:rank_hub/services/queue_status_manager.dart';
import 'package:rank_hub/services/mai_party_api_service.dart';
import 'package:rank_hub/services/live_activity_service.dart';
import 'package:rank_hub/pages/live_activity_intro_page.dart';
import 'dart:io';

/// 舞萌排队二维码处理器
/// 支持解析格式：
/// - maiparty://party_name
/// - maiparty://party_name?player=player_name
/// - https://mais.godserver.cn/party/party_name
/// - https://mais.godserver.cn/party/party_name?player=player_name
class MaiPartyQRCodeHandler implements QRCodeHandler {
  @override
  String get name => '舞萌排队';

  @override
  String get description => '处理舞萌 Party 排队二维码';

  @override
  bool canHandle(String qrContent) {
    return qrContent.startsWith('maiparty://') ||
        qrContent.contains('mais.godserver.cn/party/');
  }

  @override
  Future<void> handle(BuildContext context, String qrContent) async {
    String? partyName;
    String? playerName;

    try {
      if (qrContent.startsWith('maiparty://')) {
        // 解析 maiparty:// 协议
        final uri = Uri.parse(qrContent);
        partyName = uri.host;
        playerName = uri.queryParameters['player'];
      } else if (qrContent.contains('mais.godserver.cn/party/')) {
        // 解析 HTTP URL
        final uri = Uri.parse(qrContent);
        final pathSegments = uri.pathSegments;

        // 找到 party/ 后面的部分
        final partyIndex = pathSegments.indexOf('party');
        if (partyIndex >= 0 && partyIndex < pathSegments.length - 1) {
          partyName = pathSegments[partyIndex + 1];
          playerName = uri.queryParameters['player'];
        }
      }

      if (partyName == null || partyName.isEmpty) {
        throw Exception('无法解析房间名称');
      }

      print('📱 解析成功 - Party: $partyName, Player: $playerName');

      // 显示底部确认面板
      await _showJoinConfirmationBottomSheet(context, partyName, playerName);
    } catch (e) {
      print('❌ 解析失败: $e');
      Get.snackbar(
        '错误',
        '二维码格式错误: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      rethrow;
    }
  }

  /// 显示加入队列确认底部面板
  Future<void> _showJoinConfirmationBottomSheet(
    BuildContext context,
    String partyName,
    String? qrPlayerName,
  ) async {
    final accountController = Get.find<AccountController>();
    final currentAccount = accountController.currentAccount;

    // 获取默认玩家名称：优先使用二维码中的名称，否则使用账号的displayName或username
    String defaultPlayerName =
        qrPlayerName ??
        currentAccount?.displayName ??
        currentAccount?.username ??
        '';

    final playerNameController = TextEditingController(text: defaultPlayerName);

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext sheetContext) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(sheetContext).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: 24 + MediaQuery.of(sheetContext).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 标题
              Row(
                children: [
                  Icon(
                    Icons.people_alt,
                    color: Theme.of(sheetContext).colorScheme.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '加入队列',
                          style: Theme.of(sheetContext).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '房间: $partyName',
                          style: Theme.of(sheetContext).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  sheetContext,
                                ).colorScheme.onSurfaceVariant,
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 玩家名称输入框
              TextField(
                controller: playerNameController,
                decoration: InputDecoration(
                  labelText: '玩家名称',
                  hintText: '请输入玩家名称',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 24),

              // 按钮组
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.of(sheetContext).pop();
                        // 跳转到排队页面查看详情
                        Get.to(
                          () => MaiPartyQueuePage(
                            partyName: partyName,
                            initialPlayerName: playerNameController.text.trim(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.list),
                      label: const Text('查看队列'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () async {
                        final playerName = playerNameController.text.trim();
                        if (playerName.isEmpty) {
                          Get.snackbar(
                            '提示',
                            '请输入玩家名称',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          return;
                        }

                        Navigator.of(sheetContext).pop(); // 关闭bottom sheet
                        await _joinQueueDirectly(
                          context,
                          partyName,
                          playerName,
                        );
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('直接加入'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // 底部安全区域
              SizedBox(height: MediaQuery.of(context).padding.bottom),
            ],
          ),
        );
      },
    );

    playerNameController.dispose();
  }

  /// 直接加入队列
  Future<void> _joinQueueDirectly(
    BuildContext context,
    String partyName,
    String playerName,
  ) async {
    try {
      // 显示加载提示
      Get.dialog(
        const Center(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('正在加入队列...'),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      // 加入队列
      final apiService = MaiPartyApiService();
      await apiService.joinQueue(partyName, playerName);

      // 设置排队状态
      await QueueStatusManager.instance.setQueueStatus(partyName, playerName);

      // 关闭加载提示
      Get.back();

      // 显示成功提示
      Get.snackbar(
        '成功',
        '已加入队列，可在"我的"页面查看排队状态',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );

      // 在 iOS 上检查是否首次加入队列，如果是则弹出询问对话框
      if (Platform.isIOS) {
        final isFirstTime = await LiveActivityService.instance
            .isFirstTimeJoin();
        if (isFirstTime) {
          _showLiveActivityDialog();
        }
      }
    } catch (e) {
      // 关闭加载提示
      Get.back();

      // 显示错误提示
      Get.snackbar(
        '失败',
        '加入队列失败: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  /// 显示实时活动介绍页面
  void _showLiveActivityDialog() {
    LiveActivityIntroPage.show(showSkipButton: true);
  }
}
