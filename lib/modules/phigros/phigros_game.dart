import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';

/// Phigros 游戏
class PhigrosGame extends BaseGame {
  PhigrosGame()
    : super(
        id: 'phigros',
        name: 'Phigros',
        description: '星途音游 Phigros',
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
    // TODO: 实现Wiki视图
    // 示例:
    // return [
    //   GameContentView(
    //     label: '曲目',
    //     icon: Icons.library_music_outlined,
    //     builder: (context) => const PhigrosSongsTab(),
    //   ),
    // ];
    return [];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    // TODO: 实现Rank视图
    // 示例:
    // return [
    //   GameContentView(
    //     label: '全部成绩',
    //     icon: Icons.poll,
    //     builder: (context) => const PhigrosRecordsTab(),
    //   ),
    // ];
    return [];
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) {
    // TODO: 实现玩家信息卡片
    // 示例:
    // return FutureBuilder<PhigrosPlayer?>(
    //   future: _loadPlayerInfo(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Card(
    //         margin: EdgeInsets.symmetric(horizontal: 16),
    //         child: Padding(
    //           padding: EdgeInsets.all(24),
    //           child: Center(child: CircularProgressIndicator()),
    //         ),
    //       );
    //     }
    //     if (snapshot.hasData) {
    //       return PhigrosPlayerInfoCard(player: snapshot.data!);
    //     }
    //     return const SizedBox.shrink();
    //   },
    // );
    return null;
  }

  @override
  Future<void> initialize() async {
    // TODO: 初始化游戏相关服务
    // 例如: 初始化数据库服务、API服务等
  }

  @override
  void dispose() {
    // TODO: 清理资源
  }
}
