import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/strategy_manager.dart';
import 'package:rank_hub/src/core/player_manager.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class PlayerListView extends ConsumerWidget {
  const PlayerListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerProvider = ref.watch(playerManagerProvider);
    final dataSourceNotifier = ref.read(strategyManagerProvider.notifier);

    return switch (playerProvider) {
      AsyncData(:final valueOrNull?) => valueOrNull.players.isEmpty
          ? const Center(
              child: Text(
                "没有玩家数据\n点击下方按钮添加一个新玩家",
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: valueOrNull.players.length,
              itemBuilder: (ctx, index) {
                final player = valueOrNull.players[index];
                final dataSource =
                    dataSourceNotifier.getStrategy(player.provider)!;

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return dataSource.getPlayerDetailView(player.uuid);
                    }));
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
                                      child: const CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.image_not_supported),
                                  ),
                                ),
                          title: Text(player.name),
                          subtitle: Text(dataSource.getGameName()),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      AsyncError(:final error, :final stackTrace) => ErrorView(
          errorMessage: error.toString(),
          errorDetails: stackTrace.toString(),
        ),
      _ => const LoadingView(),
    };
  }
}