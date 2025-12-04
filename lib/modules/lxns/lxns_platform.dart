import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/platform_feature_item.dart';
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

          try {
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
          } on CredentialExpiredException catch (e) {
            throw Exception('凭据已失效: ${e.message}，请在账号管理页面重新登录');
          }
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
      final card = game.buildPlayerInfoCard(context, account);
      if (card != null) {
        playerCards.add(card);
      }
    }

    if (playerCards.isEmpty) {
      print('No player info cards available');
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

  @override
  List<PlatformFeatureItem> getCustomFeatures(
    BuildContext context,
    Account account,
  ) {
    return [
      // 示例功能1: 访问官网
      PlatformFeatureItem(
        title: '访问官网',
        description: '跳转到落雪咖啡屋官方网站',
        icon: Icons.language,
        onTap: () {
          // 这里可以实现打开浏览器跳转到官网的逻辑
          Get.snackbar(
            '提示',
            '即将跳转到落雪咖啡屋官网',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
      ),

      // 示例功能2: 数据导出
      PlatformFeatureItem(
        title: '导出数据',
        description: '将成绩数据导出为 JSON 文件',
        icon: Icons.download,
        badge: 'Beta',
        onTap: () {
          Get.snackbar('提示', '数据导出功能开发中', snackPosition: SnackPosition.BOTTOM);
        },
      ),

      // 示例功能3: 统计分析
      PlatformFeatureItem(
        title: '统计分析',
        description: '查看详细的成绩统计和趋势分析',
        icon: Icons.analytics,
        iconColor: Colors.white,
        iconBackgroundColor: Colors.blue,
        onTap: () {
          Get.snackbar('提示', '统计分析功能即将推出', snackPosition: SnackPosition.BOTTOM);
        },
      ),

      // 示例功能4: 账号设置（禁用状态示例）
      PlatformFeatureItem(
        title: '高级设置',
        description: '配置数据同步和缓存选项',
        icon: Icons.tune,
        enabled: false, // 禁用状态
        onTap: () {},
      ),
    ];
  }
}
