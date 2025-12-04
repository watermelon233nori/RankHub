import 'package:get/get.dart';
import 'package:rank_hub/services/mai_party_api_service.dart';
import 'package:rank_hub/services/queue_status_manager.dart';
import 'package:rank_hub/services/live_activity_service.dart';
import 'package:rank_hub/pages/live_activity_intro_page.dart';
import 'dart:io';

/// 舞萌排队控制器
class MaiPartyQueueController extends GetxController {
  final String partyName;
  final String? initialPlayerName;

  MaiPartyQueueController({required this.partyName, this.initialPlayerName});

  final _apiService = MaiPartyApiService();

  // 队列列表
  final queue = <String>[].obs;

  // 加载状态
  final isLoading = false.obs;

  // 错误信息
  final errorMessage = ''.obs;

  // 玩家名称
  final playerName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (initialPlayerName != null && initialPlayerName!.isNotEmpty) {
      playerName.value = initialPlayerName!;
    }
    loadQueue();
  }

  /// 加载队列
  Future<void> loadQueue() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _apiService.getQueue(partyName);
      queue.value = result;
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('错误', '加载队列失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 加入队列
  Future<void> joinQueue() async {
    if (playerName.value.trim().isEmpty) {
      Get.snackbar('提示', '请输入玩家名称', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _apiService.joinQueue(
        partyName,
        playerName.value.trim(),
      );
      queue.value = result;

      // 更新排队状态
      await QueueStatusManager.instance.setQueueStatus(
        partyName,
        playerName.value.trim(),
      );

      Get.snackbar('成功', '已加入队列', snackPosition: SnackPosition.BOTTOM);

      // 在 iOS 上检查是否首次加入队列，如果是则弹出询问对话框
      if (Platform.isIOS) {
        final isFirstTime = await LiveActivityService.instance
            .isFirstTimeJoin();
        if (isFirstTime) {
          _showLiveActivityDialog();
        }
      }
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('错误', '加入队列失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 显示实时活动介绍页面
  void _showLiveActivityDialog() {
    LiveActivityIntroPage.show(showSkipButton: true);
  }

  /// 插队
  Future<void> changePosition(String targetPeople) async {
    if (playerName.value.trim().isEmpty) {
      Get.snackbar('提示', '请输入玩家名称', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _apiService.changePosition(
        partyName,
        playerName.value.trim(),
        targetPeople,
      );
      queue.value = result;

      Get.snackbar('成功', '已插队', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('错误', '插队失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 离开队列
  Future<void> leaveQueue() async {
    if (playerName.value.trim().isEmpty) {
      Get.snackbar('提示', '请输入玩家名称', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _apiService.leaveQueue(
        partyName,
        playerName.value.trim(),
      );
      queue.value = result;

      // 清除排队状态
      await QueueStatusManager.instance.clearStatus();

      Get.snackbar('成功', '已退出队列', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('错误', '退出队列失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 完成上机
  Future<void> completePlay() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _apiService.completePlay(partyName);
      queue.value = result;

      // 刷新排队状态
      await QueueStatusManager.instance.refreshStatus();

      Get.snackbar('成功', '已完成上机', snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('错误', '完成上机失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 获取玩家在队列中的位置（从1开始）
  int? getPlayerPosition() {
    if (playerName.value.trim().isEmpty) return null;
    final index = queue.indexOf(playerName.value.trim());
    return index == -1 ? null : index + 1;
  }

  /// 判断玩家是否在上机位置（前两位）
  bool get isPlayerPlaying {
    final position = getPlayerPosition();
    return position != null && position <= 2;
  }

  /// 判断当前玩家是否处于上机位（队列第一位）
  bool get isPlayerInFirstPosition {
    if (playerName.value.trim().isEmpty) return false;
    if (queue.isEmpty) return false;
    return queue.first == playerName.value.trim();
  }
}
