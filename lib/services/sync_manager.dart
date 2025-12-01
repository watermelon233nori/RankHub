import 'dart:async';
import 'package:get/get.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/log_service.dart';

/// 同步管理器 - 统一管理所有平台的数据同步任务
class SyncManager extends GetxController {
  // 单例模式
  static final SyncManager _instance = SyncManager._internal();
  factory SyncManager() => _instance;
  SyncManager._internal();

  // 当前运行的任务队列
  final RxList<SyncTask> _runningTasks = <SyncTask>[].obs;
  List<SyncTask> get runningTasks => _runningTasks;
  RxList<SyncTask> get runningTasksRx => _runningTasks;

  // 等待执行的任务队列
  final RxList<SyncTask> _pendingTasks = <SyncTask>[].obs;
  List<SyncTask> get pendingTasks => _pendingTasks;
  RxList<SyncTask> get pendingTasksRx => _pendingTasks;

  // 已完成的任务历史
  final RxList<SyncTask> _completedTasks = <SyncTask>[].obs;
  List<SyncTask> get completedTasks => _completedTasks;
  RxList<SyncTask> get completedTasksRx => _completedTasks;

  // 最大并发任务数
  final int maxConcurrentTasks = 3;

  // 任务执行流控制
  final Map<String, StreamController<SyncTask>> _taskStreamControllers = {};

  /// 是否有任务正在运行
  bool get hasRunningTasks => _runningTasks.isNotEmpty;

  /// 总进度 (所有任务的平均进度)
  double get totalProgress {
    final allTasks = [..._runningTasks, ..._pendingTasks];
    if (allTasks.isEmpty) return 0.0;
    return allTasks.map((t) => t.progress).reduce((a, b) => a + b) /
        allTasks.length;
  }

  /// 当前任务描述
  String get currentTaskDescription {
    if (_runningTasks.isEmpty) return '';
    if (_runningTasks.length == 1) {
      return _runningTasks.first.name;
    }
    return '正在执行 ${_runningTasks.length} 个任务';
  }

  /// 提交任务组
  Future<void> submitTaskGroup(SyncTaskGroup taskGroup) async {
    LogService.i(
      '提交任务组: ${taskGroup.name} (${taskGroup.tasks.length}个任务)',
      tag: 'SyncManager',
    );

    for (final task in taskGroup.tasks) {
      _pendingTasks.add(task);
    }

    // 按优先级排序
    _pendingTasks.sort((a, b) => b.priority.compareTo(a.priority));

    // 开始处理任务
    _processNextTasks();
  }

  /// 提交单个任务
  Future<void> submitTask(SyncTask task) async {
    LogService.i('提交任务: ${task.name}', tag: 'SyncManager');
    _pendingTasks.add(task);
    _pendingTasks.sort((a, b) => b.priority.compareTo(a.priority));
    _processNextTasks();
  }

  /// 处理下一批任务
  void _processNextTasks() {
    while (_runningTasks.length < maxConcurrentTasks &&
        _pendingTasks.isNotEmpty) {
      final task = _pendingTasks.removeAt(0);
      _executeTask(task);
    }
  }

  /// 执行任务
  Future<void> _executeTask(SyncTask task) async {
    _runningTasks.add(task);
    task.markAsRunning();

    LogService.i('开始执行任务: ${task.name}', tag: 'SyncManager');

    try {
      if (task.execute != null) {
        await task.execute!(task);
        task.markAsCompleted();
        LogService.i('任务完成: ${task.name}', tag: 'SyncManager');
      } else {
        task.markAsFailed('任务没有执行函数');
        LogService.w('任务失败: ${task.name} - 没有执行函数', tag: 'SyncManager');
      }
    } catch (e, stackTrace) {
      task.markAsFailed(e.toString());
      LogService.e(
        '任务失败: ${task.name}\n错误: $e',
        stackTrace: stackTrace.toString(),
        tag: 'SyncManager',
      );
    } finally {
      _runningTasks.remove(task);
      _completedTasks.add(task);

      // 限制历史任务数量
      if (_completedTasks.length > 50) {
        _completedTasks.removeAt(0);
      }

      // 处理下一个任务
      _processNextTasks();
    }
  }

  /// 取消任务
  Future<void> cancelTask(String taskId) async {
    // 从等待队列中移除
    final pendingTask = _pendingTasks.firstWhereOrNull((t) => t.id == taskId);
    if (pendingTask != null) {
      pendingTask.markAsCancelled();
      _pendingTasks.remove(pendingTask);
      _completedTasks.add(pendingTask);
      print('🚫 任务已取消: ${pendingTask.name}');
      return;
    }

    // 正在运行的任务暂时无法取消（需要任务执行函数支持）
    final runningTask = _runningTasks.firstWhereOrNull((t) => t.id == taskId);
    if (runningTask != null) {
      print('⚠️  任务正在执行，暂时无法取消: ${runningTask.name}');
    }
  }

  /// 取消所有等待中的任务
  Future<void> cancelAllPendingTasks() async {
    final tasks = List<SyncTask>.from(_pendingTasks);
    for (final task in tasks) {
      await cancelTask(task.id);
    }
  }

  /// 清除已完成的任务历史
  void clearCompletedTasks() {
    _completedTasks.clear();
  }

  /// 创建平台全量同步任务
  Future<void> syncPlatform(IPlatform platform, Account account) async {
    final taskGroup = platform.createFullSyncTasks(account);
    await submitTaskGroup(taskGroup);
  }

  /// 创建平台增量同步任务
  Future<void> syncPlatformIncremental(
    IPlatform platform,
    Account account,
  ) async {
    if (!platform.supportsIncrementalSync) {
      print('⚠️  平台 ${platform.name} 不支持增量同步');
      return;
    }

    final taskGroup = platform.createIncrementalSyncTasks(account);
    if (taskGroup != null) {
      await submitTaskGroup(taskGroup);
    }
  }

  @override
  void onClose() {
    // 关闭所有流控制器
    for (final controller in _taskStreamControllers.values) {
      controller.close();
    }
    _taskStreamControllers.clear();
    super.onClose();
  }
}
