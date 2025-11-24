import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/phigros/services/phigros_login_handler.dart';
import 'package:rank_hub/modules/phigros/services/phigros_credential_provider.dart';
import 'package:rank_hub/modules/phigros/services/phigros_resource_sync_service.dart';
import 'package:rank_hub/modules/phigros/phigros_game.dart';

/// Phigros平台
/// 提供Phigros数据查询服务
class PhigrosPlatform extends BasePlatform {
  // 单例模式
  static final PhigrosPlatform _instance = PhigrosPlatform._internal();
  factory PhigrosPlatform() => _instance;

  PhigrosPlatform._internal()
    : super(
        id: 'phigros',
        platform: Platform.phigros,
        name: 'Phigros',
        description: 'Phigros节奏游戏数据平台',
        icon: Icons.stars_outlined,
        iconUrl:
            'https://img.tapimg.com/market/images/9000b8b031deabbd424b7f2f530ee162.png',
        color: Colors.deepPurple,
        sortOrder: 10,
      );

  // 懒加载的服务实例
  late final PhigrosLoginHandler _loginHandler = PhigrosLoginHandler();
  late final PhigrosCredentialProvider _credentialProvider =
      PhigrosCredentialProvider();
  late final List<IGame> _games = [PhigrosGame()];

  @override
  PlatformLoginHandler get loginHandler => _loginHandler;

  @override
  CredentialProvider get credentialProvider => _credentialProvider;

  @override
  List<IGame> getGames() => _games;

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

    // 任务1: 同步资源数据（歌曲、收藏品、头像）
    tasks.add(
      SyncTask(
        id: 'phigros_sync_resources_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步游戏资源',
        description: '正在准备同步歌曲、收藏品和头像数据...',
        type: SyncTaskType.metadata,
        platformId: id,
        priority: 10,
        execute: (task) async {
          await PhigrosResourceSyncService.instance.syncAllDataToDatabase(
            onProgress: (current, total, description) {
              final progress = current / total;
              task.updateProgress(progress, description: description);
            },
          );
        },
      ),
    );

    // TODO: 任务2: 同步玩家成绩（需要实现存档解析）
    // tasks.add(
    //   SyncTask(
    //     id: 'phigros_sync_scores_${DateTime.now().millisecondsSinceEpoch}',
    //     name: '同步玩家成绩',
    //     description: '正在准备同步成绩数据...',
    //     type: SyncTaskType.scores,
    //     platformId: id,
    //     priority: 20,
    //     execute: (task) async {
    //       // 实现成绩同步逻辑
    //     },
    //   ),
    // );

    return SyncTaskGroup(
      id: 'phigros_full_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Phigros完整同步',
      tasks: tasks,
      platformId: id,
    );
  }

  @override
  SyncTaskGroup? createIncrementalSyncTasks(Account account) {
    final tasks = <SyncTask>[];

    // 增量同步：仅同步歌曲和收藏品
    tasks.add(
      SyncTask(
        id: 'phigros_quick_sync_${DateTime.now().millisecondsSinceEpoch}',
        name: '快速同步',
        description: '正在快速同步歌曲和收藏品...',
        type: SyncTaskType.metadata,
        platformId: id,
        priority: 10,
        execute: (task) async {
          await PhigrosResourceSyncService.instance.quickSync(
            onProgress: (current, total, description) {
              final progress = current / total;
              task.updateProgress(progress, description: description);
            },
          );
        },
      ),
    );

    return SyncTaskGroup(
      id: 'phigros_incremental_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Phigros增量同步',
      tasks: tasks,
      platformId: id,
    );
  }

  @override
  bool get supportsIncrementalSync => true;
}
