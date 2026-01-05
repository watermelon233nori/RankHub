import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:split_button_m3e/split_button_m3e.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';
import '../controllers/random_song_picker_controller.dart';
import '../pages/song_detail_page.dart';

/// 随机选曲页面
class RandomSongPickerPage extends StatelessWidget {
  const RandomSongPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RandomSongPickerController());
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('随机选曲'),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 随机结果显示区域
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.randomSongs.isEmpty) {
                return _buildEmptyState(context);
              }

              return Column(
                children: [
                  // 结果标题栏
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '随机结果 (${controller.randomSongs.length})',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: controller.clearResults,
                          icon: const Icon(Icons.clear_all, size: 18),
                          label: const Text('清除全部'),
                        ),
                      ],
                    ),
                  ),
                  // 结果列表
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: controller.randomSongs.length,
                      itemBuilder: (context, index) {
                        final song = controller.randomSongs[index];
                        return _buildSongCard(context, song, index + 1);
                      },
                    ),
                  ),
                ],
              );
            }),
          ),

          // 快速筛选区域
          _buildQuickFilters(context, controller),

          // 底部操作栏
          _buildBottomBar(context, controller),
        ],
      ),
    );
  }

  /// 构建快速筛选chip区域
  Widget _buildQuickFilters(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
      ),
      child: Obx(() {
        final chips = <Widget>[];

        // 难度筛选
        final difficultyLabel = controller.selectedDifficulties.isEmpty
            ? '难度'
            : '难度 (${controller.selectedDifficulties.length})';
        chips.add(
          FilterChip(
            label: Text(difficultyLabel),
            avatar: const Icon(Icons.star, size: 18),
            selected: controller.selectedDifficulties.isNotEmpty,
            onSelected: (_) => _showDifficultyPicker(context, controller),
          ),
        );

        // 分类筛选
        final genreLabel = controller.selectedGenres.isEmpty
            ? '分类'
            : '分类 (${controller.selectedGenres.length})';
        chips.add(
          FilterChip(
            label: Text(genreLabel),
            avatar: const Icon(Icons.category, size: 18),
            selected: controller.selectedGenres.isNotEmpty,
            onSelected: (_) => _showGenrePicker(context, controller),
          ),
        );

        // 版本筛选
        final versionLabel = controller.selectedVersionIds.isEmpty
            ? '版本'
            : '版本 (${controller.selectedVersionIds.length})';
        chips.add(
          FilterChip(
            label: Text(versionLabel),
            avatar: const Icon(Icons.update, size: 18),
            selected: controller.selectedVersionIds.isNotEmpty,
            onSelected: (_) => _showVersionPicker(context, controller),
          ),
        );

        // 定数范围筛选
        final hasLevelRange =
            controller.minLevel.value > 1.0 || controller.maxLevel.value < 15.0;
        final levelLabel = hasLevelRange
            ? '定数 ${controller.minLevel.value.toStringAsFixed(1)}-${controller.maxLevel.value.toStringAsFixed(1)}'
            : '定数';
        chips.add(
          FilterChip(
            label: Text(levelLabel),
            avatar: const Icon(Icons.straighten, size: 18),
            selected: hasLevelRange,
            onSelected: (_) => _showLevelRangePicker(context, controller),
          ),
        );

        // 谱面类型筛选
        final chartTypeLabel = controller.chartType.value == 'all'
            ? '类型'
            : controller.chartType.value == 'standard'
            ? '标准'
            : 'DX';
        chips.add(
          FilterChip(
            label: Text(chartTypeLabel),
            avatar: const Icon(Icons.music_note, size: 18),
            selected: controller.chartType.value != 'all',
            onSelected: (_) => _showChartTypePicker(context, controller),
          ),
        );

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(spacing: 8, children: chips),
        );
      }),
    );
  }

  /// 显示难度选择器
  void _showDifficultyPicker(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '选择难度',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      controller.selectedDifficulties.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('清除'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('完成'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Obx(
                () => Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: LevelIndex.values.map((diff) {
                    final isSelected = controller.selectedDifficulties.contains(
                      diff,
                    );
                    return FilterChip(
                      label: Text(diff.label),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          controller.selectedDifficulties.add(diff);
                        } else {
                          controller.selectedDifficulties.remove(diff);
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示分类选择器
  void _showGenrePicker(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '选择分类',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      controller.selectedGenres.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('清除'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('完成'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: Obx(
                  () => controller.genres.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: controller.genres.map((genre) {
                            final isSelected = controller.selectedGenres
                                .contains(genre);
                            return CheckboxListTile(
                              title: Text(genre),
                              value: isSelected,
                              onChanged: (selected) {
                                if (selected == true) {
                                  controller.selectedGenres.add(genre);
                                } else {
                                  controller.selectedGenres.remove(genre);
                                }
                              },
                            );
                          }).toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示版本选择器
  void _showVersionPicker(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '选择版本',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      controller.selectedVersionIds.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('清除'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('完成'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 300,
                child: Obx(
                  () => controller.versions.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: controller.versions.map((version) {
                            final isSelected = controller.selectedVersionIds
                                .contains(version.version);
                            return CheckboxListTile(
                              title: Text(version.title),
                              value: isSelected,
                              onChanged: (selected) {
                                if (selected == true) {
                                  controller.selectedVersionIds.add(
                                    version.version,
                                  );
                                } else {
                                  controller.selectedVersionIds.remove(
                                    version.version,
                                  );
                                }
                              },
                            );
                          }).toList(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示定数范围选择器
  void _showLevelRangePicker(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    '定数范围',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      controller.minLevel.value = 1.0;
                      controller.maxLevel.value = 15.0;
                      Navigator.pop(context);
                    },
                    child: const Text('重置'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('完成'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Obx(
                () => RangeSlider(
                  values: RangeValues(
                    controller.minLevel.value,
                    controller.maxLevel.value,
                  ),
                  min: 1.0,
                  max: 15.0,
                  divisions: 140,
                  labels: RangeLabels(
                    controller.minLevel.value.toStringAsFixed(1),
                    controller.maxLevel.value.toStringAsFixed(1),
                  ),
                  onChanged: (values) {
                    controller.minLevel.value = values.start;
                    controller.maxLevel.value = values.end;
                  },
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.minLevel.value.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        controller.maxLevel.value.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 显示谱面类型选择器
  void _showChartTypePicker(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '谱面类型',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Column(
                  children: [
                    RadioListTile<String>(
                      title: const Text('全部'),
                      value: 'all',
                      groupValue: controller.chartType.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.chartType.value = value;
                          Navigator.pop(context);
                        }
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('标准'),
                      value: 'standard',
                      groupValue: controller.chartType.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.chartType.value = value;
                          Navigator.pop(context);
                        }
                      },
                    ),
                    RadioListTile<String>(
                      title: const Text('DX'),
                      value: 'dx',
                      groupValue: controller.chartType.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.chartType.value = value;
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 构建空状态
  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.casino,
            size: 64,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            '点击下方按钮开始随机选曲',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建曲目卡片
  Widget _buildSongCard(BuildContext context, Song song, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.find<RandomSongPickerController>();

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          Get.to(() => SongDetailPage(song: song));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // 曲绘
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://assets2.lxns.net/maimai/jacket/${song.songId}.png',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 60,
                    height: 60,
                    color: colorScheme.surfaceContainerHighest,
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 60,
                    height: 60,
                    color: colorScheme.surfaceContainerHighest,
                    child: Icon(
                      Icons.music_note,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // 曲目信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      song.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      song.artist,
                      style: TextStyle(
                        fontSize: 14,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: _buildDynamicChips(
                        song,
                        controller,
                        colorScheme,
                      ),
                    ),
                  ],
                ),
              ),
              // 箭头图标
              Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }

  /// 根据筛选条件动态构建信息芯片
  List<Widget> _buildDynamicChips(
    Song song,
    RandomSongPickerController controller,
    ColorScheme colorScheme,
  ) {
    final chips = <Widget>[];

    // 如果选择了难度或定数，显示匹配的难度信息
    if (controller.selectedDifficulties.isNotEmpty ||
        controller.minLevel.value > 1.0 ||
        controller.maxLevel.value < 15.0) {
      // 获取符合条件的谱面
      final difficulties =
          [...song.difficulties.standard, ...song.difficulties.dx].where((
            diff,
          ) {
            if (controller.selectedDifficulties.isNotEmpty &&
                !controller.selectedDifficulties.contains(diff.difficulty)) {
              return false;
            }
            if (diff.levelValue < controller.minLevel.value ||
                diff.levelValue > controller.maxLevel.value) {
              return false;
            }
            return true;
          }).toList();

      // 显示前3个符合条件的难度
      for (var i = 0; i < difficulties.length && i < 3; i++) {
        final diff = difficulties[i];
        chips.add(
          _buildInfoChip(
            '${diff.difficulty.label} ${diff.levelValue.toStringAsFixed(1)}',
            Icons.star,
            colorScheme,
          ),
        );
      }
    }

    // 如果选择了分类，显示分类
    if (controller.selectedGenres.isNotEmpty) {
      chips.add(_buildInfoChip(song.genre, Icons.category, colorScheme));
    }

    // 如果选择了版本，显示版本（需要从版本列表中查找）
    if (controller.selectedVersionIds.isNotEmpty) {
      final version = controller.versions.firstWhereOrNull(
        (v) => v.version == song.version,
      );
      if (version != null) {
        chips.add(_buildInfoChip(version.title, Icons.update, colorScheme));
      }
    }

    // 如果没有任何筛选条件，显示默认信息
    if (chips.isEmpty) {
      chips.add(_buildInfoChip(song.genre, Icons.category, colorScheme));
      chips.add(_buildInfoChip('BPM ${song.bpm}', Icons.speed, colorScheme));
    }

    return chips;
  }

  /// 构建信息芯片
  Widget _buildInfoChip(String label, IconData icon, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: colorScheme.onSecondaryContainer),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: colorScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  /// 构建底部操作栏
  Widget _buildBottomBar(
    BuildContext context,
    RandomSongPickerController controller,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Obx(
          () => SplitButtonM3E<String>(
            size: SplitButtonM3ESize.lg,
            shape: SplitButtonM3EShape.round,
            emphasis: SplitButtonM3EEmphasis.filled,
            label: '随机 ${controller.pickCount.value} 首',
            leadingIcon: Icons.casino,
            onPressed: controller.pickRandomSongs,
            items: [
              const SplitButtonM3EItem<String>(value: '1', child: '1 首'),
              const SplitButtonM3EItem<String>(value: '3', child: '3 首'),
              const SplitButtonM3EItem<String>(value: '5', child: '5 首'),
              const SplitButtonM3EItem<String>(value: '10', child: '10 首'),
            ],
            onSelected: (value) {
              controller.pickCount.value = int.parse(value);
            },
            leadingTooltip: '随机选曲',
            trailingTooltip: '打开菜单',
          ),
        ),
      ),
    );
  }
}
