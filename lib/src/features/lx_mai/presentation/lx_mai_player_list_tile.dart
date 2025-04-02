import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';

class LxMaiPlayerListTile extends ConsumerWidget {
  final PlayerData playerData;

  const LxMaiPlayerListTile({super.key, required this.playerData});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
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
                    image: NetworkImage(
                      'https://assets2.lxns.net/maimai/plate/${playerData.namePlate?.id}.png',
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
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl:
                    'https://assets2.lxns.net/maimai/icon/${playerData.icon?.id}.png',
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 500),
                placeholder: (context, url) => Transform.scale(
                  scale: 0.4,
                  child: const CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
            title: Text(playerData.name), // 玩家姓名
            subtitle: const Text('舞萌 DX'),
          ),
        ],
      ),
    );
  }
}
