import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:rank_hub/src/model/mai_types.dart';
import 'package:rank_hub/src/model/maimai/song_genre.dart';
import 'package:rank_hub/src/model/maimai/song_version.dart';
import 'package:rank_hub/src/view/maimai/lx_mai_record_card.dart';
import 'package:rank_hub/src/provider/lx_mai_provider.dart';
import 'package:rank_hub/src/viewmodel/maimai/lx_record_list_vm.dart';

class LxMaiRecordList extends StatelessWidget {
  const LxMaiRecordList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => RecordListViewModel(LxMaiProvider(context: ctx), context)
        ..fetchRecords(),
      child: Consumer<RecordListViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              extendBody: true,
              body: Builder(
                builder: (ctx) {
                  if (viewModel.isLoading && viewModel.scores.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (viewModel.hasError) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.error,
                                size: 48, color: Colors.grey),
                            const Text(
                              'Failed to load records',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              viewModel.errorMessage,
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 32),
                            ElevatedButton(
                              onPressed: () =>
                                  viewModel.fetchRecords(force: true),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.refresh),
                                  SizedBox(width: 8),
                                  Text('Retry'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }

                  if (viewModel.getRecordsList().isEmpty) {
                    return const Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 48,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          '没有找到符合条件的记录',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '请尝试更改过滤条件和搜索关键字',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ));
                  }

                  final items = viewModel.getRecordsList();

                  return RefreshIndicator(
                      edgeOffset: 176,
                      onRefresh: () => viewModel.fetchRecords(force: true),
                      child: AnimationLimiter(
                        child: ListView.builder(
                          controller: viewModel.scrollController,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 176),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return AnimationConfiguration.staggeredList(
                                position: index,
                                child: SizedBox(
                                    height: 240,
                                    child: SlideAnimation(
                                      delay: const Duration(milliseconds: 100),
                                      duration: const Duration(milliseconds: 300),
                                      verticalOffset: 100.0,
                                      child: FadeInAnimation(
                                        delay: const Duration(milliseconds: 100),
                                        duration: const Duration(milliseconds: 300),
                                        child: ScaleAnimation(child: LxMaiRecordCard(
                                          recordData: items[index],
                                        ),
                                      ),
                                    ))));
                          },
                        ),
                      ));
                },
              ),
              bottomNavigationBar: SafeArea(
                child: _RankFilterBar(
                  isVisible: viewModel.isVisible,
                  searchController: viewModel.searchController,
                  focusNode: viewModel.focusNode,
                  viewModel: viewModel,
                ),
              ));
        },
      ),
    );
  }
}

class _RankFilterBar extends StatelessWidget {
  final bool isVisible;
  final TextEditingController searchController;
  final FocusNode focusNode;
  final RecordListViewModel viewModel;

  const _RankFilterBar({
    required this.isVisible,
    required this.searchController,
    required this.focusNode,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isVisible ? 144.0 : 0,
        child: ClipRRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                child: BottomAppBar(
                    color: Theme.of(context)
                        .scaffoldBackgroundColor
                        .withOpacity(0.95),
                    surfaceTintColor: Colors.transparent,
                    child: OverflowBox(
                      maxHeight: 144,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              ),
                            ),
                            SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 8,
                                  children: [
                                    TextButton(
                                        onPressed: viewModel.resetFilter,
                                        child: const Row(children: [
                                          Icon(Icons.refresh),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text('重置过滤条件')
                                        ])),
                                    ActionChip(
                                      onPressed:
                                          viewModel.openLevelMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getLevelIndexText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed:
                                          viewModel.openGenreMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getGenreText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed: viewModel
                                          .openVersionMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getVersionText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed:
                                          viewModel.openDateRangePickerDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getDateRangeText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed: viewModel
                                          .openLevelValueRangeSliderDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel
                                              .getLevelValueRangeText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed:
                                          viewModel.openFCTypeMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getFCTypeText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed:
                                          viewModel.openFSTypeMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getFSTypeText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                    ActionChip(
                                      onPressed: viewModel
                                          .openSongTypeMultiSelectDialog,
                                      label: Row(
                                        children: [
                                          Text(viewModel.getSongTypeText()),
                                          const SizedBox(width: 8),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    )))));
  }
}

class LevelValueRangeSliderDialog extends StatefulWidget {
  final RangeValues initialRange;

  const LevelValueRangeSliderDialog({
    super.key,
    required this.initialRange,
  });

  @override
  State<LevelValueRangeSliderDialog> createState() =>
      _LevelValueRangeSliderDialogState();
}

class _LevelValueRangeSliderDialogState
    extends State<LevelValueRangeSliderDialog> {
  late RangeValues _currentRange;

  @override
  void initState() {
    super.initState();
    _currentRange = widget.initialRange;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择谱面定数范围'),
      content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8, // 设置宽度为屏幕宽度的80%
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 32),
              Text(
                  '当前范围: ${_currentRange.start.toStringAsFixed(1)} - ${_currentRange.end.toStringAsFixed(1)}'),
              RangeSlider(
                values: _currentRange,
                min: 1.0,
                max: 15.0,
                divisions: 140,
                labels: RangeLabels(
                  _currentRange.start.toStringAsFixed(1),
                  _currentRange.end.toStringAsFixed(1),
                ),
                onChanged: (RangeValues newRange) {
                  setState(() {
                    _currentRange = newRange;
                  });
                },
              ),
            ],
          )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_currentRange);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class LevelMultiSelectDialog extends StatefulWidget {
  final List<LevelIndex> initialSelected;

  const LevelMultiSelectDialog({
    super.key,
    required this.initialSelected,
  });

  @override
  State<LevelMultiSelectDialog> createState() => _LevelMultiSelectDialogState();
}

