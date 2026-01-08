import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';

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
        label: 'Beatmaps',
        icon: Icons.library_music_outlined,
        builder: (context) => const _OsuBeatmapsTab(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: 'Recent',
        icon: Icons.history,
        builder: (context) => const _OsuRecentPlaysTab(),
      ),
      GameContentView(
        label: 'Best',
        icon: Icons.emoji_events_outlined,
        builder: (context) => const _OsuBestPlaysTab(),
      ),
      GameContentView(
        label: 'First',
        icon: Icons.looks_one_outlined,
        builder: (context) => const _OsuFirstPlaysTab(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    // TODO: Implement player info card for osu!
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Player Info', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const Text('osu!'),
            Text(
              'Account: ${account.displayName ?? account.username ?? "Unknown"}',
            ),
            if (account.isTokenExpired)
              const Text('Token Expired', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}

// ========== Placeholder Widgets ==========

class _OsuBeatmapsTab extends StatelessWidget {
  const _OsuBeatmapsTab();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.library_music_outlined, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Beatmaps'),
          SizedBox(height: 8),
          Text('Work in Progress...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

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
          Text('Recent Plays'),
          SizedBox(height: 8),
          Text('Work in Progress...', style: TextStyle(color: Colors.grey)),
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
          Text('Best Performance'),
          SizedBox(height: 8),
          Text('Work in Progress...', style: TextStyle(color: Colors.grey)),
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
          Text('First Place Ranks'),
          SizedBox(height: 8),
          Text('Work in Progress...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
