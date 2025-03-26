import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_filter.dart';

class MaiSongSearchBar extends ConsumerStatefulWidget {
  const MaiSongSearchBar({super.key, required this.visible});

  final bool visible;

  @override
  ConsumerState<MaiSongSearchBar> createState() => _MaiSongSearchBarState();
}

class _MaiSongSearchBarState extends ConsumerState<MaiSongSearchBar> {
  late FocusNode focusNode;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    searchController = TextEditingController();

    searchController.addListener(() {
      ref
          .read(lxMaiSongSearchKeywordProvider.notifier)
          .setSearchKeyword(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: widget.visible ? 80.0 : 0,
        child: ClipRRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: BottomAppBar(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(242),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextField(
                  controller: searchController,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    labelText: "搜索歌曲",
                    hintText: "支持 ID, 曲名, 艺术家, 别名 查找",
                    prefixIcon: Icon(Icons.search),
                  ),
                )),
                const SizedBox(width: 72),
              ],
            ),
          ),
        )));
  }
}
