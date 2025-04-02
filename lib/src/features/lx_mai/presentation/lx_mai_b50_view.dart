import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_provider.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_service.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/view/maimai/lx_b50_export_view.dart';
import 'package:rank_hub/src/view/maimai/lx_mai_record_card.dart';

class LxMaiB50View extends ConsumerWidget {
  const LxMaiB50View(this.uuid, {super.key});

  final String uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final b50Data = ref.watch(getB50DataProvider(uuid));

    return switch (b50Data) {
      AsyncValue<
            ({
              PlayerData player,
              List<SongScore> b15Records,
              List<SongScore> b35Records,
              int b15Rating,
              int b35Rating,
            })>(:final valueOrNull?) =>
        RefreshIndicator(
          onRefresh: () => ref.refresh(getB50DataProvider(uuid).future),
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 140,
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            const SizedBox(width: 32),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "当前 RATING",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 40, // 明确的高度
                                  child: LxMaiService().getShaderMaskByRating(
                                    valueOrNull.player.rating,
                                    AnimatedDigitWidget(
                                      value: valueOrNull.player.rating,
                                      textStyle: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("当期版本 Rating: ${valueOrNull.b15Rating}"),
                                const SizedBox(height: 16), // 替换 Spacer，避免无约束布局
                                Text("往期版本 Rating: ${valueOrNull.b35Rating}"),
                              ],
                            ),
                            const SizedBox(width: 32),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => LxMaiB50ExportView(
                                        b35Records: valueOrNull.b35Records,
                                        b15Records: valueOrNull.b15Records,
                                        playerData: valueOrNull.player,
                                        playerRating: valueOrNull.player.rating,
                                        currentVerRating: valueOrNull.b15Rating,
                                        pastVerRating: valueOrNull.b35Rating,
                                      )),
                            );
                          },
                          child: const Text('导出 B50 成绩图'))),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      '当期版本成绩',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      height: 280,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 0.6,
                        ),
                        padding: const EdgeInsets.all(16),
                        itemCount: valueOrNull.b15Records.length,
                        itemBuilder: (context, index) {
                          return LxMaiRecordCard(
                            recordData: valueOrNull.b15Records[index],
                          );
                        },
                      )),
                  const Center(
                    child: Text(
                      '往期版本成绩',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                      height: 280,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          childAspectRatio: 0.6,
                        ),
                        padding: const EdgeInsets.all(16),
                        itemCount: valueOrNull.b35Records.length,
                        itemBuilder: (context, index) {
                          return LxMaiRecordCard(
                            recordData: valueOrNull.b35Records[index],
                          );
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      AsyncValue(:final error?) => ErrorView(
          errorMessage: error.toString(),
          onRetry: () => ref.refresh(getB15RecordsProvider(uuid).future),
        ),
      _ => const CircularProgressIndicator(),
    };
  }
}
