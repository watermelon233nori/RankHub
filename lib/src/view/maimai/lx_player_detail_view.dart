import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/utils/common.dart';
import 'package:rank_hub/src/view/maimai/lx_mai_play_heatmap.dart';

class LxPlayerDetailView extends StatefulWidget {
  const LxPlayerDetailView({super.key, required this.player});

  final PlayerData player;

  @override
  State<LxPlayerDetailView> createState() => _LxPlayerDetailViewState();
}

class _LxPlayerDetailViewState extends State<LxPlayerDetailView> {
  final Map<String, Color> _trophyColors = {
    'Normal': Colors.grey,
    'Bronze': Colors.brown,
    'Silver': Colors.blueGrey,
    'Gold': Colors.amber,
    'Rainbow': Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
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
                    'https://assets.lxns.net/maimai/icon/${widget.player.icon?.id}.png',
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 500),
              ),
              title: Text(widget.player.name),
              subtitle: Text(widget.player.trophy?.name ?? '未知',
                  style: TextStyle(
                    color:
                        _trophyColors[widget.player.trophy?.color ?? 'Normal']!,
                  )),
            ),
            ListTile(
              title: Text(widget.player.friendCode.toString()),
              subtitle: const Text('好友码'),
              trailing: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.player.friendCode.toString()));
                  HapticFeedback.lightImpact();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('好友码已复制')),
                  );
                },
              ),
            ),
            ListTile(
              title: Text(Common.formatDateTime(widget.player.uploadTime, format: 'yyyy-MM-dd HH:mm:ss')),
              subtitle: const Text('上次同步时间'),
              trailing: Text(Common.getTimeAgo(widget.player.uploadTime)),
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
                      Text(widget.player.rating.toString(),
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
                          Text(widget.player.star.toString(),
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
                              'https://maimai.lxns.net/assets/maimai/course_rank/${widget.player.courseRank}.webp',
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
                              'https://maimai.lxns.net/assets/maimai/class_rank/${widget.player.classRank}.webp',
                          width: 92,
                          height: 48),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            LxMaiPlayHeatMap(playerData: widget.player),
            SizedBox(height: 32),
          ],
        )));
  }
}
