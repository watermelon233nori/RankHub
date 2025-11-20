import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/modules/musedash/services/musedash_login_handler.dart';
import 'package:rank_hub/modules/musedash/services/musedash_credential_provider.dart';
import 'package:rank_hub/modules/musedash/musedash_game.dart';
import 'package:rank_hub/modules/musedash/widgets/player_info_card.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';

/// MuseDash.moe 平台
/// 提供 Muse Dash 数据查询服务
class MuseDashPlatform extends BasePlatform {
  // 单例模式
  static final MuseDashPlatform _instance = MuseDashPlatform._internal();
  factory MuseDashPlatform() => _instance;

  MuseDashPlatform._internal()
    : super(
        id: 'musedash',
        platform: Platform.musedash,
        name: 'MuseDash.moe',
        description: 'Muse Dash 数据查询平台',
        icon: Icons.music_note_outlined,
        iconUrl: 'https://musedash.moe/img/icons/android-chrome-512x512.png',
        color: Colors.pink,
        sortOrder: 10,
      );

  // 懒加载的服务实例
  late final MuseDashLoginHandler _loginHandler = MuseDashLoginHandler();
  late final MuseDashCredentialProvider _credentialProvider =
      MuseDashCredentialProvider();
  late final List<IGame> _games = [MuseDashGame()];

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

    // 任务示例: 同步基础数据
    tasks.add(
      SyncTask(
        id: 'musedash_sync_metadata_${DateTime.now().millisecondsSinceEpoch}',
        name: '同步基础数据',
        description: '正在准备同步数据...',
        type: SyncTaskType.metadata,
        platformId: id,
        priority: 10,
        execute: (task) async {
          // TODO: 实现数据同步逻辑
          task.updateProgress(0.5, description: '同步中...');
          await Future.delayed(const Duration(seconds: 1));
          task.updateProgress(1.0, description: '同步完成');
        },
      ),
    );

    return SyncTaskGroup(
      id: 'musedash_full_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: 'MuseDash 平台全量同步',
      platformId: id,
      tasks: tasks,
      parallel: false,
    );
  }

  @override
  SyncTaskGroup? createIncrementalSyncTasks(Account account) => null;

  @override
  bool get supportsIncrementalSync => false;

  // ========== UI相关 ==========

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    if (account.apiKey == null) {
      return const SizedBox.shrink();
    }

    final userUuid = account.apiKey!;

    return FutureBuilder(
      future: MuseDashIsarService.instance.getPlayerByUuid(userUuid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Card(
            margin: EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('加载失败: ${snapshot.error}'),
            ),
          );
        }

        final player = snapshot.data;
        if (player == null) {
          return const SizedBox.shrink();
        }

        return PlayerInfoCard(player: player);
      },
    );
  }
}
