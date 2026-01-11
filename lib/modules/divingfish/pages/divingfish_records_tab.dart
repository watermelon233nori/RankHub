import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/divingfish/controllers/divingfish_maimai_controller.dart';
import 'package:rank_hub/modules/divingfish/widgets/divingfish_compact_score_card.dart';

/// 水鱼查分器 - 全部成绩页面
class DivingFishRecordsTab extends StatefulWidget {
  const DivingFishRecordsTab({super.key});

  @override
  State<DivingFishRecordsTab> createState() => _DivingFishRecordsTabState();
}

class _DivingFishRecordsTabState extends State<DivingFishRecordsTab> {
  final controller = Get.find<DivingFishMaimaiController>();

  String _sortBy = 'ra'; // ra, achievements, dxScore
  bool _ascending = false;

  int? _selectedLevelIndex; // 0-4
  String? _selectedFc; // fc/fcp/ap/app
  String? _selectedFs; // sync/fs/fsp/fsd/fsdp
  String? _selectedRate; // sssp 等
  String _selectedType = ''; // SD, DX
  double? _minAchievement; // 0-100

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (controller.scores.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await controller.loadScores(forceRefresh: true);
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
                            Icons.music_note_outlined,
                            size: 64,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '暂无成绩数据',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '请先登录并同步数据',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 24),
                          FilledButton.icon(
                            onPressed: () =>
                                controller.loadScores(forceRefresh: true),
                            icon: const Icon(Icons.refresh),
                            label: const Text('刷新数据'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }

            // 过滤
            var scores = controller.scores.toList();

            if (_selectedLevelIndex != null) {
              scores = scores
                  .where((s) => s.levelIndex == _selectedLevelIndex)
                  .toList();
            }
            if (_selectedFc != null) {
              final fc = _selectedFc!.toLowerCase();
              scores = scores.where((s) => s.fc.toLowerCase() == fc).toList();
            }
            if (_selectedFs != null) {
              final fs = _selectedFs!.toLowerCase();
              scores = scores.where((s) => s.fs.toLowerCase() == fs).toList();
            }
            if (_selectedRate != null) {
              final rate = _selectedRate!.toLowerCase();
              scores = scores
                  .where((s) => s.rate.toLowerCase() == rate)
                  .toList();
            }
            if (_selectedType.isNotEmpty) {
              final type = _selectedType.toUpperCase();
              scores = scores
                  .where((s) => s.type.toUpperCase() == type)
                  .toList();
            }
            if (_minAchievement != null) {
              scores = scores
                  .where((s) => s.achievements >= _minAchievement!)
                  .toList();
            }

            // 排序
            scores.sort((a, b) {
              int result;
              switch (_sortBy) {
                case 'achievements':
                  result = a.achievements.compareTo(b.achievements);
                  break;
                case 'dxScore':
                  result = a.dxScore.compareTo(b.dxScore);
                  break;
                case 'ra':
                default:
                  result = a.ra.compareTo(b.ra);
                  break;
              }
              return _ascending ? result : -result;
            });

            if (scores.isEmpty) {
              return RefreshIndicator(
                onRefresh: () async {
                  await controller.loadScores(forceRefresh: true);
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
                            Icons.filter_list_off,
                            size: 64,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '没有符合条件的成绩',
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
                await controller.loadScores(forceRefresh: true);
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(
                  bottom: 200,
                  left: 16,
                  right: 16,
                  top: 16,
                ),
                itemCount: scores.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final score = scores[index];
                  return DivingFishCompactScoreCard(score, rank: index + 1);
                },
              ),
            );
          }),
          // 底部筛选/排序栏
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
                    color: colorScheme.surface.withOpacity(0.9),
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 排序
                        Row(
                          children: [
                            const Icon(Icons.sort, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SegmentedButton<String>(
                                segments: const [
                                  ButtonSegment(
                                    value: 'ra',
                                    label: Text('Rating'),
                                    icon: Icon(Icons.star, size: 16),
                                  ),
                                  ButtonSegment(
                                    value: 'achievements',
                                    label: Text('达成率'),
                                    icon: Icon(Icons.percent, size: 16),
                                  ),
                                  ButtonSegment(
                                    value: 'dxScore',
                                    label: Text('DX 分数'),
                                    icon: Icon(Icons.leaderboard, size: 16),
                                  ),
                                ],
                                selected: {_sortBy},
                                onSelectionChanged: (selection) {
                                  setState(() {
                                    _sortBy = selection.first;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _ascending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                              ),
                              tooltip: _ascending ? '升序' : '降序',
                              onPressed: () {
                                setState(() {
                                  _ascending = !_ascending;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        // 筛选
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              FilterChip(
                                label: Text(
                                  _selectedLevelIndex == null
                                      ? '难度'
                                      : _levelLabel(_selectedLevelIndex!),
                                ),
                                selected: _selectedLevelIndex != null,
                                onSelected: (_) => _showLevelFilter(),
                                avatar: const Icon(Icons.show_chart, size: 18),
                              ),
                              const SizedBox(width: 8),
                              FilterChip(
                                label: Text(
                                  _selectedFc == null
                                      ? 'FC'
                                      : _selectedFc!.toUpperCase(),
                                ),
                                selected: _selectedFc != null,
                                onSelected: (_) => _showFcFilter(),
                                avatar: const Icon(Icons.album, size: 18),
                              ),
                              const SizedBox(width: 8),
                              FilterChip(
                                label: Text(
                                  _selectedFs == null
                                      ? 'FS'
                                      : _selectedFs!.toUpperCase(),
                                ),
                                selected: _selectedFs != null,
                                onSelected: (_) => _showFsFilter(),
                                avatar: const Icon(Icons.sync, size: 18),
                              ),
                              const SizedBox(width: 8),
                              FilterChip(
                                label: Text(
                                  _selectedRate == null
                                      ? '评级'
                                      : _selectedRate!.toUpperCase(),
                                ),
                                selected: _selectedRate != null,
                                onSelected: (_) => _showRateFilter(),
                                avatar: const Icon(Icons.grade, size: 18),
                              ),
                              const SizedBox(width: 8),
                              FilterChip(
                                label: Text(
                                  _selectedType.isEmpty
                                      ? '类型'
                                      : _selectedType == 'SD'
                                      ? '标准'
                                      : 'DX',
                                ),
                                selected: _selectedType.isNotEmpty,
                                onSelected: (_) => _showTypeFilter(),
                                avatar: const Icon(Icons.music_note, size: 18),
                              ),
                              const SizedBox(width: 8),
                              if (_hasFilters())
                                ActionChip(
                                  label: const Text('清除筛选'),
                                  avatar: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    setState(() {
                                      _selectedLevelIndex = null;
                                      _selectedFc = null;
                                      _selectedFs = null;
                                      _selectedRate = null;
                                      _selectedType = '';
                                      _minAchievement = null;
                                    });
                                  },
                                ),
                            ],
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
      ),
    );
  }

  bool _hasFilters() {
    return _selectedLevelIndex != null ||
        _selectedFc != null ||
        _selectedFs != null ||
        _selectedRate != null ||
        _selectedType.isNotEmpty ||
        _minAchievement != null;
  }

  String _levelLabel(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return 'BASIC';
      case 1:
        return 'ADVANCED';
      case 2:
        return 'EXPERT';
      case 3:
        return 'MASTER';
      case 4:
        return 'Re:MASTER';
      default:
        return '难度';
    }
  }

  void _showLevelFilter() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择难度'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: _selectedLevelIndex == null,
                onTap: () {
                  setState(() => _selectedLevelIndex = null);
                  Navigator.pop(context);
                },
              ),
              for (final entry in [
                (0, 'BASIC'),
                (1, 'ADVANCED'),
                (2, 'EXPERT'),
                (3, 'MASTER'),
                (4, 'Re:MASTER'),
              ])
                ListTile(
                  title: Text(entry.$2),
                  selected: _selectedLevelIndex == entry.$1,
                  onTap: () {
                    setState(() => _selectedLevelIndex = entry.$1);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFcFilter() {
    const options = ['fc', 'fcp', 'ap', 'app'];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择 FC 类型'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: _selectedFc == null,
                onTap: () {
                  setState(() => _selectedFc = null);
                  Navigator.pop(context);
                },
              ),
              for (final fc in options)
                ListTile(
                  title: Text(fc.toUpperCase()),
                  selected: _selectedFc == fc,
                  onTap: () {
                    setState(() => _selectedFc = fc);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFsFilter() {
    const options = ['sync', 'fs', 'fsp', 'fsd', 'fsdp'];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择 FS 类型'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: _selectedFs == null,
                onTap: () {
                  setState(() => _selectedFs = null);
                  Navigator.pop(context);
                },
              ),
              for (final fs in options)
                ListTile(
                  title: Text(fs.toUpperCase()),
                  selected: _selectedFs == fs,
                  onTap: () {
                    setState(() => _selectedFs = fs);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRateFilter() {
    const options = [
      'd',
      'c',
      'b',
      'bb',
      'bbb',
      'a',
      'aa',
      'aaa',
      's',
      'sp',
      'ss',
      'ssp',
      'sss',
      'sssp',
    ];

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择评级'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('全部'),
                selected: _selectedRate == null,
                onTap: () {
                  setState(() => _selectedRate = null);
                  Navigator.pop(context);
                },
              ),
              for (final rate in options)
                ListTile(
                  title: Text(rate.toUpperCase()),
                  selected: _selectedRate == rate,
                  onTap: () {
                    setState(() => _selectedRate = rate);
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTypeFilter() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('选择谱面类型'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('全部'),
              selected: _selectedType.isEmpty,
              onTap: () {
                setState(() => _selectedType = '');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('标准谱面'),
              selected: _selectedType == 'SD',
              onTap: () {
                setState(() => _selectedType = 'SD');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('DX 谱面'),
              selected: _selectedType == 'DX',
              onTap: () {
                setState(() => _selectedType = 'DX');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
