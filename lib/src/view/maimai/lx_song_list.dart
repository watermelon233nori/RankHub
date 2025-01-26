import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rank_hub/src/model/maimai/song_info.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:rank_hub/src/view/maimai/lx_song_card.dart';

class LxMaiSongList extends StatelessWidget {
  final LxMaiProvider provider;
  final List<SongInfo> songs;
  final ScrollController controller;

  const LxMaiSongList({super.key, required this.songs, required this.controller, required this.provider});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(child: ListView.builder(
      controller: controller,
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: LxMaiSongCard(songData: songs[index], provider: provider),
            ),
          ),
        );
      },
    ));
  }
}