class _LevelMultiSelectDialogState extends State<LevelMultiSelectDialog> {
  late List<LevelIndex> _selectedLevels;

  @override
  void initState() {
    super.initState();
    _selectedLevels = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择谱面难度'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: LevelIndex.values.map((level) {
            return CheckboxListTile(
              title: Text(level.label),
              value: _selectedLevels.contains(level),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedLevels.add(level);
                  } else {
                    _selectedLevels.remove(level);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedLevels);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class FCTypeMultiSelectDialog extends StatefulWidget {
  final List<FCType> initialSelected;

  const FCTypeMultiSelectDialog({
    super.key,
    required this.initialSelected,
  });

  @override
  State<FCTypeMultiSelectDialog> createState() =>
      _FCTypeMultiSelectDialogState();
}

class _FCTypeMultiSelectDialogState extends State<FCTypeMultiSelectDialog> {
  late List<FCType> _selectedLevels;

  @override
  void initState() {
    super.initState();
    _selectedLevels = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择 FC 类型'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: FCType.values.map((fcType) {
            return CheckboxListTile(
              title: Text(fcType.label),
              value: _selectedLevels.contains(fcType),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedLevels.add(fcType);
                  } else {
                    _selectedLevels.remove(fcType);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedLevels);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class FSTypeMultiSelectDialog extends StatefulWidget {
  final List<FSType> initialSelected;

  const FSTypeMultiSelectDialog({
    super.key,
    required this.initialSelected,
  });

  @override
  State<FSTypeMultiSelectDialog> createState() =>
      _FSTypeMultiSelectDialogState();
}

class _FSTypeMultiSelectDialogState extends State<FSTypeMultiSelectDialog> {
  late List<FSType> _selectedLevels;

  @override
  void initState() {
    super.initState();
    _selectedLevels = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择 FS 类型'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: FSType.values.map((fsType) {
            return CheckboxListTile(
              title: Text(fsType.label),
              value: _selectedLevels.contains(fsType),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedLevels.add(fsType);
                  } else {
                    _selectedLevels.remove(fsType);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedLevels);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class VersionMultiSelectDialog extends StatefulWidget {
  final List<SongVersion> initialSelected;
  final List<SongVersion> versions;

  const VersionMultiSelectDialog({
    super.key,
    required this.initialSelected,
    required this.versions,
  });

  @override
  State<VersionMultiSelectDialog> createState() =>
      _VersionMultiSelectDialogState();
}

class _VersionMultiSelectDialogState extends State<VersionMultiSelectDialog> {
  late List<SongVersion> _selectedVersions;

  @override
  void initState() {
    super.initState();
    _selectedVersions = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择版本'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: widget.versions.map((version) {
            return CheckboxListTile(
              title: Text(version.title),
              value: _selectedVersions.contains(version),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedVersions.add(version);
                  } else {
                    _selectedVersions.remove(version);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedVersions);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class GenreMultiSelectDialog extends StatefulWidget {
  final List<SongGenre> initialSelected;
  final List<SongGenre> genres;

  const GenreMultiSelectDialog({
    super.key,
    required this.initialSelected,
    required this.genres,
  });

  @override
  State<GenreMultiSelectDialog> createState() => _GenreMultiSelectDialogState();
}

class _GenreMultiSelectDialogState extends State<GenreMultiSelectDialog> {
  late List<SongGenre> _selectedGenres;

  @override
  void initState() {
    super.initState();
    _selectedGenres = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择分类'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: widget.genres.map((version) {
            return CheckboxListTile(
              title: Text(version.title),
              value: _selectedGenres.contains(version),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedGenres.add(version);
                  } else {
                    _selectedGenres.remove(version);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedGenres);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class SongTypeMultiSelectDialog extends StatefulWidget {
  final List<SongType> initialSelected;

  const SongTypeMultiSelectDialog({
    super.key,
    required this.initialSelected,
  });

  @override
  State<SongTypeMultiSelectDialog> createState() =>
      _SongTypeMultiSelectDialogState();
}

class _SongTypeMultiSelectDialogState extends State<SongTypeMultiSelectDialog> {
  late List<SongType> _selectedLevels;

  @override
  void initState() {
    super.initState();
    _selectedLevels = List.from(widget.initialSelected);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('选择谱面类型'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: ListView(
          shrinkWrap: true,
          children: SongType.values.map((songType) {
            return CheckboxListTile(
              title: Text(songType.label),
              value: _selectedLevels.contains(songType),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedLevels.add(songType);
                  } else {
                    _selectedLevels.remove(songType);
                  }
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(_selectedLevels);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
