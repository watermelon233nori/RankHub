import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_login_handler.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_credential_provider.dart';
import 'package:rank_hub/modules/divingfish/maimai_dx_divingfish_game.dart';

/// 水鱼查分器平台（Diving-Fish）
/// 提供舞萌DX和中二节奏数据查询服务
class DivingFishPlatform extends BasePlatform {
  // 单例模式
  static final DivingFishPlatform _instance = DivingFishPlatform._internal();
  factory DivingFishPlatform() => _instance;

  DivingFishPlatform._internal()
    : super(
        id: 'divingfish',
        platform: Platform.divingFish,
        name: '水鱼查分器',
        description: 'Maimai DX / CHUNITHM 查分器',
        icon: Icons.water_drop_outlined,
        iconUrl: 'https://www.diving-fish.com/favicon.ico',
        backgroundUrl: 'https://www.diving-fish.com/images/maimai_bg.jpg',
        color: const Color(0xFF4FC3F7), // 浅蓝色
        sortOrder: 1,
      );

  // 懒加载的服务实例
  late final DivingFishLoginHandler _loginHandler = DivingFishLoginHandler();
  late final DivingFishCredentialProvider _credentialProvider =
      DivingFishCredentialProvider();
  late final List<IGame> _games = [
    MaimaiDXDivingFishGame(),
    // TODO: 添加 CHUNITHM 游戏
    // ChunithmDivingFishGame(),
  ];

  @override
  PlatformLoginHandler get loginHandler => _loginHandler;

  @override
  CredentialProvider get credentialProvider => _credentialProvider;

  @override
  List<IGame> getGames() => _games;

  @override
  bool get supportsIncrementalSync => false;

  @override
  SyncTaskGroup? createIncrementalSyncTasks(Account account) {
    // 水鱼平台暂不支持增量同步
    return null;
  }

  @override
  Future<void> initialize() async {
    // 初始化平台相关服务
    for (final game in _games) {
      await game.initialize();
    }
  }

  @override
  void dispose() {
    for (final game in _games) {
      game.dispose();
    }
  }

  // ========== 数据同步 ==========

  @override
  SyncTaskGroup createFullSyncTasks(Account account) {
    final tasks = <SyncTask>[];

    // 任务1: 同步曲目数据
    tasks.add(
      SyncTask(
        id: 'divingfish_sync_songs_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步曲目数据',
        description: '正在准备同步曲目列表...',
        type: SyncTaskType.songs,
        platformId: id,
        priority: 10,
        execute: (task) async {
          task.updateProgress(0.0, description: '开始同步曲目数据...');

          // TODO: 实现曲目数据同步
          // await DivingFishApiService.instance.syncSongs(...);

          task.updateProgress(1.0, description: '曲目数据同步完成');
        },
      ),
    );

    // 任务2: 同步玩家成绩
    tasks.add(
      SyncTask(
        id: 'divingfish_sync_scores_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步玩家成绩',
        description: '正在准备同步成绩数据...',
        type: SyncTaskType.scores,
        platformId: id,
        priority: 5,
        execute: (task) async {
          task.updateProgress(0.0, description: '开始同步玩家成绩...');

          // TODO: 实现成绩数据同步
          // await DivingFishApiService.instance.syncPlayerRecords(...);

          task.updateProgress(1.0, description: '成绩数据同步完成');
        },
      ),
    );

    return SyncTaskGroup(
      id: 'divingfish_full_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: '水鱼查分器完整同步',
      platformId: id,
      tasks: tasks,
    );
  }

  /// 创建快速同步任务（自定义方法，非接口要求）
  SyncTaskGroup createQuickSyncTasks(Account account) {
    final tasks = <SyncTask>[];

    // 快速同步只同步玩家成绩
    tasks.add(
      SyncTask(
        id: 'divingfish_quick_sync_${DateTime.now().millisecondsSinceEpoch}',
        name: '快速同步成绩',
        description: '正在同步最新成绩...',
        type: SyncTaskType.scores,
        platformId: id,
        priority: 5,
        execute: (task) async {
          task.updateProgress(0.0, description: '开始快速同步...');

          // TODO: 实现快速同步
          // await DivingFishApiService.instance.quickSyncScores(...);

          task.updateProgress(1.0, description: '快速同步完成');
        },
      ),
    );

    return SyncTaskGroup(
      id: 'divingfish_quick_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: '水鱼查分器快速同步',
      platformId: id,
      tasks: tasks,
    );
  }
}
