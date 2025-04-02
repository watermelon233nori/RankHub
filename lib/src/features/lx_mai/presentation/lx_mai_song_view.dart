import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_song_list.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_song_search_bar.dart';
import 'package:rank_hub/src/shared/widgets/filterable_list_view.dart';

class LxMaiSongView extends ConsumerWidget {
  const LxMaiSongView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilterableListView(
      listViewBuilder: (scrollController) => LxMaiSongList(
        scrollController,
      ),
      filterViewBuilder: (visible) => LxMaiSongSearchBar(visible: visible),
    );
  }
}
