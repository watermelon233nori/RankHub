import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';
import 'package:rank_hub/src/core/player_manager.dart';
import 'package:rank_hub/src/utils/common.dart';

class PlayerListView extends ConsumerWidget {
  const PlayerListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerProvider = ref.watch(playerManagerProvider);
    final dataSourceNotifier = ref.read(dataSourceManagerProvider.notifier);

    return playerProvider.when(
        data: (data) {
          if (data.players.isEmpty) {
            return const Center(child: Text("没有玩家数据\n点击下方按钮添加一个新玩家", textAlign: TextAlign.center,));
          }

          return ListView.builder(
              itemCount: data.players.length,
              itemBuilder: (ctx, index) {
                final player = data.players[index];
                final dataSource =
                    dataSourceNotifier.getDataSource(player.provider)!;

                return GestureDetector(
                    onTap: () {
                      Common.futureNavigator(
                          context: ctx,
                          fetchData: () =>
                              dataSource.getPlayerDetail(player.uuid),
                          builder: (playerData) =>
                              dataSource.buildPlayerDetailScreen(playerData));
                    },
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      child: Stack(
                        children: [
                          if (player.backgroundUrl != null)
                            Positioned.fill(
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent,
                                  ],
                                  tileMode: TileMode.clamp,
                                ).createShader(bounds),
                                blendMode: BlendMode.srcOver,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        player.backgroundUrl!,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          // 玩家信息 (头像和文字)
                          ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            leading: player.avatarUrl == null
                                ? const Icon(Icons.person)
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: CachedNetworkImage(
                                      imageUrl: player.avatarUrl!,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                      fadeInDuration:
                                          const Duration(milliseconds: 500),
                                      placeholder: (context, url) =>
                                          Transform.scale(
                                        scale: 0.4,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                            title: Text(player.name), // 玩家姓名
                            subtitle: Text(dataSource.getProviderGameName()),
                          ),
                        ],
                      ),
                    ));
              });
        },
        error: (_, e) => Center(child: Text("无法加载玩家数据\n$e")),
        loading: () => const CircularProgressIndicator());
  }
}
