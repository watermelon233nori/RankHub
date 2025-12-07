import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/lxns/controllers/collection_progress_controller.dart';
import 'package:rank_hub/modules/lxns/widgets/collection_progress_widgets.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';

/// 藏品完成度页面
class CollectionProgressPage extends StatelessWidget {
  const CollectionProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CollectionProgressController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value &&
            controller.pinnedCollections.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.pinnedCollections.isEmpty) {
          return _buildEmptyState(context, controller);
        }

        return RefreshIndicator(
          onRefresh: controller.refreshCurrentProgress,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.pinnedCollections.length,
            itemBuilder: (context, index) {
              final progress = controller.pinnedCollections[index];
              return CollectionProgressCard(
                progress: progress,
                onTap: () => _showCollectionDetail(context, progress),
                onUnpin: () => controller.togglePin(progress.collection),
              );
            },
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: FloatingActionButton.extended(
          onPressed: () => _showCollectionPicker(context, controller),
          icon: const Icon(Icons.add),
          label: const Text('添加藏品'),
        ),
      ),
    );
  }

  /// 空状态展示
  Widget _buildEmptyState(
    BuildContext context,
    CollectionProgressController controller,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.collections_bookmark_outlined,
            size: 64,
            color: Theme.of(context).colorScheme.outline,
          ),
          const SizedBox(height: 16),
          Text(
            '还没有固定的藏品',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '点击下方按钮添加想要追踪的藏品',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => _showCollectionPicker(context, controller),
            icon: const Icon(Icons.add),
            label: const Text('添加藏品'),
          ),
        ],
      ),
    );
  }

  /// 显示藏品选择器
  void _showCollectionPicker(
    BuildContext context,
    CollectionProgressController controller,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CollectionPickerSheet(controller: controller),
    );
  }
}

/// 藏品选择器底部弹窗
class _CollectionPickerSheet extends StatefulWidget {
  final CollectionProgressController controller;

  const _CollectionPickerSheet({required this.controller});

  @override
  State<_CollectionPickerSheet> createState() => _CollectionPickerSheetState();
}

