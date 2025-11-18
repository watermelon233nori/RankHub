import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../maimai_lxns_controller.dart';
import 'song_list_item.dart';
import 'dart:ui';

/// 曲目列表视图 - 包含搜索和筛选
class SongListView extends StatefulWidget {
  const SongListView({super.key});

  @override
  State<SongListView> createState() => _SongListViewState();
}

class _SongListViewState extends State<SongListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<MaimaiLxnsController>();

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
    final controller = Get.find<MaimaiLxnsController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // 曲目列表
        Obx(() {
          if (controller.filteredSongs.isEmpty) {
            return Center(
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
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 160), // 为搜索栏和底部导航栏留出空间
            itemCount: controller.filteredSongs.length,
            itemBuilder: (context, index) {
              final song = controller.filteredSongs[index];
              return SongListItem(song: song);
            },
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
                                  controller.selectedVersionId == 0
                                      ? '版本'
                                      : controller.getVersionLabel(
                                          controller.selectedVersionId,
                                        ),
                                ),
                                selected: controller.selectedVersionId != 0,
                                onSelected: (selected) {
                                  _showVersionFilter(controller);
                                },
                                avatar: const Icon(Icons.update, size: 18),
                              ),
                              const SizedBox(width: 8),
                              // 谱面类型筛选
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
                                  controller.selectedVersionId != 0 ||
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

  /// 显示分类筛选对话框
  void _showGenreFilter(MaimaiLxnsController controller) {
    final genres = controller.getGenres();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择分类'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: controller.selectedGenre.isEmpty,
                onTap: () {
                  controller.setSelectedGenre('');
                  Navigator.pop(context);
                },
              ),
              ...genres.map(
                (genre) => ListTile(
                  title: Text(genre),
                  selected: controller.selectedGenre == genre,
                  onTap: () {
                    controller.setSelectedGenre(genre);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示版本筛选对话框
  void _showVersionFilter(MaimaiLxnsController controller) {
    final versions = controller.versions;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择版本'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: controller.selectedVersionId == 0,
                onTap: () {
                  controller.setSelectedVersionId(0);
                  Navigator.pop(context);
                },
              ),
              ...versions.map(
                (version) => ListTile(
                  title: Text(version.title),
                  selected: controller.selectedVersionId == version.versionId,
                  onTap: () {
                    controller.setSelectedVersionId(version.versionId);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示谱面类型筛选对话框
  void _showTypeFilter(MaimaiLxnsController controller) {
    final types = controller.getTypeOptions();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择谱面类型'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: controller.selectedType.isEmpty,
                onTap: () {
                  controller.setSelectedType('');
                  Navigator.pop(context);
                },
              ),
              ...types.map(
                (type) => ListTile(
                  title: Text(type['label']!),
                  selected: controller.selectedType == type['value'],
                  onTap: () {
                    controller.setSelectedType(type['value']!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
