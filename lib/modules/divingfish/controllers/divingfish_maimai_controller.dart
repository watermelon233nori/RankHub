import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/models/divingfish/divingfish_alias.dart';
import 'package:rank_hub/models/divingfish/divingfish_merged_song.dart';
import 'package:rank_hub/models/divingfish/divingfish_score.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_api_service.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_isar_service.dart';

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

  final _aliases = <DivingFishAlias>[].obs;
  List<DivingFishAlias> get aliases => _aliases;

  final _songsFromDb = false.obs;
  bool get songsFromDb => _songsFromDb.value;

  // ========== 成绩数据 ==========
  final _scores = <DivingFishScore>[].obs;
  List<DivingFishScore> get scores => _scores;

  final _scoresFromDb = false.obs;
  bool get scoresFromDb => _scoresFromDb.value;

  // ========== 玩家信息 ==========
  final Rx<DivingFishPlayerData?> _playerData = Rx<DivingFishPlayerData?>(null);
  DivingFishPlayerData? get playerData => _playerData.value;

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
  int get totalScores => _scores.length;

  @override
  void onInit() {
    super.onInit();
    loadSongs();
    loadScores();
    loadAliases();
  }

  /// 加载曲目数据
  Future<void> loadSongs({bool forceRefresh = false}) async {
    _errorMessage.value = '';
    try {
      if (forceRefresh) {
        _loadStatus.value = DataLoadStatus.loadingFromApi;
        await _loadSongsFromApi();
        return;
      }

      _loadStatus.value = DataLoadStatus.loadingFromDb;
      final dbSongs = await _isarService.getAllSongs();

      if (dbSongs.isNotEmpty) {
        _songs.value = dbSongs;
        _mergedSongs.value = DivingFishMergedSong.mergeFromSongs(dbSongs);
        _songsFromDb.value = true;
        _loadStatus.value = DataLoadStatus.success;
        _filterSongs();
      } else {
        _loadStatus.value = DataLoadStatus.loadingFromApi;
        await _loadSongsFromApi();
      }
    } catch (e, stack) {
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '加载曲目数据失败: $e';
      debugPrintStack(stackTrace: stack);
    }
  }

  /// 从 API 拉取曲目数据
  Future<void> _loadSongsFromApi() async {
    final musicData = await _apiService.getMaimaiMusicData();

    final songs = musicData
        .whereType<Map<String, dynamic>>()
        .map(DivingFishSong.fromJson)
        .toList();

    await _isarService.saveSongs(songs);

    _songs.value = songs;
    _mergedSongs.value = DivingFishMergedSong.mergeFromSongs(songs);
    _songsFromDb.value = false;
    _loadStatus.value = DataLoadStatus.success;
    _filterSongs();
  }

  Future<void> loadAliases({bool forceRefresh = false}) async {
    try {
      if (!forceRefresh) {
        final cached = await _isarService.getAllAliases();
        if (cached.isNotEmpty) {
          _aliases.value = cached;
          if (_searchKeyword.value.isNotEmpty) {
            _filterSongs();
          }
          return;
        }
      }

      final remote = await _apiService.getAliasList();
      await _isarService.saveAliases(remote);
      _aliases.value = remote;

      if (_searchKeyword.value.isNotEmpty) {
        _filterSongs();
      }
    } catch (e, stack) {
      debugPrint('加载别名失败: $e');
      debugPrintStack(stackTrace: stack);
    }
  }

  // ========== 成绩数据加载 ==========

  /// 加载成绩数据
  Future<void> loadScores({bool forceRefresh = false}) async {
    try {
      if (forceRefresh) {
        await _loadScoresFromApi();
        return;
      }

      final dbScores = await _isarService.getAllScores();
      final dbPlayerData = await _isarService.getLatestPlayerData();

      if (dbScores.isNotEmpty) {
        _scores.value = dbScores;
        _playerData.value = dbPlayerData;
        _scoresFromDb.value = true;
      } else {
        await _loadScoresFromApi();
      }
    } catch (e, stack) {
      _errorMessage.value = '加载成绩数据失败: $e';
      debugPrintStack(stackTrace: stack);
    }
  }

  /// 从 API 拉取成绩数据
  Future<void> _loadScoresFromApi() async {
    final accountController = Get.find<AccountController>();
    final account = accountController.currentAccount;

    if (account == null) {
      throw Exception('未找到当前账号，无法加载成绩');
    }

    final result = await _apiService.getPlayerRecords(account: account);

    await _isarService.savePlayerData(result.playerData);
    await _isarService.saveScores(result.scores);

    _playerData.value = result.playerData;
    _scores.value = result.scores;
    _scoresFromDb.value = false;
  }

  /// 计算 B50（DX 前 15，标准前 35）
  ({List<DivingFishScore> dxTop15, List<DivingFishScore> standardTop35})
  calculateBest50() {
    final dxScores = _scores.where((s) => s.type.toUpperCase() == 'DX').toList()
      ..sort((a, b) => b.ra.compareTo(a.ra));

    final standardScores =
        _scores.where((s) => s.type.toUpperCase() == 'SD').toList()
          ..sort((a, b) => b.ra.compareTo(a.ra));

    return (
      dxTop15: dxScores.take(15).toList(),
      standardTop35: standardScores.take(35).toList(),
    );
  }

  // ========== 搜索与筛选 ==========

  /// 设置搜索关键词
  void setSearchKeyword(String keyword) {
    _searchKeyword.value = keyword.trim();
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

  /// 清除所有筛选条件
  void clearFilters() {
    _selectedGenre.value = '';
    _selectedVersion.value = '';
    _selectedType.value = '';
    _filterSongs();
  }

  void _filterSongs() {
    var result = _mergedSongs.toList();

    if (_searchKeyword.value.isNotEmpty) {
      final keyword = _searchKeyword.value.toLowerCase();
      result = result
          .where(
            (song) =>
                song.searchableText.contains(keyword) ||
                _matchesAlias(song, keyword),
          )
          .toList();
    }

    if (_selectedGenre.value.isNotEmpty) {
      result = result
          .where((song) => song.basicInfo?.genre == _selectedGenre.value)
          .toList();
    }

    if (_selectedVersion.value.isNotEmpty) {
      result = result
          .where((song) => song.basicInfo?.from == _selectedVersion.value)
          .toList();
    }

    if (_selectedType.value.isNotEmpty) {
      result = result.where((song) {
        if (_selectedType.value == 'SD') {
          return song.sdVersion != null;
        }
        if (_selectedType.value == 'DX') {
          return song.dxVersion != null;
        }
        return true;
      }).toList();
    }

    _filteredMergedSongs.value = result;
  }

  // ========== 辅助方法 ==========

  Future<List<String>> getAllGenres() async {
    return await _isarService.getAllGenres();
  }

  List<String> getAliasesBySongId(int songId) {
    final alias = _aliases.firstWhereOrNull((a) => a.songId == songId);
    return alias?.aliases ?? const [];
  }

  bool _matchesAlias(DivingFishMergedSong song, String keyword) {
    final ids = <int?>[song.dxVersion?.songId, song.sdVersion?.songId];
    for (final id in ids) {
      if (id == null) continue;
      final aliases = getAliasesBySongId(id);
      if (aliases.any((a) => a.toLowerCase().contains(keyword))) {
        return true;
      }
    }
    return false;
  }

  Future<List<String>> getAllVersions() async {
    return await _isarService.getAllVersions();
  }

  String getTypeLabel(String type) {
    switch (type) {
      case 'DX':
        return 'DX';
      case 'SD':
        return '标准';
      default:
        return '全部';
    }
  }
}
