import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/osu/pages/osu_beatmap_list_page.dart';
import 'package:rank_hub/modules/osu/services/osu_isar_service.dart';
import 'package:rank_hub/modules/osu/widgets/osu_player_info_card.dart';

class OsuGame extends IGame {
  @override
  String get id => 'osu';

  @override
  String get name => 'osu!';

  @override
  String get description => 'osu! rhythm game';

  @override
  IconData get icon => Icons.circle_outlined;

  @override
  String? get iconUrl => 'https://osu.ppy.sh/favicon.ico';

  @override
  Color? get color => Colors.pink;

  @override
  bool get isEnabled => true;

  @override
  int get sortOrder => 0;

  @override
  void onSelected() {
    // Optional: Analytics or logic when game is selected
  }

  @override
  Future<void> initialize() async {
    // Initialization logic
  }

  @override
  void dispose() {
    // Cleanup logic
  }

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '谱面商店',
        icon: Icons.storefront,
        builder: (context) => const OsuBeatmapListPage(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: '最近游玩',
        icon: Icons.history,
        builder: (context) => const _OsuRecentPlaysTab(),
      ),
      GameContentView(
        label: '最佳表现',
        icon: Icons.emoji_events_outlined,
        builder: (context) => const _OsuBestPlaysTab(),
      ),
      GameContentView(
        label: '第一名排行',
        icon: Icons.looks_one_outlined,
        builder: (context) => const _OsuFirstPlaysTab(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    final externalId = account.externalId;
    final userId = int.tryParse(externalId);

    if (userId == null) {
      return const SizedBox.shrink();
    }

    return FutureBuilder(
      future: OsuIsarService.instance.getUser(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text('加载用户数据失败: ${snapshot.error}'),
            ),
          );
        }

        final user = snapshot.data;
        if (user == null) {
          return const SizedBox.shrink();
        }

        return OsuPlayerInfoCard(user: user);
      },
    );
  }
}

// ========== Placeholder Widgets ==========

class _OsuRecentPlaysTab extends StatelessWidget {
  const _OsuRecentPlaysTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('最近游玩'),
          SizedBox(height: 8),
          Text('开发中...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _OsuBestPlaysTab extends StatelessWidget {
  const _OsuBestPlaysTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.emoji_events_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('最佳表现'),
          SizedBox(height: 8),
          Text('开发中...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _OsuFirstPlaysTab extends StatelessWidget {
  const _OsuFirstPlaysTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.looks_one_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('第一名排行'),
          SizedBox(height: 8),
          Text('开发中...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
