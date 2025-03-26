import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_filter.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_song_card.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class LxMaiSongList extends ConsumerWidget {
  const LxMaiSongList(this.scrollController, {super.key});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredSongList = ref.watch(filteredSongListProvider);

    return switch (filteredSongList) {
      AsyncValue<List<SongInfo>>(:final valueOrNull?) => RefreshIndicator(
          edgeOffset: 128,
          onRefresh: () => ref.refresh(filteredSongListProvider.future),
          child: AnimationLimiter(
              child: ListView.builder(
            controller: scrollController,
            itemCount: valueOrNull.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: LxMaiSongCard(songData: valueOrNull[index]),
                  ),
                ),
              );
            },
          )),
        ),
      AsyncValue(:final error?) => ErrorView(
          errorMessage: error.toString(),
          onRetry: () => ref.refresh(filteredSongListProvider.future),
        ),
      _ => const LoadingView(),
    };
  }
}
