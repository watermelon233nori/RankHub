import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class MaiSongFilterData {
  List<LevelIndex>? levelIndex;
  List<SongGenre>? genre;
  List<SongVersion>? version;
  DateRange? uploadTimeRange;
  RangeValues? levelValueRange;
  List<FCType>? fcType;
  List<FSType>? fsType;
  List<SongType>? songType;

  MaiSongFilterData({
    this.levelIndex,
    this.genre,
    this.version,
    this.uploadTimeRange,
    this.levelValueRange,
    this.fcType,
    this.fsType,
    this.songType,
  });

  void updateLevelIndex(List<LevelIndex>? levelIndex) =>
      this.levelIndex = levelIndex;
  void updateGenre(List<SongGenre>? songGenre) => genre = songGenre;
  void updateVersion(List<SongVersion>? songVersion) => version = songVersion;
  void updateUploadTimeRange(DateRange? uploadTimeRange) =>
      this.uploadTimeRange = uploadTimeRange;
  void updateLevelValueRange(RangeValues? levelValueRange) =>
      this.levelValueRange = levelValueRange;
  void updateFCType(List<FCType>? fcType) => this.fcType = fcType;
  void updateFSType(List<FSType>? fsType) => this.fsType = fsType;
  void updateSongType(List<SongType>? songType) => this.songType = songType;

  List<String>? get levelLabel =>
      levelIndex?.map((item) => item.label).toList();
  List<String>? get genreLabel => genre?.map((item) => item.title).toList();
  List<String>? get versionLabel => version?.map((item) => item.title).toList();
  String? get uploadTimeRangeLabel => (uploadTimeRange != null)
      ? '${uploadTimeRange!.start.year}/${uploadTimeRange!.start.month}/${uploadTimeRange!.start.day} - ${uploadTimeRange!.end.year}/${uploadTimeRange!.end.month}/${uploadTimeRange!.end.day}'
      : null;
  String? get levelValueRangeLabel => (levelValueRange != null)
      ? '${levelValueRange!.start} - ${levelValueRange!.end}'
      : null;
  List<String>? get fcTypeLabel => fcType?.map((item) => item.label).toList();
  List<String>? get fsTypeLabel => fsType?.map((item) => item.label).toList();
  List<String>? get songTypeLabel =>
      songType?.map((item) => item.label).toList();

  bool get areAllValuesNull =>
      levelIndex == null &&
      genre == null &&
      version == null &&
      uploadTimeRange == null &&
      levelValueRange == null &&
      fcType == null &&
      fsType == null &&
      songType == null;

  void clearAllValues() {
    levelIndex = null;
    genre = null;
    version = null;
    uploadTimeRange = null;
    levelValueRange = null;
    fcType = null;
    fsType = null;
    songType = null;
  }
}
