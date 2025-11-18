import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/lxns/maimai_lxns.dart';
import 'package:rank_hub/modules/lxns/records_tab.dart';
import 'package:rank_hub/modules/lxns/best50_tab.dart';
import 'package:rank_hub/modules/lxns/widgets/player_info_card.dart';
import 'package:rank_hub/models/maimai/player.dart';
import 'package:rank_hub/controllers/account_controller.dart';

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
        label: '全部成绩',
        icon: Icons.poll,
        builder: (context) => const RecordsTab(),
      ),
      GameContentView(
        label: 'B50',
        icon: Icons.flag,
        builder: (context) => const Best50Tab(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context) {
    print('buildPlayerInfoCard called');
    return FutureBuilder<Player?>(
      future: _loadPlayerInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Card(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  '加载玩家信息失败: ${snapshot.error}',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
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

  Future<Player?> _loadPlayerInfo() async {
    final accountController = Get.find<AccountController>();
    final currentAccount = accountController.currentAccount;
    final credentialProvider = LxnsCredentialProvider();

    if (currentAccount == null) {
      return null;
    }

    final account = await credentialProvider.getCredential(currentAccount);

    final accessToken = account.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      return null;
    }

    try {
      final apiService = MaimaiApiService.instance;
      return await apiService.getPlayerInfo(accessToken: accessToken);
    } catch (e) {
      rethrow;
    }
  }
}
