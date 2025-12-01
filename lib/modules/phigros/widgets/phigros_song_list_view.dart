import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/phigros/phigros_controller.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_song_list_item.dart';
import 'dart:ui';

/// Phigros 曲目列表视图 - 包含搜索和难度筛选
class PhigrosSongListView extends StatefulWidget {
  const PhigrosSongListView({super.key});

  @override
  State<PhigrosSongListView> createState() => _PhigrosSongListViewState();
}

class _PhigrosSongListViewState extends State<PhigrosSongListView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final controller = Get.find<PhigrosController>();

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
    final controller = Get.find<PhigrosController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // 曲目列表
        Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.filteredSongs.isEmpty) {
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
              padding: const EdgeInsets.only(bottom: 200),
              itemCount: controller.filteredSongs.length,
              itemBuilder: (context, index) {
                final song = controller.filteredSongs[index];
                return PhigrosSongListItem(song: song);
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
                          hintText: '搜索曲目、曲师...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: Obx(() {
                            // 使用controller中的响应式变量
                            if (controller.searchKeyword.value.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            );
                          }),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHighest,
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
}
