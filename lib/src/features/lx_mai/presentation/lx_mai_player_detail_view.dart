import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_provider.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';
import 'package:rank_hub/src/utils/common.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_play_heatmap.dart';

class LxMaiPlayerDetailView extends ConsumerWidget {
  const LxMaiPlayerDetailView({super.key, required this.uuid});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerData = ref.watch(playerDataProvider(uuid));

    return switch (playerData) {
      AsyncData(:final valueOrNull?) => _buildContent(context, valueOrNull),
      AsyncError(:final error, :final stackTrace) => ErrorView(
          errorMessage: error.toString(),
          errorDetails: stackTrace.toString(),
        ),
      _ => const LoadingView(),
    };
  }

  Widget _buildContent(BuildContext context, PlayerData? player) {
    if (player == null) {
      return const Center(child: Text('没有数据'));
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('玩家详情'),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ListTile(
              leading: CachedNetworkImage(
                imageUrl:
                    'https://assets.lxns.net/maimai/icon/${player.icon?.id}.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 500),
              ),
              title: Text(player.name),
              subtitle: Text(player.trophy?.name ?? '未知',
                  style: TextStyle(
                    color:
                        TrophyColor.fromLabel(player.trophy?.color ?? 'Normal')!
                            .color,
                  )),
            ),
            ListTile(
              title: Text(player.friendCode.toString()),
              subtitle: const Text('好友码'),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(
                      ClipboardData(text: player.friendCode.toString()));
                  HapticFeedback.lightImpact();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('好友码已复制')),
                  );
                },
              ),
            ),
            ListTile(
              title: Text(Common.formatDateTime(player.uploadTime,
                  format: 'yyyy-MM-dd HH:mm:ss')),
              subtitle: const Text('上次同步时间'),
              trailing: Text(Common.getTimeAgo(player.uploadTime)),
            ),
            SizedBox(height: 24),
            Divider(),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('DX Rating'),
                      SizedBox(height: 8),
                      Text(player.rating.toString(),
                          style: const TextStyle(fontSize: 24)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('搭档觉醒数'),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                              imageUrl:
                                  'https://maimai.lxns.net/assets/maimai/icon_star.webp',
                              width: 24,
                              height: 24),
                          Text('×', style: const TextStyle(fontSize: 24)),
                          Text(player.star.toString(),
                              style: const TextStyle(fontSize: 24)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '段位',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      SizedBox(height: 8),
                      CachedNetworkImage(
                          imageUrl:
                              'https://maimai.lxns.net/assets/maimai/course_rank/${player.courseRank}.webp',
                          width: 92,
                          height: 48),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '阶级',
                        style: TextStyle(color: Theme.of(context).hintColor),
                      ),
                      SizedBox(height: 8),
                      CachedNetworkImage(
                          imageUrl:
                              'https://maimai.lxns.net/assets/maimai/class_rank/${player.classRank}.webp',
                          width: 92,
                          height: 48),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            LxMaiPlayHeatMap(playerData: player),
            SizedBox(height: 32),
          ],
        )));
  }
}
