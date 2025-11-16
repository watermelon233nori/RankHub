import 'package:get/get.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/data/platforms_data.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/sync_manager.dart';
import '../services/isar_service.dart';

/// 数据同步状态
enum SyncStatus {
  idle, // 空闲
  syncing, // 同步中
  success, // 成功
  error, // 错误
}

/// 数据同步 Controller
class DataSyncController extends GetxController {
  final _syncManager = SyncManager();
  final _dbService = IsarService.instance.maimai;

  // 同步状态
  final syncStatus = SyncStatus.idle.obs;

  // 同步进度
  final syncProgress = 0.0.obs;

  // 当前步骤描述
  final syncDescription = ''.obs;

  // 错误信息
  final errorMessage = ''.obs;

  // 上次同步时间
  final lastSyncTime = Rx<DateTime?>(null);

  @override
  void onInit() {
    super.onInit();

    // 监听同步管理器状态变化
    ever(_syncManager.runningTasksRx, (_) => _updateSyncStatus());
    ever(_syncManager.completedTasksRx, (_) => _updateSyncStatus());
  }

  /// 更新同步状态
  void _updateSyncStatus() {
    final running = _syncManager.runningTasks;
    final completed = _syncManager.completedTasks;

    if (running.isEmpty && completed.isNotEmpty) {
      // 所有任务已完成
      final hasError = completed.any(
        (task) => task.status == SyncTaskStatus.failed,
      );
      if (hasError) {
        syncStatus.value = SyncStatus.error;
        final failedTask = completed.firstWhere(
          (task) => task.status == SyncTaskStatus.failed,
        );
        errorMessage.value = failedTask.error ?? '同步失败';
      } else {
        syncStatus.value = SyncStatus.success;
        lastSyncTime.value = DateTime.now();
      }
    } else if (running.isNotEmpty) {
      // 有任务正在运行
      syncStatus.value = SyncStatus.syncing;

      // 计算总体进度
      final totalProgress =
          running.fold(0.0, (sum, task) => sum + task.progress) /
          running.length;
      syncProgress.value = totalProgress;

      // 获取当前任务描述
      final currentTask = running.first;
      syncDescription.value = currentTask.description;
    }
  }

  /// 同步当前账号的数据
  Future<void> syncCurrentAccount() async {
    final accountController = Get.find<AccountController>();
    final currentAccount = accountController.currentAccount;

    if (currentAccount == null) {
      Get.snackbar('提示', '请先选择账号');
      return;
    }

    if (syncStatus.value == SyncStatus.syncing) {
      Get.snackbar('提示', '数据正在同步中，请稍候...');
      return;
    }

    try {
      // 获取平台
      final platform = PlatformRegistry().getPlatformByType(
        currentAccount.platform,
      );
      if (platform == null) {
        Get.snackbar('错误', '不支持的平台类型');
        return;
      }

      // 重置状态
      resetStatus();
      syncStatus.value = SyncStatus.syncing;
      _syncManager.clearCompletedTasks();

      // 提交同步任务
      await _syncManager.syncPlatform(platform, currentAccount);

      Get.snackbar('同步完成', '所有数据已同步到本地', duration: const Duration(seconds: 2));
    } catch (e) {
      syncStatus.value = SyncStatus.error;
      errorMessage.value = e.toString();
      Get.snackbar('同步失败', e.toString(), duration: const Duration(seconds: 3));
    }
  }

  /// 清除所有本地数据
  Future<void> clearLocalData() async {
    try {
      await _dbService.clearAll();
      lastSyncTime.value = null;
      Get.snackbar('成功', '本地数据已清除');
    } catch (e) {
      Get.snackbar('失败', '清除数据失败: $e');
    }
  }

  /// 获取数据库统计信息
  Future<Map<String, int>> getDatabaseStats() async {
    final songs = await _dbService.getAllSongs();
    final players = await _dbService.getAllPlayers();
    final scores = await _dbService.getAllScoresSortedByRating();
    final collections = await _dbService.getAllCollections();

    return {
      'songs': songs.length,
      'players': players.length,
      'scores': scores.length,
      'collections': collections.length,
    };
  }

  /// 检查是否需要同步
  bool get needsSync {
    if (lastSyncTime.value == null) return true;

    final now = DateTime.now();
    final difference = now.difference(lastSyncTime.value!);

    // 超过7天未同步
    return difference.inDays >= 7;
  }

  /// 重置状态
  void resetStatus() {
    syncStatus.value = SyncStatus.idle;
    syncProgress.value = 0.0;
    syncDescription.value = '';
    errorMessage.value = '';
  }
}
