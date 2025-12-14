import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/divingfish/controllers/divingfish_maimai_controller.dart';
import 'package:rank_hub/modules/divingfish/widgets/divingfish_merged_song_list_item.dart';
import 'dart:ui';

/// 水鱼查分器曲目列表视图 - 包含搜索和筛选
class DivingFishSongListView extends StatefulWidget {
  const DivingFishSongListView({super.key});

  @override
  State<DivingFishSongListView> createState() => _DivingFishSongListViewState();
}

class _DivingFishSongListViewState extends State<DivingFishSongListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<DivingFishMaimaiController>();

    // 监听搜索框变化
    _searchController.addListener(() {
      controller.setSearchKeyword(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DivingFishMaimaiController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // 曲目列表
        Obx(() {
          if (controller.filteredMergedSongs.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await controller.loadSongs(forceRefresh: true);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '未找到匹配的曲目',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await controller.loadSongs(forceRefresh: true);
            },
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 160),
              itemCount: controller.filteredMergedSongs.length,
              itemBuilder: (context, index) {
                final mergedSong = controller.filteredMergedSongs[index];
                return DivingFishMergedSongListItem(mergedSong: mergedSong);
              },
            ),
          );
        }),
        // 搜索栏 - 浮在底部
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.surface.withOpacity(0.8),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 搜索框
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: '搜索曲名、艺术家、谱师、分类...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () {
                                    _searchController.clear();
                                  },
                                )
                              : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHighest,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // 筛选按钮
                      Obx(
                        () => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // 分类筛选
                              FilterChip(
                                label: Text(
                                  controller.selectedGenre.isEmpty
                                      ? '分类'
                                      : controller.selectedGenre,
                                ),
                                selected: controller.selectedGenre.isNotEmpty,
                                onSelected: (selected) {
                                  _showGenreFilter(controller);
                                },
                                avatar: const Icon(Icons.category, size: 18),
                              ),
                              const SizedBox(width: 8),
                              // 版本筛选
                              FilterChip(
                                label: Text(
                                  controller.selectedVersion.isEmpty
                                      ? '版本'
                                      : controller.selectedVersion,
                                ),
                                selected: controller.selectedVersion.isNotEmpty,
                                onSelected: (selected) {
                                  _showVersionFilter(controller);
                                },
                                avatar: const Icon(Icons.update, size: 18),
                              ),
                              const SizedBox(width: 8),
                              // 类型筛选
                              FilterChip(
                                label: Text(
                                  controller.selectedType.isEmpty
                                      ? '类型'
                                      : controller.getTypeLabel(
                                          controller.selectedType,
                                        ),
                                ),
                                selected: controller.selectedType.isNotEmpty,
                                onSelected: (selected) {
                                  _showTypeFilter(controller);
                                },
                                avatar: const Icon(Icons.music_note, size: 18),
                              ),
                              const SizedBox(width: 8),
                              // 清除筛选
                              if (controller.selectedGenre.isNotEmpty ||
                                  controller.selectedVersion.isNotEmpty ||
                                  controller.selectedType.isNotEmpty)
                                ActionChip(
                                  label: const Text('清除筛选'),
                                  onPressed: () {
                                    controller.clearFilters();
                                  },
                                  avatar: const Icon(Icons.clear, size: 18),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ========== 筛选对话框 ==========

  /// 显示分类筛选对话框
  void _showGenreFilter(DivingFishMaimaiController controller) async {
    final genres = await controller.getAllGenres();

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('全部分类'),
              leading: controller.selectedGenre.isEmpty
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                controller.setGenreFilter('');
                Navigator.pop(context);
              },
            ),
            ...genres.map((genre) {
              return ListTile(
                title: Text(genre),
                leading: controller.selectedGenre == genre
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  controller.setGenreFilter(genre);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        );
      },
    );
  }

  /// 显示版本筛选对话框
  void _showVersionFilter(DivingFishMaimaiController controller) async {
    final versions = await controller.getAllVersions();

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('全部版本'),
              leading: controller.selectedVersion.isEmpty
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                controller.setVersionFilter('');
                Navigator.pop(context);
              },
            ),
            ...versions.map((version) {
              return ListTile(
                title: Text(version),
                leading: controller.selectedVersion == version
                    ? const Icon(Icons.check)
                    : null,
                onTap: () {
                  controller.setVersionFilter(version);
                  Navigator.pop(context);
                },
              );
            }),
          ],
        );
      },
    );
  }

  /// 显示类型筛选对话框
  void _showTypeFilter(DivingFishMaimaiController controller) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ListTile(
              title: const Text('全部类型'),
              leading: controller.selectedType.isEmpty
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                controller.setTypeFilter('');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('DX'),
              leading: controller.selectedType == 'DX'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                controller.setTypeFilter('DX');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('标准'),
              leading: controller.selectedType == 'SD'
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                controller.setTypeFilter('SD');
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
