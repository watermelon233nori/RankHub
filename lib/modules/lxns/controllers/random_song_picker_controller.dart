import 'dart:math';
import 'package:get/get.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';
import '../services/maimai_isar_service.dart';

/// 随机选曲控制器
class RandomSongPickerController extends GetxController {
  final _isarService = MaimaiIsarService.instance;
  final _random = Random();

  // ========== 状态 ==========
  final isLoading = false.obs;
  final randomSongs = <Song>[].obs;

  // ========== 筛选条件 ==========
  final selectedDifficulties = <LevelIndex>[].obs;
  final selectedVersionIds = <int>[].obs;
  final selectedGenres = <String>[].obs;
  final minLevel = 1.0.obs;
  final maxLevel = 15.0.obs;
  final chartType = 'all'.obs; // 'all', 'standard', 'dx'
  final pickCount = 1.obs;

  // ========== 数据源 ==========
  final _allSongs = <Song>[];
  final versions = <Version>[].obs;
  final genres = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  /// 加载数据
  Future<void> _loadData() async {
    isLoading.value = true;
    try {
      // 加载所有曲目
      final songs = await _isarService.getAllSongs();
      _allSongs.addAll(songs);

      // 加载版本列表
      final versionList = await _isarService.getAllVersions();
      versions.value = versionList;

      // 提取所有分类
      final genreSet = <String>{};
      for (var song in songs) {
        if (song.genre.isNotEmpty) {
          genreSet.add(song.genre);
        }
      }
      genres.value = genreSet.toList()..sort();
    } catch (e) {
      print('加载数据失败: $e');
      Get.snackbar('错误', '加载数据失败: $e');
    } finally {
      isLoading.value = false;
    }
  }

  /// 随机选曲
  void pickRandomSongs() {
    if (_allSongs.isEmpty) {
      Get.snackbar('提示', '曲目数据未加载');
      return;
    }

    // 根据筛选条件过滤曲目
    final filteredSongs = _filterSongs();

    if (filteredSongs.isEmpty) {
      Get.snackbar('提示', '没有符合条件的曲目');
      return;
    }

    // 随机选取指定数量的曲目
    final count = pickCount.value.clamp(1, filteredSongs.length);
    final picked = <Song>[];
    final availableIndices = List.generate(filteredSongs.length, (i) => i);

    for (int i = 0; i < count; i++) {
      final randomIndex = _random.nextInt(availableIndices.length);
      final songIndex = availableIndices.removeAt(randomIndex);
      picked.add(filteredSongs[songIndex]);
    }

    randomSongs.value = picked;
  }

  /// 根据筛选条件过滤曲目
  List<Song> _filterSongs() {
    return _allSongs.where((song) {
      // 版本筛选
      if (selectedVersionIds.isNotEmpty &&
          !selectedVersionIds.contains(song.version)) {
        return false;
      }

      // 分类筛选
      if (selectedGenres.isNotEmpty && !selectedGenres.contains(song.genre)) {
        return false;
      }

      // 谱面类型筛选
      if (chartType.value == 'standard' && song.difficulties.standard.isEmpty) {
        return false;
      }
      if (chartType.value == 'dx' && song.difficulties.dx.isEmpty) {
        return false;
      }

      // 难度和定数筛选
      if (selectedDifficulties.isNotEmpty ||
          minLevel.value > 1.0 ||
          maxLevel.value < 15.0) {
        // 获取需要检查的谱面列表
        List<SongDifficulty> difficultiesToCheck = [];
        if (chartType.value == 'all') {
          difficultiesToCheck = [
            ...song.difficulties.standard,
            ...song.difficulties.dx,
          ];
        } else if (chartType.value == 'standard') {
          difficultiesToCheck = song.difficulties.standard;
        } else if (chartType.value == 'dx') {
          difficultiesToCheck = song.difficulties.dx;
        }

        // 检查是否有符合条件的谱面
        final hasMatchingDifficulty = difficultiesToCheck.any((diff) {
          // 难度筛选
          if (selectedDifficulties.isNotEmpty &&
              !selectedDifficulties.contains(diff.difficulty)) {
            return false;
          }

          // 定数筛选
          if (diff.levelValue < minLevel.value ||
              diff.levelValue > maxLevel.value) {
            return false;
          }

          return true;
        });

        if (!hasMatchingDifficulty) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  /// 重置筛选条件
  void resetFilters() {
    selectedDifficulties.clear();
    selectedVersionIds.clear();
    selectedGenres.clear();
    minLevel.value = 1.0;
    maxLevel.value = 15.0;
    chartType.value = 'all';
  }

  /// 清除随机结果
  void clearResults() {
    randomSongs.clear();
  }
}
