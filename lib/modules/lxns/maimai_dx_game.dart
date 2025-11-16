import 'package:flutter/material.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/lxns/songs_tab.dart';
import 'package:rank_hub/modules/lxns/collections_tab.dart';

/// 舞萌DX 游戏
class MaimaiDXGame extends BaseGame {
  MaimaiDXGame()
    : super(
        id: 'maimai_dx',
        name: '舞萌DX',
        description: '街机音乐游戏 舞萌DX',
        icon: Icons.music_note_outlined,
        iconUrl: 'https://maimai.lxns.net/favicon.webp',
        color: Colors.pink,
        sortOrder: 0,
        tags: ['音游', '街机'],
        metadata: {'platform': 'arcade', 'developer': 'SEGA'},
      );

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '曲目',
        icon: Icons.library_music_outlined,
        builder: (context) => const SongsTab(),
      ),
      GameContentView(
        label: '收藏品',
        icon: Icons.collections_outlined,
        builder: (context) => const CollectionsTab(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: '排行榜',
        icon: Icons.leaderboard_outlined,
        builder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.leaderboard_outlined, size: 80, color: color),
              const SizedBox(height: 20),
              Text(
                '舞萌DX 排行榜',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '排行榜功能开发中...',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
