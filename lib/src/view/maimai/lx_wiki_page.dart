import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:rank_hub/src/model/maimai/mai_cover_feature.dart';
import 'package:rank_hub/src/pages/mai_cover_recognition_page.dart';
import 'package:rank_hub/src/pages/mai_cover_recognition_setup.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:rank_hub/src/view/maimai/lx_song_list.dart';
import 'package:rank_hub/src/viewmodel/maimai/lx_wiki_page_vm.dart';

class WikiPage extends StatelessWidget {
  const WikiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => LxMaiWikiPageViewModel(
          lxMaiProvider: LxMaiProvider(context: ctx), context)
        ..fetchSongs(),
      child: Consumer<LxMaiWikiPageViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              extendBody: true,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                surfaceTintColor: Colors.transparent,
                centerTitle: false,
                flexibleSpace: ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(color: Colors.transparent))),
                title: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("舞萌 DX"),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
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
                          child: LxMaiSongList(
                            provider: LxMaiProvider(context: context),
                            controller: viewModel.scrollController,
                            songs: viewModel.filteredSongs,
                          ),
                        ),
              floatingActionButton: SafeArea(
                  child: FloatingActionButton(
                onPressed: () async {
                  final box = await Hive.openLazyBox<MaiCoverFeature>(
                      'mai_cn_cover_features');
                  if (box.isNotEmpty) {
                    print(File(box.path!).lengthSync() / (1024 * 1024));
                    await box.close();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>
                              const MaiCoverRecognitionPage()),
                    );
                    return;
                  }
                  await box.close();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) {
                          return const MaiCoverRecognitionSetup();
                        }),
                  );
                },
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
            color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
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
