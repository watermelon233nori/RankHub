import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_filter.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_provider.dart';
import 'package:rank_hub/src/shared/widgets/hideable_bottom_bar.dart';

class LxMaiRecordFilterBar extends ConsumerStatefulWidget {
  final bool visible;

  const LxMaiRecordFilterBar(this.visible, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LxMaiRecordFilterBarState();
}

class _LxMaiRecordFilterBarState extends ConsumerState<LxMaiRecordFilterBar> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  late LxMaiFilter lxMaiFilter;

  @override
  void initState() {
    super.initState();
    lxMaiFilter = ref.read(lxMaiFilterProvider.notifier);
    searchController.addListener(() {
      ref
          .read(lxMaiRecordSearchKeywordProvider.notifier)
          .setSearchKeyword(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final filterData = ref.watch(lxMaiFilterProvider);

    void openDateRangePickerDialog() {
      showCalendarDatePicker2Dialog(
        dialogSize: const Size(350, 370),
        context: context,
        value: filterData.uploadTimeRange == null
            ? [DateTime.now(), DateTime.now()]
            : [
                filterData.uploadTimeRange!.start,
                filterData.uploadTimeRange!.end
              ],
        config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.range),
      ).then((values) {
        if (values != null && values.isNotEmpty) {
          if (values[0] == null || values[1] == null) {
            filterData.updateUploadTimeRange(null);
          }
          filterData.updateUploadTimeRange(
            DateRange(values[0]!, values[1]!),
          );
        } else {
          filterData.updateUploadTimeRange(null);
        }
        lxMaiFilter.setFilter(filterData);
      });
    }

    void openLevelValueRangeSliderDialog() {
      showDialog<RangeValues>(
        context: context,
        builder: (BuildContext context) {
          return LevelValueRangeSliderDialog(
            initialRange: filterData.levelValueRange == null
                ? const RangeValues(1.0, 15.0)
                : filterData.levelValueRange!,
          );
        },
      ).then((range) {
        filterData.updateLevelValueRange(range);
        lxMaiFilter.setFilter(filterData);
      });
    }

    void openLevelMultiSelectDialog() {
      List<LevelIndex> list =
          filterData.levelIndex == null ? [] : filterData.levelIndex!;
      showDialog<List<LevelIndex>>(
        context: context,
        builder: (BuildContext context) {
          return LevelMultiSelectDialog(
            initialSelected: list,
          );
        },
      ).then(
        (value) {
          filterData.updateLevelIndex(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    void openFCTypeMultiSelectDialog() {
      List<FCType> list = filterData.fcType == null ? [] : filterData.fcType!;
      showDialog<List<FCType>>(
        context: context,
        builder: (BuildContext context) {
          return FCTypeMultiSelectDialog(
            initialSelected: list,
          );
        },
      ).then(
        (value) {
          filterData.updateFCType(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    void openFSTypeMultiSelectDialog() {
      List<FSType> list = filterData.fsType == null ? [] : filterData.fsType!;
      showDialog<List<FSType>>(
        context: context,
        builder: (BuildContext context) {
          return FSTypeMultiSelectDialog(
            initialSelected: list,
          );
        },
      ).then(
        (value) {
          filterData.updateFSType(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    Future<void> openVersionMultiSelectDialog() async {
      final repository = await ref.read(lxMaiRepositoryProvider.future);
      final List<SongVersion> versions = await repository.getSongVersion();
      List<SongVersion> list =
          filterData.version == null ? [] : filterData.version!;
      showDialog<List<SongVersion>>(
        context: context,
        builder: (BuildContext context) {
          return VersionMultiSelectDialog(
            initialSelected: list,
            versions: versions,
          );
        },
      ).then(
        (value) {
          filterData.updateVersion(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    Future<void> openGenreMultiSelectDialog() async {
      final repository = await ref.read(lxMaiRepositoryProvider.future);
      final List<SongGenre> genres = await repository.getSongGenre();
      List<SongGenre> list = filterData.genre == null ? [] : filterData.genre!;
      showDialog<List<SongGenre>>(
        context: context,
        builder: (BuildContext context) {
          return GenreMultiSelectDialog(
            initialSelected: list,
            genres: genres,
          );
        },
      ).then(
        (value) {
          filterData.updateGenre(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    void openSongTypeMultiSelectDialog() {
      List<SongType> list =
          filterData.songType == null ? [] : filterData.songType!;
      showDialog<List<SongType>>(
        context: context,
        builder: (BuildContext context) {
          return SongTypeMultiSelectDialog(
            initialSelected: list,
          );
        },
      ).then(
        (value) {
          filterData.updateSongType(value);
          lxMaiFilter.setFilter(filterData);
        },
      );
    }

    String getDateRangeText() {
      return filterData.uploadTimeRangeLabel == null
          ? '上传时间'
          : filterData.uploadTimeRangeLabel!;
    }

    String getLevelValueRangeText() {
      return filterData.levelValueRangeLabel == null
          ? '谱面定数'
          : filterData.levelValueRangeLabel!;
    }

    String getLevelIndexText() {
      return filterData.levelIndex == null || filterData.levelIndex!.isEmpty
          ? '难度'
          : filterData.levelIndex!.length == 1
              ? filterData.levelLabel!.first
              : '${filterData.levelIndex!.length} 个难度';
    }

    String getFCTypeText() {
      return filterData.fcType == null || filterData.fcType!.isEmpty
          ? 'FC 类型'
          : filterData.fcType!.length == 1
              ? filterData.fcTypeLabel!.first
              : '${filterData.fcType!.length} 个 FC 类型';
    }

    String getFSTypeText() {
      return filterData.fsType == null || filterData.fsType!.isEmpty
          ? 'FS 类型'
          : filterData.fsType!.length == 1
              ? filterData.fsTypeLabel!.first
              : '${filterData.fsType!.length} 个 FS 类型';
    }

    String getVersionText() {
      return filterData.version == null || filterData.version!.isEmpty
          ? '版本'
          : filterData.version!.length == 1
              ? filterData.versionLabel!.first
              : '${filterData.version!.length} 个版本';
    }

    String getGenreText() {
      return filterData.genre == null || filterData.genre!.isEmpty
          ? '分类'
          : filterData.genre!.length == 1
              ? filterData.genreLabel!.first
              : '${filterData.genre!.length} 个分类';
    }

    String getSongTypeText() {
      return filterData.songType == null || filterData.songType!.isEmpty
          ? '谱面类型'
          : filterData.songType!.length == 1
              ? filterData.songTypeLabel!.first
              : '${filterData.songType!.length} 个谱面类型';
    }

    return HideableBottomBar(
        visible: widget.visible,
        height: 128,
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
                            onPressed: lxMaiFilter.resetFilter,
                            child: const Row(children: [
                              Icon(Icons.refresh),
                              SizedBox(
                                width: 4,
                              ),
                              Text('重置过滤条件')
                            ])),
                        ActionChip(
                          onPressed: openLevelMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getLevelIndexText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openGenreMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getGenreText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openVersionMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getVersionText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openDateRangePickerDialog,
                          label: Row(
                            children: [
                              Text(getDateRangeText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openLevelValueRangeSliderDialog,
                          label: Row(
                            children: [
                              Text(getLevelValueRangeText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openFCTypeMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getFCTypeText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openFSTypeMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getFSTypeText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                        ActionChip(
                          onPressed: openSongTypeMultiSelectDialog,
                          label: Row(
                            children: [
                              Text(getSongTypeText()),
                              const SizedBox(width: 8),
                              const Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            )));
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
