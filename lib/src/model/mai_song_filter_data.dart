import 'package:rank_hub/src/model/mai_types.dart';
import 'package:rank_hub/src/model/maimai/song_version.dart';
import 'package:rank_hub/src/model/song_genre_model.dart';

class MaiSongFilterData {
  List<LevelIndex>? levelIndex;
  SongGenre? genre;
  SongVersion? version;
  DateTime? uploadTimeStart;
  DateTime? uploadTimeEnd;
  double? levelValueStart;
  double? levelValueEnd;
  List<FCType>? fcType;
  List<FSType>? fsType;
  SongType? songType;

  MaiSongFilterData({
    this.levelIndex,
    this.genre,
    this.version,
    this.uploadTimeStart,
    this.uploadTimeEnd,
    this.levelValueStart,
    this.levelValueEnd,
    this.fcType,
    this.fsType,
    this.songType,
  });

  void updateLevelIndex(List<LevelIndex>? levelIndex) => this.levelIndex = levelIndex;
  void updateGenre(SongGenre? songGenre) => genre = songGenre;
  void updateVersion(SongVersion? songVersion) => version = songVersion;
  void updateUploadTimeStart(DateTime? uploadTimeStart) =>
      this.uploadTimeStart = uploadTimeStart;
  void updateUploadTimeEnd(DateTime? uploadTimeEnd) =>
      this.uploadTimeEnd = uploadTimeEnd;
  void updateLevelValueStart(double? levelValueStart) =>
      this.levelValueStart = levelValueStart;
  void updateLevelValueEnd(double? levelValueEnd) =>
      this.levelValueEnd = levelValueEnd;
  void updateFCType(List<FCType>? fcType) => this.fcType = fcType;
  void updateFSType(List<FSType>? fsType) => this.fsType = fsType;
  void updateSongType(SongType? songType) => this.songType = songType;

  List<String>? get levelLabel => levelIndex?.map((item) => item.label).toList();
  String? get genreLabel => genre?.title;
  String? get versionLabel => version?.title;
  String? get uploadTimeRange => (uploadTimeStart != null &&
          uploadTimeEnd != null)
      ? '${uploadTimeStart!.year}/${uploadTimeStart!.month}/${uploadTimeStart!.day} - ${uploadTimeEnd!.year}/${uploadTimeEnd!.month}/${uploadTimeEnd!.day}'
      : null;
  String? get levelValueRange => (levelValueStart != null &&
          levelValueEnd != null)
      ? '${levelValueStart!.toStringAsFixed(1)} - ${levelValueEnd!.toStringAsFixed(1)}'
      : null;
  List<String>? get fcTypeLabel => fcType?.map((item) => item.label).toList();
  List<String>? get fsTypeLabel => fsType?.map((item) => item.label).toList();
  String? get songTypeLabel => songType?.label;

  bool get areAllValuesNull =>
      levelIndex == null &&
      genre == null &&
      version == null &&
      uploadTimeStart == null &&
      uploadTimeEnd == null &&
      levelValueStart == null &&
      levelValueEnd == null &&
      fcType == null &&
      fsType == null &&
      songType == null;

  void clearAllValues() {
    levelIndex = null;
    genre = null;
    version = null;
    uploadTimeStart = null;
    uploadTimeEnd = null;
    levelValueStart = null;
    levelValueEnd = null;
    fcType = null;
    fsType = null;
    songType = null;
  }
}
