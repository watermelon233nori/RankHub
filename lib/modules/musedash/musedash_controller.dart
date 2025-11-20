import 'package:get/get.dart';
import 'package:rank_hub/models/musedash/musedash_album.dart';
import 'package:rank_hub/models/musedash/musedash_music.dart';
import 'package:rank_hub/models/musedash/musedash_character.dart';
import 'package:rank_hub/models/musedash/musedash_elfin.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:rank_hub/models/musedash/musedash_score.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';
import 'package:rank_hub/modules/musedash/services/musedash_music_api_service.dart';
import 'package:rank_hub/modules/musedash/services/musedash_extra_api_service.dart';
import 'package:rank_hub/modules/musedash/services/musedash_player_api_service.dart';

/// 数据加载状态
enum MuseDashDataLoadStatus {
  idle,
  loadingFromDb,
  loadingFromApi,
  success,
  error,
}

/// MuseDash 数据控制器
class MuseDashController extends GetxController {
  final _isarService = MuseDashIsarService.instance;
  final _apiService = MuseDashMusicApiService.instance;
  final _extraApiService = MuseDashExtraApiService.instance;
  final _playerApiService = MuseDashPlayerApiService.instance;

  // ========== 状态管理 ==========
  final _loadStatus = MuseDashDataLoadStatus.idle.obs;
  MuseDashDataLoadStatus get loadStatus => _loadStatus.value;

  final _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  final _syncProgress = 0.0.obs;
  double get syncProgress => _syncProgress.value;

  final _syncDescription = ''.obs;
  String get syncDescription => _syncDescription.value;

  // ========== 专辑数据 ==========
  final _albums = <MuseDashAlbum>[].obs;
  List<MuseDashAlbum> get albums => _albums;

  // ========== 音乐数据 ==========
  final _music = <MuseDashMusic>[].obs;
  List<MuseDashMusic> get music => _music;

  final _filteredMusic = <MuseDashMusic>[].obs;
  List<MuseDashMusic> get filteredMusic => _filteredMusic;

  // ========== 搜索和筛选状态 ==========
  final _searchKeyword = ''.obs;
  String get searchKeyword => _searchKeyword.value;

  final _selectedAlbumUid = ''.obs;
  String get selectedAlbumUid => _selectedAlbumUid.value;

  final _selectedMinDifficulty = 0.obs;
  int get selectedMinDifficulty => _selectedMinDifficulty.value;

  // ========== 角色数据 ==========
  final _characters = <MuseDashCharacter>[].obs;
  List<MuseDashCharacter> get characters => _characters;

  // ========== 精灵数据 ==========
  final _elfins = <MuseDashElfin>[].obs;
  List<MuseDashElfin> get elfins => _elfins;

  // ========== 统计信息 ==========
  int get totalAlbums => _albums.length;
  int get totalMusic => _music.length;
  int get totalCharacters => _characters.length;
  int get totalElfins => _elfins.length;
  int get filteredMusicCount => _filteredMusic.length;

  @override
  void onInit() {
    super.onInit();
    loadAllData();
  }

  /// 加载所有数据
  Future<void> loadAllData({bool forceRefresh = false}) async {
    try {
      if (forceRefresh) {
        _loadStatus.value = MuseDashDataLoadStatus.loadingFromApi;
        await _loadDataFromApi();
      } else {
        _loadStatus.value = MuseDashDataLoadStatus.loadingFromDb;
        final dbAlbums = await _isarService.getAllAlbums();
        final dbMusic = await _isarService.getAllMusic();
        final dbCharacters = await _isarService.getAllCharacters();
        final dbElfins = await _isarService.getAllElfins();

        if (dbAlbums.isNotEmpty && dbMusic.isNotEmpty) {
          _albums.value = dbAlbums;
          _music.value = dbMusic;
          _characters.value = dbCharacters;
          _elfins.value = dbElfins;
          _loadStatus.value = MuseDashDataLoadStatus.success;
          _filterMusic();

          // 如果角色或精灵数据为空，后台加载
          if (dbCharacters.isEmpty || dbElfins.isEmpty) {
            _loadExtraDataInBackground();
          }
        } else {
          _loadStatus.value = MuseDashDataLoadStatus.loadingFromApi;
          await _loadDataFromApi();
        }
      }
    } catch (e) {
      _loadStatus.value = MuseDashDataLoadStatus.error;
      _errorMessage.value = '加载数据失败: $e';
      print('❌ 加载数据失败: $e');
    }
  }

