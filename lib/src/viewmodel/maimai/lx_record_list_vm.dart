import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rank_hub/src/model/mai_song_filter_data.dart';
import 'package:rank_hub/src/model/mai_types.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/model/maimai/song_info.dart';
import 'package:rank_hub/src/model/maimai/song_score.dart';
import 'package:rank_hub/src/provider/data_source_provider.dart';
import 'package:rank_hub/src/view/maimai/lx_record_list_view.dart';

class RecordListViewModel extends ChangeNotifier {
  final DataSourceProvider<SongScore, PlayerData, SongInfo> dataSourceProvider;
  final BuildContext buildContext;
  final FocusNode focusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();
  final MaiSongFilterData filterData = MaiSongFilterData();

  late ScrollController scrollController;

  bool isVisible = true;
  String searchQuery = "";
  List<SongScore> scores = [];
  List<SongScore> filteredScores = [];
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  RecordListViewModel(this.dataSourceProvider, this.buildContext) {
    scrollController = ScrollController();
    scrollController.addListener(_listenToScroll);
    searchController.addListener(() {
      searchQuery = searchController.text;
      filterSearchResults();
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_listenToScroll);
    scrollController.dispose();
    searchController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void resetFilter() {
    filterData.clearAllValues();
    _requestRebuild();
  }

  void openDateRangePickerDialog() {
    showCalendarDatePicker2Dialog(
      dialogSize: const Size(350, 370),
      context: buildContext,
      value: [filterData.uploadTimeStart, filterData.uploadTimeEnd],
      config: CalendarDatePicker2WithActionButtonsConfig(
          calendarType: CalendarDatePicker2Type.range),
    ).then((values) {
      if (values != null && values.isNotEmpty) {
        filterData.updateUploadTimeStart(values.first);
        filterData.updateUploadTimeEnd(values.last);
      } else {
        filterData.updateUploadTimeStart(null);
        filterData.updateUploadTimeEnd(null);
      }
      _requestRebuild();
    });
  }

  void openLevelValueRangeSliderDialog() {
    double startValue =
        filterData.levelValueStart == null ? 1.0 : filterData.levelValueStart!;
    double endValue =
        filterData.levelValueEnd == null ? 15.0 : filterData.levelValueEnd!;
    showDialog<RangeValues>(
      context: buildContext,
      builder: (BuildContext context) {
        return LevelValueRangeSliderDialog(
          initialRange: RangeValues(startValue, endValue),
        );
      },
    ).then((range) {
      filterData.updateLevelValueStart(startValue);
      filterData.updateLevelValueEnd(endValue);
      _requestRebuild();
    });
  }

  void openLevelMultiSelectDialog() {
    List<LevelIndex> list =
        filterData.levelIndex == null ? [] : filterData.levelIndex!;
    showDialog<List<LevelIndex>>(
      context: buildContext,
      builder: (BuildContext context) {
        return LevelMultiSelectDialog(
          initialSelected: list,
        );
      },
    ).then((value) {
      filterData.updateLevelIndex(value);
      _requestRebuild();
    },);
  }

  void openFCTypeMultiSelectDialog() {
    List<FCType> list =
        filterData.fcType == null ? [] : filterData.fcType!;
    showDialog<List<FCType>>(
      context: buildContext,
      builder: (BuildContext context) {
        return FCTypeMultiSelectDialog(
          initialSelected: list,
        );
      },
    ).then((value) {
      filterData.updateFCType(value);
      _requestRebuild();
    },);
  }

  void openFSTypeMultiSelectDialog() {
    List<FSType> list =
        filterData.fsType == null ? [] : filterData.fsType!;
    showDialog<List<FSType>>(
      context: buildContext,
      builder: (BuildContext context) {
        return FSTypeMultiSelectDialog(
          initialSelected: list,
        );
      },
    ).then((value) {
      filterData.updateFSType(value);
      _requestRebuild();
    },);
  }

  String getDateRangeText() {
    return filterData.uploadTimeRange == null
        ? '上传时间'
        : filterData.uploadTimeRange!;
  }

  String getLevelValueRangeText() {
    return filterData.levelValueRange == null
        ? '谱面定数'
        : filterData.levelValueRange!;
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

  void _listenToScroll() {
    switch (scrollController.position.userScrollDirection) {
      case ScrollDirection.forward:
        showFab();
        break;
      case ScrollDirection.reverse:
        hideFab();
        break;
      case ScrollDirection.idle:
        break;
    }
  }

  void showFab() {
    if (!isVisible) {
      isVisible = true;
      _requestRebuild();
    }
  }

  void hideFab() {
    if (searchController.text.isNotEmpty || focusNode.hasFocus) {
      return;
    }
    if (isVisible) {
      isVisible = false;
      _requestRebuild();
    }
  }

  Future<void> fetchRecords({bool force = false}) async {
    isLoading = true;
    hasError = false;
    errorMessage = '';
    _requestRebuild();

    try {
      scores = await dataSourceProvider.getRecords(forceRefresh: force);
      filteredScores = scores;
      isLoading = false;
    } catch (e) {
      isLoading = false;
      hasError = true;
      errorMessage = 'Failed to load songs: $e';
    }
    _requestRebuild();
  }

  Future<void> filterSearchResults() async {
    if (searchQuery.isEmpty) {
      filteredScores = scores;
    } else {
      List<SongInfo> preFiltered =
          await dataSourceProvider.searchSongs(searchQuery);

      filteredScores = scores
          .where((song) => preFiltered.any((filteredSong) {
                return filteredSong.id == song.id;
              }))
          .toList();
    }
    _requestRebuild();
  }

  void _requestRebuild() {
    if (buildContext.mounted) {
      notifyListeners();
    }
  }
}
