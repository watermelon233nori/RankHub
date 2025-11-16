import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_filter.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_card.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class LxMaiRecordList extends ConsumerWidget {
  final String uuid;
  final ScrollController scrollController;

  const LxMaiRecordList(
      {super.key, required this.uuid, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordList = ref.watch(filteredRecordListProvider(uuid));

    return switch (recordList) {
      AsyncValue<List<SongScore>>(:final valueOrNull?) => RefreshIndicator(
          edgeOffset: 176,
          onRefresh: () => ref.refresh(filteredRecordListProvider(uuid).future),
          child: AnimationLimiter(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 176),
              itemCount: valueOrNull.length,
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SizedBox(
                        height: 240,
                        child: SlideAnimation(
                            delay: const Duration(milliseconds: 100),
                            duration: const Duration(milliseconds: 300),
                            verticalOffset: 100.0,
                            child: FadeInAnimation(
                              delay: const Duration(milliseconds: 100),
                              duration: const Duration(milliseconds: 300),
                              child: ScaleAnimation(
                                child: LxMaiRecordCard(
                                  valueOrNull[index],
                                ),
                              ),
                            ))));
              },
            ),
          )),
      AsyncValue(:final error?, :final stackTrace) => ErrorView(
          errorMessage: error.toString(),
          errorDetails: stackTrace.toString(),
          onRetry: () => ref.refresh(filteredRecordListProvider(uuid).future),
        ),
      _ => const LoadingView(),
    };
  }
}