class _CollectionPickerSheetState extends State<_CollectionPickerSheet> {
  final searchController = TextEditingController();
  final selectedType = 'plate'.obs; // 默认选中姓名框
  final searchQuery = ''.obs;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<MaimaiCollection> get filteredCollections {
    var collections = widget.controller.allCollectionsWithSongs.toList();

    // 按类型筛选
    collections = collections
        .where((c) => c.collectionType == selectedType.value)
        .toList();

    // 按搜索关键词筛选
    if (searchQuery.value.isNotEmpty) {
      final query = searchQuery.value.toLowerCase();
      collections = collections
          .where((c) => c.name.toLowerCase().contains(query))
          .toList();
    }

    return collections;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Obx(() {
          final isLoading = widget.controller.isLoading.value;
          final collections = filteredCollections;

          return Column(
            children: [
              // 标题栏
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor),
                  ),
                ),
                child: Row(
                  children: [
                    Text('选择藏品', style: Theme.of(context).textTheme.titleLarge),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              // 搜索框
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: '搜索藏品名称...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: searchQuery.value.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                              searchQuery.value = '';
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onChanged: (value) {
                    searchQuery.value = value;
                  },
                ),
              ),

              // 类型筛选
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTypeChip(
                        context,
                        'trophy',
                        '称号',
                        Icons.emoji_events,
                      ),
                      const SizedBox(width: 8),
                      _buildTypeChip(
                        context,
                        'icon',
                        '头像',
                        Icons.account_circle,
                      ),
                      const SizedBox(width: 8),
                      _buildTypeChip(
                        context,
                        'plate',
                        '姓名框',
                        Icons.credit_card,
                      ),
                      const SizedBox(width: 8),
                      _buildTypeChip(
                        context,
                        'frame',
                        '背景',
                        Icons.crop_portrait,
                      ),
                    ],
                  ),
                ),
              ),

              // 藏品列表
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : collections.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 48,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                '未找到匹配的藏品',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        controller: scrollController,
                        itemCount: collections.length,
                        itemBuilder: (context, index) {
                          final collection = collections[index];
                          return FutureBuilder<bool>(
                            future: widget.controller.isarService
                                .isCollectionPinned(
                                  collection.collectionId,
                                  collection.collectionType,
                                ),
                            builder: (context, snapshot) {
                              final isPinned = snapshot.data ?? false;

                              return ListTile(
                                leading: _getCollectionIcon(collection),
                                title: Text(collection.name),
                                subtitle: Text(
                                  _getCollectionSubtitle(collection),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                trailing: isPinned
                                    ? const Icon(Icons.push_pin)
                                    : null,
                                onTap: () async {
                                  await widget.controller.togglePin(collection);
                                  if (!isPinned && context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        });
      },
    );
  }

  Widget _buildTypeChip(
    BuildContext context,
    String type,
    String label,
    IconData icon,
  ) {
    return Obx(() {
      final isSelected = selectedType.value == type;
      return FilterChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            selectedType.value = type;
          }
        },
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        selectedColor: Theme.of(context).colorScheme.primaryContainer,
        checkmarkColor: Theme.of(context).colorScheme.primary,
      );
    });
  }

  Widget _getCollectionIcon(MaimaiCollection collection) {
    IconData icon;
    switch (collection.collectionType) {
      case 'trophy':
        icon = Icons.emoji_events;
        break;
      case 'icon':
        icon = Icons.account_circle;
        break;
      case 'plate':
        icon = Icons.credit_card;
        break;
      case 'frame':
        icon = Icons.crop_portrait;
        break;
      default:
        icon = Icons.star;
    }
    return Icon(icon);
  }

  String _getCollectionSubtitle(MaimaiCollection collection) {
    final songCount = collection.required.expand((req) => req.songs).length;
    return '需要完成 $songCount 首曲目';
  }
}

// 全局辅助方法
void _showCollectionDetail(BuildContext context, CollectionProgress progress) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => CollectionDetailPage(progress: progress),
    ),
  );
}

/// 藏品详情页面
class CollectionDetailPage extends StatefulWidget {
  final CollectionProgress progress;

  const CollectionDetailPage({super.key, required this.progress});

  @override
  State<CollectionDetailPage> createState() => _CollectionDetailPageState();
}

class _CollectionDetailPageState extends State<CollectionDetailPage> {
  final selectedDifficulty = Rx<LevelIndex?>(null); // null表示不选择任何难度

  // 获取要求chip颜色
  Color _getRequirementColor(BuildContext context, String requirement) {
    // AP/AP+/FDX 金色
    if (requirement.contains('AP') || requirement.contains('FDX')) {
      return const Color(0xFFFFD700);
    }
    // SSS(100%达成率) 紫色
    else if (requirement.contains('SSS') || requirement.contains('100')) {
      return Colors.purple;
    }
    // FC 绿色
    else if (requirement.contains('FC') || requirement.contains('SYNC')) {
      return Colors.green;
    }
    // CLEAR(80%达成率) 蓝色
    else {
      return Colors.blue;
    }
  }

