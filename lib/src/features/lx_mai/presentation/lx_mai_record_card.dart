import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_service.dart';

class LxMaiRecordCard extends ConsumerWidget {
  final SongScore recordData;

  const LxMaiRecordCard(this.recordData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelPrefix = LevelIndex.fromValue(recordData.levelIndex).label;
    final achievement = recordData.achievements.toStringAsFixed(4);
    final intPart = achievement.split('.')[0];
    final decimalPart = achievement.split('.')[1];
    final imageUrl =
        "https://assets2.lxns.net/maimai/jacket/${recordData.id}.png";
    final levelColor = LxMaiService().getLevelChipColor(recordData.levelIndex);
    final typeColor = LxMaiService().getTypeChipColor(recordData.type);
    final fcColor = LxMaiService().getFcChipColor(recordData.fc);
    final fsColor = LxMaiService().getFsChipColor(recordData.fs);

    return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstIn,
                child: Opacity(
                    opacity: 0.4,
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      fadeInDuration: const Duration(milliseconds: 500),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          recordData.songName!,
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Chip(
                        side: const BorderSide(width: 0),
                        label: Text(
                          "$levelPrefix ${recordData.level}",
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: levelColor,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        side: const BorderSide(width: 0),
                        label: Text(
                          recordData.type == 'standard' ? '标准' : 'DX',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: typeColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            TextSpan(
                              text: intPart,
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '.$decimalPart%',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      if (recordData.fc != null)
                        Chip(
                          side: const BorderSide(width: 0),
                          label: Text(
                            FCType.fromValue(recordData.fc!)!.label,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: fcColor,
                        ),
                      const SizedBox(width: 8),
                      if (recordData.fs != null)
                        Chip(
                          side: const BorderSide(width: 0),
                          label: Text(
                            FSType.fromValue(recordData.fs!)!.label,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: fsColor,
                        ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DX Score: ${recordData.dxScore}"),
                      Text(
                          "Rating: ${recordData.dxRating!.toStringAsFixed(0)}"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
