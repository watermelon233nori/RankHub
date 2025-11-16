/// 同步任务状态
enum SyncTaskStatus {
  pending, // 等待执行
  running, // 执行中
  completed, // 已完成
  failed, // 失败
  cancelled, // 已取消
}

/// 同步任务类型
enum SyncTaskType {
  songs, // 曲目数据
  collections, // 收藏品数据
  scores, // 成绩数据
  players, // 玩家数据
  metadata, // 元数据（版本、分类等）
  custom, // 自定义任务
}

/// 同步任务
class SyncTask {
  /// 任务ID
  final String id;

  /// 任务名称
  final String name;

  /// 任务描述
  final String description;

  /// 任务类型
  final SyncTaskType type;

  /// 所属平台ID
  final String platformId;

  /// 任务状态
  SyncTaskStatus status;

  /// 进度 (0.0 - 1.0)
  double progress;

  /// 错误信息
  String? error;

  /// 开始时间
  DateTime? startTime;

  /// 完成时间
  DateTime? completedTime;

  /// 任务执行函数
  final Future<void> Function(SyncTask task)? execute;

  /// 任务优先级 (数值越大优先级越高)
  final int priority;

  /// 是否可取消
  final bool cancellable;

  SyncTask({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.platformId,
    this.status = SyncTaskStatus.pending,
    this.progress = 0.0,
    this.error,
    this.startTime,
    this.completedTime,
    this.execute,
    this.priority = 0,
    this.cancellable = true,
  });

  /// 更新进度
  void updateProgress(double value, {String? description}) {
    progress = value.clamp(0.0, 1.0);
    if (description != null) {
      this.description;
    }
  }

  /// 标记为运行中
  void markAsRunning() {
    status = SyncTaskStatus.running;
    startTime = DateTime.now();
  }

  /// 标记为完成
  void markAsCompleted() {
    status = SyncTaskStatus.completed;
    progress = 1.0;
    completedTime = DateTime.now();
  }

  /// 标记为失败
  void markAsFailed(String errorMessage) {
    status = SyncTaskStatus.failed;
    error = errorMessage;
    completedTime = DateTime.now();
  }

  /// 标记为取消
  void markAsCancelled() {
    status = SyncTaskStatus.cancelled;
    completedTime = DateTime.now();
  }

  /// 是否已完成（成功、失败或取消）
  bool get isFinished =>
      status == SyncTaskStatus.completed ||
      status == SyncTaskStatus.failed ||
      status == SyncTaskStatus.cancelled;

  /// 是否成功
  bool get isSuccess => status == SyncTaskStatus.completed;

  /// 执行时长
  Duration? get duration {
    if (startTime == null) return null;
    final endTime = completedTime ?? DateTime.now();
    return endTime.difference(startTime!);
  }

  @override
  String toString() {
    return 'SyncTask(id: $id, name: $name, status: $status, progress: ${(progress * 100).toStringAsFixed(1)}%)';
  }
}

/// 同步任务组
class SyncTaskGroup {
  /// 组ID
  final String id;

  /// 组名称
  final String name;

  /// 平台ID
  final String platformId;

  /// 任务列表
  final List<SyncTask> tasks;

  /// 是否并行执行
  final bool parallel;

  SyncTaskGroup({
    required this.id,
    required this.name,
    required this.platformId,
    required this.tasks,
    this.parallel = false,
  });

  /// 总进度
  double get totalProgress {
    if (tasks.isEmpty) return 0.0;
    return tasks.map((t) => t.progress).reduce((a, b) => a + b) / tasks.length;
  }

  /// 是否全部完成
  bool get isAllCompleted => tasks.every((t) => t.isFinished);

  /// 是否有失败
  bool get hasFailure => tasks.any((t) => t.status == SyncTaskStatus.failed);

  /// 完成的任务数
  int get completedCount =>
      tasks.where((t) => t.status == SyncTaskStatus.completed).length;
}
