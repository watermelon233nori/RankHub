import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/musedash/pages/musedash_wiki_page.dart';
import 'package:rank_hub/modules/musedash/pages/musedash_characters_page.dart';
import 'package:rank_hub/modules/musedash/pages/musedash_elfins_page.dart';
import 'package:rank_hub/modules/musedash/pages/musedash_scores_page.dart';
import 'package:rank_hub/modules/musedash/pages/musedash_all_scores_page.dart';
import 'package:rank_hub/modules/musedash/widgets/player_info_card.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';

/// Muse Dash 游戏实现
class MuseDashGame extends IGame {
  @override
  String get id => 'musedash';

  @override
  String get name => 'Muse Dash';

  @override
  String get description => '一款音乐跑酷游戏';

  @override
  IconData get icon => Icons.music_note;

  @override
  String? get iconUrl =>
      'https://musedash.moe/img/icons/android-chrome-512x512.png';

  @override
  Color? get color => Colors.pink;

  @override
  bool get isEnabled => true;

  @override
  int get sortOrder => 0;

  @override
  void onSelected() {
    print('Muse Dash 游戏被选中');
  }

  @override
  Future<void> initialize() async {
    // TODO: 初始化游戏相关服务
  }

  @override
  void dispose() {
    // TODO: 清理资源
  }

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '曲库',
        icon: Icons.library_music,
        builder: (ctx) => const MuseDashWikiPage(),
      ),
      GameContentView(
        label: '角色',
        icon: Icons.person,
        builder: (ctx) => const MuseDashCharactersPage(),
      ),
      GameContentView(
        label: '精灵',
        icon: Icons.pets,
        builder: (ctx) => const MuseDashElfinsPage(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: 'Best 30',
        icon: Icons.emoji_events,
        builder: (ctx) => const MuseDashScoresPage(),
      ),
      GameContentView(
        label: '所有成绩',
        icon: Icons.list,
        builder: (ctx) => const MuseDashAllScoresPage(),
      ),
    ];
  }

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