  /// 从 API 加载数据
  Future<void> _loadDataFromApi() async {
    try {
      await _apiService.syncAlbumsToDatabase(
        onProgress: (current, total, description) {
          _syncProgress.value = current / total;
          _syncDescription.value = description;
        },
      );

      final dbAlbums = await _isarService.getAllAlbums();
      final dbMusic = await _isarService.getAllMusic();

      _albums.value = dbAlbums;
      _music.value = dbMusic;
      _loadStatus.value = MuseDashDataLoadStatus.success;
      _filterMusic();

      print('✅ 数据加载完成: ${_albums.length} 个专辑, ${_music.length} 首音乐');

      // 后台加载角色和精灵数据
      _loadExtraDataInBackground();
    } catch (e) {
      throw Exception('API 加载失败: $e');
    }
  }

  /// 后台加载角色和精灵数据
  Future<void> _loadExtraDataInBackground() async {
    try {
      print('📥 后台加载角色和精灵数据...');
      await _extraApiService.syncAllExtraData(
        onProgress: (current, total, description) {
          print('📊 加载进度: $current/$total - $description');
        },
      );

      final dbCharacters = await _isarService.getAllCharacters();
      final dbElfins = await _isarService.getAllElfins();

      _characters.value = dbCharacters;
      _elfins.value = dbElfins;

      print('✅ 角色和精灵数据加载完成: ${_characters.length} 个角色, ${_elfins.length} 个精灵');
    } catch (e) {
      print('⚠️ 后台加载角色和精灵数据失败: $e');
      // 不影响主要功能，只打印警告
    }
  }

  /// 设置搜索关键词
  void setSearchKeyword(String keyword) {
    _searchKeyword.value = keyword;
    _filterMusic();
  }

  /// 设置专辑筛选
  void setSelectedAlbumUid(String albumUid) {
    _selectedAlbumUid.value = albumUid;
    _filterMusic();
  }

  /// 设置最低难度筛选
  void setSelectedMinDifficulty(int difficulty) {
    _selectedMinDifficulty.value = difficulty;
    _filterMusic();
  }

  /// 清除所有筛选
  void clearFilters() {
    _searchKeyword.value = '';
    _selectedAlbumUid.value = '';
    _selectedMinDifficulty.value = 0;
    _filterMusic();
  }

  /// 筛选音乐
  void _filterMusic() {
    final keyword = _searchKeyword.value.toLowerCase();

    var results = _music.where((music) {
      // 搜索条件
      final matchesSearch =
          keyword.isEmpty ||
          music.name.toLowerCase().contains(keyword) ||
          music.author.toLowerCase().contains(keyword);

      // 专辑筛选
      final matchesAlbum =
          _selectedAlbumUid.value.isEmpty ||
          music.albumUid == _selectedAlbumUid.value;

      // 难度筛选
      bool matchesDifficulty = true;
      if (_selectedMinDifficulty.value > 0) {
        try {
          matchesDifficulty =
              music.getMaxDifficulty() >= _selectedMinDifficulty.value;
        } catch (e) {
          matchesDifficulty = false;
        }
      }

      return matchesSearch && matchesAlbum && matchesDifficulty;
    }).toList();

    _filteredMusic.value = results;
  }

  /// 获取专辑名称
  String getAlbumName(String albumUid) {
    final album = _albums.firstWhereOrNull((a) => a.uid == albumUid);
    return album?.title ?? '未知专辑';
  }

  /// 刷新数据
  Future<void> refreshData() async {
    await loadAllData(forceRefresh: true);
  }

  // ========== 玩家成绩相关方法 ==========

  /// 获取玩家信息
  Future<MuseDashPlayer?> getPlayerInfo(String userUuid) async {
    return await _isarService.getPlayerByUuid(userUuid);
  }

  /// 获取 Best 30 成绩
  Future<List<MuseDashScore>> getBest30Scores(String userUuid) async {
    return await _playerApiService.getBest30Scores(userUuid);
  }

  /// 获取所有成绩
  Future<List<MuseDashScore>> getAllScores(String userUuid) async {
    return await _isarService.getScoresByUserUuid(userUuid);
  }

  /// 同步玩家成绩
  Future<void> syncPlayerScores(String userUuid) async {
    await _playerApiService.syncPlayerDataToDatabase(
      userUuid: userUuid,
      onProgress: (current, total, description) {
        print('📊 同步进度: $current/$total - $description');
      },
    );
  }
}
