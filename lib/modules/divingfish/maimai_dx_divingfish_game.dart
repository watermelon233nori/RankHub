import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/divingfish/pages/divingfish_songs_tab.dart';
import 'package:rank_hub/modules/divingfish/pages/divingfish_records_tab.dart';
import 'package:rank_hub/modules/divingfish/pages/divingfish_best50_tab.dart';

/// 水鱼查分器 - 舞萌DX 游戏
class MaimaiDXDivingFishGame extends BaseGame {
  MaimaiDXDivingFishGame()
    : super(
        id: 'maimai_dx_divingfish',
        name: '舞萌DX',
        description: '街机音乐游戏 舞萌DX（水鱼查分器）',
        icon: Icons.music_note_outlined,
        iconUrl: 'https://map.bemanicn.com/imgs/titles/maimaidx.png',
        color: Colors.pink,
        sortOrder: 0,
        tags: ['音游', '街机', 'maimai'],
        metadata: {'platform': 'arcade', 'developer': 'SEGA'},
      );

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '曲目列表',
        icon: Icons.library_music_outlined,
        builder: (context) => const DivingFishSongsTab(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: '全部成绩',
        icon: Icons.poll_outlined,
        builder: (context) => const DivingFishRecordsTab(),
      ),
      GameContentView(
        label: 'B50',
        icon: Icons.star_outlined,
        builder: (context) => const DivingFishBest50Tab(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    // TODO: 实现更详细的玩家信息卡片
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('玩家信息', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            const Text('水鱼查分器 - 舞萌DX'),
            Text('账号: ${account.username ?? "未知"}'),
          ],
        ),
      ),
    );
  }
}
