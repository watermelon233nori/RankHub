import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/services/qr_code_scanner_service.dart';
import 'package:rank_hub/modules/lxns/services/maimai_net_api_service.dart';

import 'package:rank_hub/modules/lxns/services/net_sync_helper.dart';
import 'package:techno_kitchen_dart/techno_kitchen_dart.dart';

/// 舞萌 NET 二维码处理器
/// 支持解析格式：SGWCMAID<16-digit timestamp><64-character QR code>
/// 从 NET 获取玩家信息并支持同步到查分器
class MaiNetQRCodeHandler implements QRCodeHandler {
  @override
  String get name => '舞萌 NET';

  @override
  String get description => '处理舞萌 NET 二维码，获取玩家信息并同步到查分器';

  @override
  bool canHandle(String qrContent) {
    // NET 二维码格式：SGWCMAID + 16位时间戳 + 64字符二维码
    return qrContent.startsWith('SGWCMAID');
  }

  @override
  Future<void> handle(BuildContext context, String qrContent) async {
    try {
      print('📱 解析 NET 二维码: ${qrContent.substring(0, 20)}...');

      // 显示加载对话框
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
                  Text('正在获取玩家信息...'),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      // 从 NET 获取玩家信息
      final netApiService = MaimaiNetApiService.instance;
      final userPreview = await netApiService.getUserPreview(qrContent);

      // 关闭加载对话框
      Get.back();

      // 显示玩家信息和操作选项
      await _showPlayerInfoBottomSheet(context, userPreview, qrContent);
    } catch (e) {
      // 关闭加载对话框
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      print('❌ 处理 NET 二维码失败: $e');

      // 提供更友好的错误信息
      String errorMessage = '获取玩家信息失败';
      if (e.toString().contains('QR Code扫描失败')) {
        errorMessage = '二维码无效或已过期，请重新扫描';
      } else if (e.toString().contains('网络')) {
        errorMessage = '网络连接失败，请检查网络设置';
      } else {
        errorMessage = '处理失败: ${e.toString()}';
      }

      Get.snackbar(
        '错误',
        errorMessage,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
      rethrow;
    }
  }

  /// 显示玩家信息底部面板
  Future<void> _showPlayerInfoBottomSheet(
    BuildContext context,
    UserPreview userPreview,
    String qrContent,
  ) async {
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
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 标题栏
              Row(
                children: [
                  // 玩家头像
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      'https://assets2.lxns.net/maimai/icon/${userPreview.iconId}.png',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              sheetContext,
                            ).colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            Icons.person,
                            color: Theme.of(
                              sheetContext,
                            ).colorScheme.onPrimaryContainer,
                            size: 32,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NET 玩家信息',
                          style: Theme.of(sheetContext).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '从 NET 获取的玩家数据',
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

              // 玩家信息卡片
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // 用户名和 Rating
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              userPreview.userName.isNotEmpty
                                  ? userPreview.userName
                                  : 'ID: ${userPreview.userId}',
                              style: Theme.of(sheetContext)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          // Rating 显示
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                sheetContext,
                              ).colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 16,
                                  color: Theme.of(
                                    sheetContext,
                                  ).colorScheme.onPrimaryContainer,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${userPreview.playerRating}',
                                  style: Theme.of(sheetContext)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(
                                          sheetContext,
                                        ).colorScheme.onPrimaryContainer,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 提示信息
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    sheetContext,
                  ).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 20,
                      color: Theme.of(
                        sheetContext,
                      ).colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '点击"同步到查分器"可将 NET 成绩上传至 LXNS 查分器',
                        style: Theme.of(sheetContext).textTheme.bodySmall
                            ?.copyWith(
                              color: Theme.of(
                                sheetContext,
                              ).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 操作按钮
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.of(sheetContext).pop(),
                      icon: const Icon(Icons.close),
                      label: const Text('关闭'),
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
                        Navigator.of(sheetContext).pop();
                        await _syncToLxns(context, qrContent);
                      },
                      icon: const Icon(Icons.cloud_upload),
                      label: const Text('同步到查分器'),
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
  }

  /// 同步到 LXNS 查分器
  Future<void> _syncToLxns(BuildContext context, String qrContent) async {
    final accountController = Get.find<AccountController>();
    final currentAccount = accountController.currentAccount;

    // 检查是否已登录 LXNS
    if (currentAccount == null || currentAccount.accessToken == null) {
      Get.snackbar(
        '提示',
        '请先登录 LXNS 查分器账号',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      // 创建同步进度控制器
      final progressController = Get.put(_SyncProgressController());

      // 显示同步进度对话框
      Get.dialog(
        Obx(
          () => Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      value: progressController.progress.value,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      progressController.message.value,
                      style: const TextStyle(fontSize: 14),
                    ),
                    if (progressController.count.value > 0) ...[
                      const SizedBox(height: 8),
                      Text(
                        '已处理: ${progressController.count.value} 条',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: false,
      );

      progressController.updateProgress(0.0, '准备同步...', 0);

      // 使用统一的同步逻辑
      final count = await NetSyncHelper.syncNetScoresToLxns(
        qrCode: qrContent,
        onProgress: (progress, message, scoreCount) {
          progressController.updateProgress(progress, message, scoreCount);
        },
      );

      // 短暂延迟后关闭对话框
      await Future.delayed(const Duration(milliseconds: 500));

      // 关闭进度对话框
      Get.back();

      // 清理控制器
      Get.delete<_SyncProgressController>();

      // 显示成功提示
      Get.snackbar(
        '成功',
        '已成功同步 $count 条成绩到查分器',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      // 关闭进度对话框
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }

      // 清理控制器
      Get.delete<_SyncProgressController>();

      print('❌ 同步到查分器失败: $e');
      Get.snackbar(
        '失败',
        '同步失败: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}

/// 同步进度控制器（用于在对话框中更新进度）
class _SyncProgressController extends GetxController {
  final progress = 0.0.obs;
  final message = ''.obs;
  final count = 0.obs;

  void updateProgress(double p, String m, int c) {
    progress.value = p;
    message.value = m;
    count.value = c;
  }
}
