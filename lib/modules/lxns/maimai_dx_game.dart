import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/lxns/maimai_lxns.dart';
import 'package:rank_hub/modules/lxns/records_tab.dart';
import 'package:rank_hub/modules/lxns/best50_tab.dart';
import 'package:rank_hub/modules/lxns/pages/collection_progress_page.dart';
import 'package:rank_hub/modules/lxns/widgets/player_info_card.dart';
import 'package:rank_hub/models/maimai/player.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/modules/lxns/services/lxns_api_response.dart';

/// 舞萌DX 游戏
class MaimaiDXGame extends BaseGame {
  MaimaiDXGame()
    : super(
        id: 'maimai_dx',
        name: '舞萌DX',
        description: '街机音乐游戏 舞萌DX',
        icon: Icons.music_note_outlined,
        iconUrl: 'https://map.bemanicn.com/imgs/titles/maimaidx.png',
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
      GameContentView(
        label: '藏品进度',
        icon: Icons.collections_bookmark,
        builder: (context) => const CollectionProgressPage(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
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

    try {
      final account = await credentialProvider.getCredential(currentAccount);

      final accessToken = account.accessToken;
      if (accessToken == null || accessToken.isEmpty) {
        return null;
      }

      final apiService = MaimaiApiService.instance;
      return await apiService.getPlayerInfo(accessToken: accessToken);
    } on CredentialExpiredException catch (e) {
      print('凭据已失效: $e');
      Get.snackbar(
        '凭据已失效',
        '请在账号管理页面重新登录',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    } on LxnsApiException catch (e) {
      if (e.isNotFound) {
        print('玩家档案不存在(404): $e');
        Get.snackbar(
          '玩家档案不存在',
          '请前往落雪咖啡屋官网同步一次数据来创建玩家档案',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
        );
        return null;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
