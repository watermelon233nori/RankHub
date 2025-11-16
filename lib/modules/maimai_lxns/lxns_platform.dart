import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/maimai_lxns/services/lxns_login_handler.dart';
import 'package:rank_hub/modules/maimai_lxns/services/lxns_credential_provider.dart';
import 'package:rank_hub/modules/maimai_lxns/services/maimai_api_service.dart';
import 'package:rank_hub/modules/maimai_lxns/maimai_dx_game.dart';

/// 落雪咖啡屋平台（LXNS）
/// 提供舞萌DX数据查询服务
class LxnsPlatform extends BasePlatform {
  // 单例模式
  static final LxnsPlatform _instance = LxnsPlatform._internal();
  factory LxnsPlatform() => _instance;

  LxnsPlatform._internal()
    : super(
        id: 'lxns',
        platform: Platform.lxns,
        name: '落雪咖啡屋',
        description: '舞萌DX数据查询平台',
        icon: Icons.coffee_outlined,
        iconUrl: 'https://maimai.lxns.net/favicon.webp',
        backgroundUrl: 'https://maimai.lxns.net/logo_background.webp',
        color: Colors.brown,
        sortOrder: 0,
      );

  // 懒加载的服务实例
  late final LxnsLoginHandler _loginHandler = LxnsLoginHandler();
  late final LxnsCredentialProvider _credentialProvider =
      LxnsCredentialProvider();
  late final List<IGame> _games = [MaimaiDXGame()];

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

    // 任务: 同步所有数据（曲目+收藏品）
    tasks.add(
      SyncTask(
        id: 'lxns_sync_all_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步所有数据',
        description: '正在准备同步...',
        type: SyncTaskType.metadata,
        platformId: id,
        priority: 10,
        execute: (task) async {
          await MaimaiApiService.instance.syncAllDataToDatabase(
            onProgress: (current, total, description) {
              final progress = current / total;
              task.updateProgress(progress, description: description);
            },
          );
        },
      ),
    );

    return SyncTaskGroup(
      id: 'lxns_full_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: '落雪平台全量同步',
      platformId: id,
      tasks: tasks,
      parallel: false,
    );
  }

  @override
  SyncTaskGroup? createIncrementalSyncTasks(Account account) => null;

  @override
  bool get supportsIncrementalSync => false;
}
