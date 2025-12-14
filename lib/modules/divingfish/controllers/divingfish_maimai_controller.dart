import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';
import 'package:rank_hub/models/divingfish/divingfish_merged_song.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_isar_service.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_api_service.dart';

/// 数据加载状态
enum DataLoadStatus { idle, loadingFromDb, loadingFromApi, success, error }

/// 水鱼 MaimaiDX 控制器
class DivingFishMaimaiController extends GetxController {
  final DivingFishIsarService _isarService = DivingFishIsarService.instance;
  final DivingFishApiService _apiService = DivingFishApiService.instance;

  // ========== 状态管理 ==========
  final _loadStatus = DataLoadStatus.idle.obs;
  DataLoadStatus get loadStatus => _loadStatus.value;

  final _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  // ========== 曲目数据 ==========
  final _songs = <DivingFishSong>[].obs;
  List<DivingFishSong> get songs => _songs;

  final _mergedSongs = <DivingFishMergedSong>[].obs;
  List<DivingFishMergedSong> get mergedSongs => _mergedSongs;

  final _songsFromDb = false.obs;
  bool get songsFromDb => _songsFromDb.value;

  // ========== 筛选和搜索状态 ==========
  final _filteredMergedSongs = <DivingFishMergedSong>[].obs;
  List<DivingFishMergedSong> get filteredMergedSongs => _filteredMergedSongs;

  final _searchKeyword = ''.obs;
  String get searchKeyword => _searchKeyword.value;

  final _selectedGenre = ''.obs;
  String get selectedGenre => _selectedGenre.value;

  final _selectedVersion = ''.obs;
  String get selectedVersion => _selectedVersion.value;

  final _selectedType = ''.obs;
  String get selectedType => _selectedType.value;

  // ========== 统计信息 ==========
  int get totalSongs => _songs.length;
  int get totalMergedSongs => _mergedSongs.length;
  int get filteredSongsCount => _filteredMergedSongs.length;

  @override
  void onInit() {
    super.onInit();
    // 自动加载曲目数据
    loadSongs();
  }

  /// 加载曲目数据
  Future<void> loadSongs({bool forceRefresh = false}) async {
    try {
      if (forceRefresh) {
        // 强制从 API 刷新
        _loadStatus.value = DataLoadStatus.loadingFromApi;
        await _loadSongsFromApi();
      } else {
        // 优先从数据库加载
        _loadStatus.value = DataLoadStatus.loadingFromDb;
        final dbSongs = await _isarService.getAllSongs();

        if (dbSongs.isNotEmpty) {
          _songs.value = dbSongs;
          _mergedSongs.value = DivingFishMergedSong.mergeFromSongs(dbSongs);
          _songsFromDb.value = true;
          _loadStatus.value = DataLoadStatus.success;
          _filterSongs();
        } else {
          // 数据库无数据,从 API 加载
          _loadStatus.value = DataLoadStatus.loadingFromApi;
          await _loadSongsFromApi();
        }
      }
    } catch (e) {
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '加载曲目数据失败: $e';
      print('❌ 加载曲目数据失败: $e');
      debugPrintStack(stackTrace: e is Error ? e.stackTrace : null);
    }
  }

  /// 从 API 加载曲目数据
  Future<void> _loadSongsFromApi() async {
    try {
      final musicData = await _apiService.getMaimaiMusicData();

      // 转换为模型
      final songs = musicData
          .map((json) => DivingFishSong.fromJson(json as Map<String, dynamic>))
          .toList();

      // 保存到数据库
      await _isarService.saveSongs(songs);

      // 更新状态
      _songs.value = songs;
      _mergedSongs.value = DivingFishMergedSong.mergeFromSongs(songs);
      _songsFromDb.value = false;
      _loadStatus.value = DataLoadStatus.success;
      _filterSongs();

      print('✅ 从 API 加载了 ${songs.length} 首曲目，合并后 ${_mergedSongs.length} 首');
    } catch (e) {
      rethrow;
    }
  }

  // ========== 搜索和筛选 ==========

  /// 设置搜索关键词
  void setSearchKeyword(String keyword) {
    _searchKeyword.value = keyword;
    _filterSongs();
  }

  /// 设置流派筛选
  void setGenreFilter(String genre) {
    _selectedGenre.value = genre;
    _filterSongs();
  }

  /// 设置版本筛选
  void setVersionFilter(String version) {
    _selectedVersion.value = version;
    _filterSongs();
  }

  /// 设置类型筛选
  void setTypeFilter(String type) {
    _selectedType.value = type;
    _filterSongs();
  }

  /// 清除所有筛选
  void clearFilters() {
    _selectedGenre.value = '';
    _selectedVersion.value = '';
    _selectedType.value = '';
    _searchKeyword.value = '';
    _filterSongs();
  }

  /// 执行筛选
  void _filterSongs() {
    var result = _mergedSongs.toList();

    // 搜索关键词筛选
    if (_searchKeyword.value.isNotEmpty) {
      final keyword = _searchKeyword.value.toLowerCase();
      result = result.where((mergedSong) {
        return mergedSong.searchableText.contains(keyword);
      }).toList();
    }

    // 流派筛选
    if (_selectedGenre.value.isNotEmpty) {
      result = result
          .where(
            (mergedSong) => mergedSong.basicInfo?.genre == _selectedGenre.value,
          )
          .toList();
    }

    // 版本筛选
    if (_selectedVersion.value.isNotEmpty) {
      result = result
          .where(
            (mergedSong) =>
                mergedSong.basicInfo?.from == _selectedVersion.value,
          )
          .toList();
    }

    // 类型筛选（只显示有对应类型的曲目）
    if (_selectedType.value.isNotEmpty) {
      result = result.where((mergedSong) {
        if (_selectedType.value == 'SD') {
          return mergedSong.sdVersion != null;
        } else if (_selectedType.value == 'DX') {
          return mergedSong.dxVersion != null;
        }
        return true;
      }).toList();
    }

    _filteredMergedSongs.value = result;
  }

  // ========== 辅助方法 ==========

  /// 获取所有流派列表
  Future<List<String>> getAllGenres() async {
    return await _isarService.getAllGenres();
  }

  /// 获取所有版本列表
  Future<List<String>> getAllVersions() async {
    return await _isarService.getAllVersions();
  }

  /// 获取类型标签
  String getTypeLabel(String type) {
    switch (type) {
      case 'DX':
        return 'DX';
      case 'SD':
        return '标准';
      default:
        return type;
    }
  }
}
