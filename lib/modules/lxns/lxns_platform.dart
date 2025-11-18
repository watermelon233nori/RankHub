import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/lxns/services/lxns_login_handler.dart';
import 'package:rank_hub/modules/lxns/services/lxns_credential_provider.dart';
import 'package:rank_hub/modules/lxns/services/maimai_api_service.dart';
import 'package:rank_hub/modules/lxns/maimai_dx_game.dart';

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

    // 任务1: 同步基础数据（曲目+收藏品）
    tasks.add(
      SyncTask(
        id: 'lxns_sync_metadata_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步基础数据',
        description: '正在准备同步曲目和收藏品...',
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

    // 任务2: 同步玩家成绩
    tasks.add(
      SyncTask(
        id: 'lxns_sync_scores_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步玩家成绩',
        description: '正在准备同步成绩数据...',
        type: SyncTaskType.scores,
        platformId: id,
        priority: 20,
        execute: (task) async {
          task.updateProgress(0, description: '正在获取访问令牌...');

          // 使用 credentialProvider 获取凭据（自动处理刷新）
          final updatedAccount = await _credentialProvider.getCredential(
            account,
          );
          final accessToken = updatedAccount.accessToken;

          if (accessToken == null || accessToken.isEmpty) {
            throw Exception('访问令牌不存在，请重新登录');
          }

          task.updateProgress(0.1, description: '正在同步玩家成绩...');
          await MaimaiApiService.instance.syncPlayerScoresToDatabase(
            accessToken: accessToken,
            onProgress: (current, total, description) {
              // 将进度映射到 0.1 - 1.0 范围
              final progress = 0.1 + (current / total) * 0.9;
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

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    // 聚合所有游戏的玩家信息卡片
    final games = getEnabledGames();
    final playerCards = <Widget>[];

    for (final game in games) {
      final card = game.buildPlayerInfoCard(context);
      if (card != null) {
        playerCards.add(card);
      }
    }

    if (playerCards.isEmpty) {
      return null;
    }

    // 如果只有一个游戏，直接返回其卡片
    if (playerCards.length == 1) {
      return playerCards.first;
    }

    // 多个游戏时，使用列布局展示
    return Column(
      children: [
        for (int i = 0; i < playerCards.length; i++) ...[
          playerCards[i],
          if (i < playerCards.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}