  // 构建要求和版本chips
  List<Widget> _buildTitleChips(BuildContext context) {
    final chips = <Widget>[];
    final requirements = <String>[];

    // 分析要求
    if (widget.progress.collection.required.isNotEmpty) {
      final req = widget.progress.collection.required.first;
      if (req.fc != null) requirements.add(req.fc!.label);
      if (req.fs != null) requirements.add(req.fs!.label);
      if (req.rate != null) requirements.add(req.rate!.label);
    }
    if (requirements.isEmpty) requirements.add('CLEAR');

    // 添加要求chips
    for (final req in requirements) {
      chips.add(
        Container(
          margin: const EdgeInsets.only(left: 4),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: _getRequirementColor(context, req).withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: _getRequirementColor(context, req),
              width: 1,
            ),
          ),
          child: Text(
            req,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: _getRequirementColor(context, req),
            ),
          ),
        ),
      );
    }

    // 添加版本chips
    if (widget.progress.versions.isNotEmpty) {
      if (widget.progress.versions.length <= 2) {
        for (final version in widget.progress.versions) {
          chips.add(
            Container(
              margin: const EdgeInsets.only(left: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.secondaryContainer.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 1,
                ),
              ),
              child: Text(
                version.title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          );
        }
      } else {
        final latestVersion = widget.progress.versions.first;
        final remainingCount = widget.progress.versions.length - 1;
        chips.add(
          Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.secondaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: 1,
              ),
            ),
            child: Text(
              latestVersion.title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        );
        chips.add(
          Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(
                context,
              ).colorScheme.secondaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Text(
              '...+$remainingCount',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
        );
      }
    }

    return chips;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverAppBar(
            centerTitle: false,
            titleSpacing: 0,
            pinned: true,
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 第一行：标题
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      widget.progress.collection.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 第二行：chips
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _buildTitleChips(context),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  final controller = Get.find<CollectionProgressController>();
                  controller.refreshCurrentProgress();
                },
              ),
            ],
          ),

          // 进度卡片
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: OverallProgressCard(progress: widget.progress),
            ),
          ),

          // 难度筛选 - 吸顶
          SliverPersistentHeader(
            pinned: true,
            delegate: _DifficultyFilterDelegate(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: _buildDifficultyFilter(),
              ),
            ),
          ),

          // 曲目分层展示
          Obx(() {
            final selectedDiff = selectedDifficulty.value;

            return TieredSongView(
              songProgresses: widget.progress.songProgresses,
              selectedDifficulty: selectedDiff,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDifficultyFilter() {
    // 收集所有出现的难度类型
    final allDifficulties = <LevelIndex>{};
    for (final song in widget.progress.songProgresses) {
      allDifficulties.addAll(song.requiredDifficulties);
    }
    final sortedDifficulties = allDifficulties.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: sortedDifficulties.map((difficulty) {
        return Obx(() {
          final isSelected = selectedDifficulty.value == difficulty;
          return FilterChip(
            label: Text(_getDifficultyShortName(difficulty)),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  selectedDifficulty.value = difficulty;
                } else {
                  // 取消选择
                  selectedDifficulty.value = null;
                }
              });
            },
            backgroundColor: _getDifficultyColor(difficulty).withOpacity(0.1),
            selectedColor: _getDifficultyColor(difficulty).withOpacity(0.3),
            checkmarkColor: _getDifficultyColor(difficulty),
            labelStyle: TextStyle(
              color: _getDifficultyColor(difficulty),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          );
        });
      }).toList(),
    );
  }

  String _getDifficultyShortName(LevelIndex difficulty) {
    switch (difficulty) {
      case LevelIndex.basic:
        return 'BAS';
      case LevelIndex.advanced:
        return 'ADV';
      case LevelIndex.expert:
        return 'EXP';
      case LevelIndex.master:
        return 'MAS';
      case LevelIndex.reMaster:
        return 'Re:MAS';
    }
  }

  Color _getDifficultyColor(LevelIndex difficulty) {
    switch (difficulty) {
      case LevelIndex.basic:
        return Colors.green;
      case LevelIndex.advanced:
        return Colors.orange;
      case LevelIndex.expert:
        return Colors.red;
      case LevelIndex.master:
        return Colors.purple;
      case LevelIndex.reMaster:
        return Colors.deepPurple;
    }
  }
}

/// SliverPersistentHeader 委托，用于难度筛选器吸顶
class _DifficultyFilterDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _DifficultyFilterDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => 60; // 最大高度

  @override
  double get minExtent => 60; // 最小高度（吸顶时的高度）

  @override
  bool shouldRebuild(covariant _DifficultyFilterDelegate oldDelegate) {
    return false;
  }
}
