import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:rank_hub/src/view/maimai/lx_song_card.dart';
import 'package:rank_hub/src/viewmodel/maimai/lx_wiki_page_vm.dart';

class LxWikiView extends StatelessWidget {
  const LxWikiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => LxMaiWikiPageViewModel(
          lxMaiProvider: LxMaiProvider(), context)
        ..fetchSongs(),
      child: Consumer<LxMaiWikiPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              extendBody: true,
              body: viewModel.isLoading && viewModel.songs.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.hasError
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Failed to load songs',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 8),
                              Text(viewModel.errorMessage),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () async {
                                  await viewModel.fetchSongs(force: true);
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        )
                      : RefreshIndicator(
                          edgeOffset: 128,
                          onRefresh: () => viewModel.fetchSongs(force: true),
                          child: AnimationLimiter(
                              child: ListView.builder(
                            controller: viewModel.scrollController,
                            itemCount: viewModel.songs.length,
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: LxMaiSongCard(
                                        songData: viewModel.songs[index],
                                        provider: viewModel.lxMaiProvider),
                                  ),
                                ),
                              );
                            },
                          )),
                        ),
              floatingActionButton: SafeArea(
                  child: FloatingActionButton(
                heroTag: "lslvfb",
                onPressed: null,
                tooltip: '曲绘识别',
                elevation: viewModel.isVisible ? 0.0 : null,
                child: const Icon(Icons.center_focus_weak),
              )),
              floatingActionButtonLocation: viewModel.isVisible
                  ? FloatingActionButtonLocation.endDocked
                  : FloatingActionButtonLocation.endFloat,
              bottomNavigationBar: SafeArea(
                child: _SongFliterBar(
                  isElevated: true,
                  isVisible: viewModel.isVisible,
                  searchController: viewModel.searchController,
                  focusNode: viewModel.focusNode,
                ),
              ));
        },
      ),
    );
  }
}

class _SongFliterBar extends StatelessWidget {
  const _SongFliterBar(
      {required this.isElevated,
      required this.isVisible,
      required this.searchController,
      required this.focusNode});

  final bool isElevated;
  final bool isVisible;
  final TextEditingController searchController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isVisible ? 80.0 : 0,
        child: ClipRRect(
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: BottomAppBar(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(242),
            elevation: isElevated ? null : 0.0,
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
