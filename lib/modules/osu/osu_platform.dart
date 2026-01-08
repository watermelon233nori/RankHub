import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/platform.dart';
import 'package:rank_hub/models/platform_feature_item.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/modules/osu/osu_game.dart';
import 'package:rank_hub/modules/osu/pages/osu_mods_page.dart';
import 'package:rank_hub/modules/osu/services/osu_credential_provider.dart';
import 'package:rank_hub/modules/osu/services/osu_login_handler.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';

class OsuPlatform extends BasePlatform {
  static final OsuPlatform _instance = OsuPlatform._internal();

  factory OsuPlatform() {
    return _instance;
  }

  OsuPlatform._internal()
    : super(
        id: 'osu',
        platform: Platform.osu,
        name: 'osu!',
        description: 'osu! rhythm game',
        icon: Icons.circle_outlined,
        iconUrl: 'https://osu.ppy.sh/favicon.ico',
        color: Colors.pink,
        isEnabled: true,
        sortOrder: 10,
      );

  late final OsuLoginHandler _loginHandler = OsuLoginHandler();
  late final OsuCredentialProvider _credentialProvider =
      OsuCredentialProvider();
  late final List<IGame> _games = [OsuGame()];

  @override
  PlatformLoginHandler get loginHandler => _loginHandler;

  @override
  CredentialProvider get credentialProvider => _credentialProvider;

  @override
  List<IGame> getGames() => _games;

  @override
  List<PlatformFeatureItem> getCustomFeatures(
    BuildContext context,
    Account account,
  ) {
    return [
      PlatformFeatureItem(
        title: 'Mods 一览',
        description: '查看所有游戏 Mod 的详细信息',
        icon: Icons.extension,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OsuModsPage()),
          );
        },
      ),
    ];
  }

  @override
  SyncTaskGroup createFullSyncTasks(Account account) {
    final tasks = <SyncTask>[];

    tasks.add(
      SyncTask(
        id: 'osu_sync_metadata_${DateTime.now().millisecondsSinceEpoch}',
        name: 'Sync osu! data',
        description: 'Syncing osu! user data...',
        type: SyncTaskType.metadata,
        platformId: id,
        priority: 10,
        execute: (task) async {
          // Data is already fetched during login, maybe we can re-fetch here
          task.updateProgress(1.0, description: 'Sync complete');
        },
      ),
    );

    return SyncTaskGroup(
      id: 'osu_full_sync_${DateTime.now().millisecondsSinceEpoch}',
      name: 'osu! Full Sync',
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
