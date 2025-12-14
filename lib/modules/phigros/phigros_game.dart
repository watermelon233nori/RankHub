import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/modules/phigros/phigros_controller.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_song_list_view.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_record_list_view.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_b30_view.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_player_info_card.dart';
import 'package:rank_hub/modules/phigros/services/phigros_isar_service.dart';

/// Phigros 游戏
class PhigrosGame extends BaseGame {
  PhigrosGame()
    : super(
        id: 'phigros',
        name: 'Phigros',
        description: '下落式移动端音游',
        icon: Icons.stars_outlined,
        iconUrl:
            'https://img.tapimg.com/market/images/9000b8b031deabbd424b7f2f530ee162.png',
        color: Colors.deepPurple,
        sortOrder: 0,
        tags: ['音游', '手游'],
        metadata: {'platform': 'mobile', 'developer': 'PigeonGames'},
      );

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '曲目',
        icon: Icons.library_music_outlined,
        builder: (context) => const PhigrosSongListView(),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: 'B30',
        icon: Icons.workspace_premium,
        builder: (context) => const PhigrosB30View(),
      ),
      GameContentView(
        label: '全部成绩',
        icon: Icons.poll,
        builder: (context) => const PhigrosRecordListView(),
      ),
    ];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    return FutureBuilder(
      future: _loadPlayerInfo(account),
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
              child: Center(child: Text('加载失败: ${snapshot.error}')),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data as Map<String, dynamic>;
          final records = data['records'] as List;
          final summary = data['summary'];

          return PhigrosPlayerInfoCard(
            records: records.cast(),
            summary: summary,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Future<Map<String, dynamic>?> _loadPlayerInfo(Account account) async {
    try {
      final records = await PhigrosIsarService.instance.getGameRecords(
        account.id.toString(),
      );
      final summary = await PhigrosIsarService.instance.getPlayerSummary(
        account.id.toString(),
      );

      return {'records': records, 'summary': summary};
    } catch (e) {
      print('❌ 加载玩家信息失败: $e');
      rethrow;
    }
  }

  @override
  Future<void> initialize() async {
    // 注册控制器
    if (!Get.isRegistered<PhigrosController>()) {
      Get.put(PhigrosController());
    }
  }

  @override
  void onSelected() {
    // 当游戏被选中时，确保控制器已注册
    if (!Get.isRegistered<PhigrosController>()) {
      Get.put(PhigrosController());
    }
  }

  @override
  void dispose() {
    // 清理资源
    if (Get.isRegistered<PhigrosController>()) {
      Get.delete<PhigrosController>();
    }
  }
}
