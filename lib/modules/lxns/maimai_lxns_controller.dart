import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/services/account_service.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'services/maimai_isar_service.dart';
import 'services/maimai_api_service.dart';

/// Maimai 数据加载状态
enum DataLoadStatus {
  /// 空闲状态(未开始加载)
  idle,

  /// 从数据库加载中
  loadingFromDb,

  /// 从 API 加载中
  loadingFromApi,

  /// 加载成功
  success,

  /// 加载失败
  error,
}

/// Maimai LXNS 数据控制器 - 管理数据加载和状态
class MaimaiLxnsController extends GetxController {
  final MaimaiIsarService _isarService = MaimaiIsarService.instance;
  final MaimaiApiService _apiService = MaimaiApiService.instance;

  // ========== 状态管理 ==========
  final _loadStatus = DataLoadStatus.idle.obs;
  DataLoadStatus get loadStatus => _loadStatus.value;

  final _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  // ========== 曲目数据 ==========
  final _songs = <Song>[].obs;
  List<Song> get songs => _songs;

  final _songsFromDb = false.obs;
  bool get songsFromDb => _songsFromDb.value;

  // ========== 收藏品数据 ==========
  final _collections = <MaimaiCollection>[].obs;
  List<MaimaiCollection> get collections => _collections;

  final _collectionsFromDb = false.obs;
  bool get collectionsFromDb => _collectionsFromDb.value;

  final _filteredCollections = <MaimaiCollection>[].obs;
  List<MaimaiCollection> get filteredCollections => _filteredCollections;

  final _collectionSearchKeyword = ''.obs;
  String get collectionSearchKeyword => _collectionSearchKeyword.value;

  final _selectedCollectionType = 'plate'.obs;
  String get selectedCollectionType => _selectedCollectionType.value;

  // ========== 成绩数据 ==========
  final _scores = <Score>[].obs;
  List<Score> get scores => _scores;

  final _scoresFromDb = false.obs;
  bool get scoresFromDb => _scoresFromDb.value;

  // ========== 别名数据 ==========
  final _aliases = <Alias>[].obs;
  List<Alias> get aliases => _aliases;

  // ========== 版本数据 ==========
  final _versions = <Version>[].obs;
  List<Version> get versions => _versions;

  // ========== 筛选和搜索状态 ==========
  final _filteredSongs = <Song>[].obs;
  List<Song> get filteredSongs => _filteredSongs;

  final _searchKeyword = ''.obs;
  String get searchKeyword => _searchKeyword.value;

  final _selectedGenre = ''.obs;
  String get selectedGenre => _selectedGenre.value;

  final _selectedVersionId = 0.obs;
  int get selectedVersionId => _selectedVersionId.value;

  final _selectedType = ''.obs;
  String get selectedType => _selectedType.value;

  // ========== 统计信息 ==========
  int get totalSongs => _songs.length;
  int get totalCollections => _collections.length;
  int get totalScores => _scores.length;
  int get filteredSongsCount => _filteredSongs.length;
  int get filteredCollectionsCount => _filteredCollections.length;

  @override
  void onInit() {
    super.onInit();

    // 初始化时自动加载数据
    Future.wait([
      loadSongs(),
      loadCollections(),
      loadScores(),
      loadAliases(),
      loadVersions(),
    ]);
  }

  /// 加载所有数据(优先数据库)
  Future<void> loadAllData({bool forceRefresh = false}) async {
    await Future.wait([
      loadSongs(forceRefresh: forceRefresh),
      loadCollections(forceRefresh: forceRefresh),
      loadScores(forceRefresh: forceRefresh),
      loadAliases(forceRefresh: forceRefresh),
    ]);
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
          // 数据库有数据,使用数据库数据
          _songs.value = dbSongs;
          _songsFromDb.value = true;
          _loadStatus.value = DataLoadStatus.success;
          _filterSongs(); // 初始化筛选结果
        } else {
          // 数据库无数据,从 API 加载
          _loadStatus.value = DataLoadStatus.loadingFromApi;
          await _loadSongsFromApi();
        }
      }
    } catch (e) {
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '加载曲目失败: $e';
    }
  }

  /// 从 API 加载曲目并保存到数据库
  Future<void> _loadSongsFromApi() async {
    try {
      await _apiService.syncSongsToDatabase(
        onProgress: (current, total, description) {
          // 可以在这里更新进度
        },
      );

      // 从数据库重新读取
      final dbSongs = await _isarService.getAllSongs();
      _songs.value = dbSongs;
      _songsFromDb.value = false;
      _loadStatus.value = DataLoadStatus.success;
      _filterSongs(); // 初始化筛选结果
    } catch (e) {
      throw Exception('API 加载失败: $e');
    }
  }

  /// 加载收藏品数据
  Future<void> loadCollections({bool forceRefresh = false}) async {
    try {
      print('📦 开始加载收藏品数据 (forceRefresh: $forceRefresh)');

      if (forceRefresh) {
        print('🔄 强制刷新，从 API 加载...');
        _loadStatus.value = DataLoadStatus.loadingFromApi;
        await _loadCollectionsFromApi();
      } else {
        print('💾 尝试从数据库加载...');
        _loadStatus.value = DataLoadStatus.loadingFromDb;
        final dbCollections = await _isarService.getAllCollections();

        print('📊 数据库中收藏品数量: ${dbCollections.length}');

        if (dbCollections.isNotEmpty) {
          // 数据库有数据，使用数据库数据
          _collections.value = dbCollections;
          _collectionsFromDb.value = true;
          _loadStatus.value = DataLoadStatus.success;

          // 应用筛选
          _applyCollectionFilters();
        } else {
          // 数据库无数据，从 API 加载
          print('💾 数据库无数据，从 API 加载...');
          _loadStatus.value = DataLoadStatus.loadingFromApi;
          await _loadCollectionsFromApi();
        }
      }

      print('✨ 收藏品加载完成，当前数量: ${_collections.length}');
      print('📋 筛选后数量: ${_filteredCollections.length}');
    } catch (e) {
      print('❌ 加载收藏品失败: $e');
      print('❌ 错误堆栈: ${StackTrace.current}');
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '加载收藏品失败: $e';
    }
  }

  /// 从 API 加载收藏品并保存到数据库
  Future<void> _loadCollectionsFromApi() async {
    try {
      print('🌐 开始从 API 同步收藏品...');

      await _apiService.syncCollectionsToDatabase(
        onProgress: (current, total, description) {
          print('📥 同步进度: $current/$total - $description');
        },
      );

      print('💾 同步完成，从数据库读取...');

      // 从数据库重新读取
      final dbCollections = await _isarService.getAllCollections();

      print('📊 API 同步后数据库数量: ${dbCollections.length}');

      if (dbCollections.isNotEmpty) {
        // 打印前5个收藏品的类型信息
        final sample = dbCollections.take(5).toList();
        print('📝 API 同步的样本数据:');
        for (var c in sample) {
          print(
            '  - ID: ${c.collectionId}, Type: ${c.collectionType}, Name: ${c.name}',
          );
        }
      }

      _collections.value = dbCollections;
      _collectionsFromDb.value = false;
      _loadStatus.value = DataLoadStatus.success;

      print('✅ API 加载完成，设置到 controller: ${_collections.length} 件');

      // 应用筛选
      _applyCollectionFilters();
    } catch (e) {
      print('❌ API 加载失败: $e');
      print('❌ 错误堆栈: ${StackTrace.current}');
      throw Exception('API 加载失败: $e');
    }
  }

  /// 设置收藏品类型筛选
  void setCollectionType(String type) {
    _selectedCollectionType.value = type;
    _applyCollectionFilters();
  }

  /// 设置收藏品搜索关键词
  void setCollectionSearchKeyword(String keyword) {
    _collectionSearchKeyword.value = keyword;
    _applyCollectionFilters();
  }

  /// 应用收藏品筛选
  void _applyCollectionFilters() {
    var filtered = _collections.where((c) {
      // 按类型筛选
      if (c.collectionType != _selectedCollectionType.value) {
        return false;
      }

      // 按搜索关键词筛选
      if (_collectionSearchKeyword.value.isNotEmpty) {
        final keyword = _collectionSearchKeyword.value.toLowerCase();
        return c.name.toLowerCase().contains(keyword) ||
            (c.description?.toLowerCase().contains(keyword) ?? false);
      }

      return true;
    }).toList();

    _filteredCollections.value = filtered;
  }

  /// 加载成绩数据
  Future<void> loadScores({bool forceRefresh = false}) async {
    try {
      print('📊 开始加载成绩数据 (forceRefresh: $forceRefresh)');

      if (forceRefresh) {
        print('🔄 强制刷新，从 API 加载成绩...');
        _loadStatus.value = DataLoadStatus.loadingFromApi;
        await _loadScoresFromApi();
      } else {
        print('💾 尝试从数据库加载成绩...');
        _loadStatus.value = DataLoadStatus.loadingFromDb;
        final dbScores = await _isarService.getAllScoresSortedByRating();

        print('📊 数据库中成绩数量: ${dbScores.length}');

        if (dbScores.isNotEmpty) {
          // 数据库有数据，使用数据库数据
          _scores.value = dbScores;
          _scoresFromDb.value = true;
          _loadStatus.value = DataLoadStatus.success;
          print('✅ 成绩从数据库加载完成: ${_scores.length} 条');
        } else {
          // 数据库无数据，从 API 加载
          print('💾 数据库无成绩数据，尝试从 API 加载...');
          _loadStatus.value = DataLoadStatus.loadingFromApi;
          await _loadScoresFromApi();
        }
      }

      print('✨ 成绩加载完成，当前数量: ${_scores.length}');
    } catch (e) {
      print('❌ 加载成绩失败: $e');
      print('❌ 错误堆栈: ${StackTrace.current}');
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '加载成绩失败: $e';
    }
  }

  /// 从 API 加载成绩并保存到数据库
  Future<void> _loadScoresFromApi() async {
    try {
      // 获取当前账号
      final accountController = Get.find<AccountController>();
      final currentAccount = accountController.currentAccount;

      if (currentAccount == null) {
        print('⚠️ 未找到当前账号，无法加载成绩');
        _loadStatus.value = DataLoadStatus.error;
        _errorMessage.value = '请先登录账号';
        return;
      }

      print('🔑 使用账号: ${currentAccount.displayName}');
      print('🔐 开始获取凭据（自动处理 token 刷新）...');

      // 使用 AccountService 获取有效凭据（会自动刷新 token）
      final accountService = AccountService.instance;
      final accountWithValidToken = await accountService.getCredential(
        currentAccount,
      );

      final accessToken = accountWithValidToken.accessToken;
      if (accessToken == null || accessToken.isEmpty) {
        print('⚠️ 无法获取有效的访问令牌');
        _loadStatus.value = DataLoadStatus.error;
        _errorMessage.value = '账号未授权或令牌已失效，请重新登录';
        return;
      }

      print('✅ 凭据获取成功');
      print('🌐 开始从 API 同步成绩...');

      await _apiService.syncPlayerScoresToDatabase(
        accessToken: accessToken,
        onProgress: (current, total, description) {
          print('📥 同步进度: $current/$total - $description');
        },
      );

      print('💾 同步完成，从数据库读取...');

      // 从数据库重新读取
      final dbScores = await _isarService.getAllScoresSortedByRating();

      print('📊 API 同步后数据库数量: ${dbScores.length}');

      _scores.value = dbScores;
      _scoresFromDb.value = false;
      _loadStatus.value = DataLoadStatus.success;

      print('✅ API 加载完成，设置到 controller: ${_scores.length} 条成绩');
    } on CredentialExpiredException catch (e) {
      print('🔐 凭据已失效: $e');
      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = '凭据已失效，请在账号管理页面重新登录';

      // 显示用户友好提示
      Get.snackbar(
        '凭据已失效',
        '请在账号管理页面重新登录',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print('❌ API 加载成绩失败: $e');
      print('❌ 错误堆栈: ${StackTrace.current}');

      // 更友好的错误提示
      String errorMsg = '加载成绩失败';
      if (e.toString().contains('token') || e.toString().contains('401')) {
        errorMsg = '访问令牌已过期，请重新登录';
      } else if (e.toString().contains('network') ||
          e.toString().contains('timeout')) {
        errorMsg = '网络连接失败，请检查网络';
      }

      _loadStatus.value = DataLoadStatus.error;
      _errorMessage.value = errorMsg;
      throw Exception('API 加载成绩失败: $e');
    }
  }

  /// 加载别名数据
  Future<void> loadAliases({bool forceRefresh = false}) async {
    try {
      final database = await _isarService.db;
      final dbAliases = await database.alias.where().findAll();
      _aliases.value = dbAliases;
    } catch (e) {
      // 别名加载失败不影响主流程
      _aliases.value = [];
    }
  }

  /// 加载版本数据
  Future<void> loadVersions({bool forceRefresh = false}) async {
    try {
      final dbVersions = await _isarService.getAllVersions();
      // 按版本号降序排列
      dbVersions.sort((a, b) => b.version.compareTo(a.version));
      _versions.value = dbVersions;
    } catch (e) {
      // 版本加载失败不影响主流程
      _versions.value = [];
    }
  }

  /// 根据曲目 ID 获取别名
  List<String> getAliasesBySongId(int songId) {
    final alias = _aliases.firstWhereOrNull((a) => a.songId == songId);
    return alias?.aliases ?? [];
  }

  /// 根据曲目版本号获取所属版本信息
  /// 规则: 版本a的下一个版本b > 曲目版本 >= 版本a, 则该曲目所属版本为a
  /// 特殊情况:
  /// - 曲目版本 >= 最新版本, 属于最新版本
  /// - 曲目版本 < 最后一个版本(最旧版本), 属于最后一个版本
  Version? getVersionBySongVersion(int songVersion) {
    if (_versions.isEmpty) return null;

    // 如果 songVersion >= 最新版本,返回最新版本
    if (songVersion >= _versions.first.version) {
      return _versions.first;
    }

    // 如果 songVersion < 最后一个版本(最旧版本),返回最后一个版本
    if (songVersion < _versions.last.version) {
      return _versions.last;
    }

    // versions 已按降序排列,查找合适的版本区间
    for (int i = 0; i < _versions.length - 1; i++) {
      final currentVersion = _versions[i];
      final nextVersion = _versions[i + 1];

      // songVersion 在 nextVersion 和 currentVersion 之间
      if (songVersion >= nextVersion.version &&
          songVersion < currentVersion.version) {
        return nextVersion;
      }
    }

    return null;
  }

  // ========== 筛选和搜索方法 ==========

  /// 设置搜索关键词并触发筛选
  void setSearchKeyword(String keyword) {
    _searchKeyword.value = keyword;
    _filterSongs();
  }

  /// 设置分类筛选并触发筛选
  void setSelectedGenre(String genre) {
    _selectedGenre.value = genre;
    _filterSongs();
  }

  /// 设置版本筛选并触发筛选
  void setSelectedVersionId(int versionId) {
    _selectedVersionId.value = versionId;
    _filterSongs();
  }

  /// 设置谱面类型筛选并触发筛选
  void setSelectedType(String type) {
    _selectedType.value = type;
    _filterSongs();
  }

  /// 清除所有筛选条件
  void clearFilters() {
    _searchKeyword.value = '';
    _selectedGenre.value = '';
    _selectedVersionId.value = 0;
    _selectedType.value = '';
    _filterSongs();
  }

  /// 筛选曲目
  void _filterSongs() {
    final keyword = _searchKeyword.value.toLowerCase();

    var results = _songs.where((song) {
      // 搜索条件: 曲名、艺术家、谱师、分类、别名
      final matchesSearch =
          keyword.isEmpty ||
          song.title.toLowerCase().contains(keyword) ||
          song.artist.toLowerCase().contains(keyword) ||
          song.genre.toLowerCase().contains(keyword) ||
          _matchesNoteDesigner(song, keyword) ||
          _matchesAlias(song, keyword);

      // 分类筛选
      final matchesGenre =
          _selectedGenre.value.isEmpty || song.genre == _selectedGenre.value;

      // 版本筛选: 根据曲目的 version 字段和版本范围判断
      bool matchesVersion = true;
      if (_selectedVersionId.value != 0) {
        final songVersion = getVersionBySongVersion(song.version);
        matchesVersion =
            songVersion != null &&
            songVersion.versionId == _selectedVersionId.value;
      }

      // 谱面类型筛选
      final matchesType =
          _selectedType.value.isEmpty || _hasType(song, _selectedType.value);

      return matchesSearch && matchesGenre && matchesVersion && matchesType;
    }).toList();

    _filteredSongs.value = results;
  }

  /// 检查曲目是否有指定类型的谱面
  bool _hasType(Song song, String type) {
    switch (type) {
      case 'standard':
        return song.difficulties.standard.isNotEmpty;
      case 'dx':
        return song.difficulties.dx.isNotEmpty;
      case 'utage':
        return song.difficulties.utage.isNotEmpty;
      default:
        return true;
    }
  }

  /// 检查是否匹配谱师
  bool _matchesNoteDesigner(Song song, String keyword) {
    // 检查所有难度的谱师
    for (var diff in song.difficulties.standard) {
      if (diff.noteDesigner.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    for (var diff in song.difficulties.dx) {
      if (diff.noteDesigner.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  /// 检查是否匹配别名
  bool _matchesAlias(Song song, String keyword) {
    final aliases = getAliasesBySongId(song.songId);
    for (var alias in aliases) {
      if (alias.toLowerCase().contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  /// 获取所有分类
  List<String> getGenres() {
    final genres = _songs
        .map((song) => song.genre)
        .where((genre) => genre.isNotEmpty)
        .toSet()
        .toList();
    genres.sort();
    return genres;
  }

  /// 获取谱面类型选项
  List<Map<String, String>> getTypeOptions() {
    return [
      {'value': 'standard', 'label': 'Standard'},
      {'value': 'dx', 'label': 'DX'},
      {'value': 'utage', 'label': '宴会场'},
    ];
  }

  /// 根据版本 ID 获取版本标签
  String getVersionLabel(int versionId) {
    final version = _versions.firstWhereOrNull((v) => v.versionId == versionId);
    return version?.title ?? '';
  }

  /// 获取谱面类型的显示标签
  String getTypeLabel(String type) {
    switch (type) {
      case 'standard':
        return 'Standard';
      case 'dx':
        return 'DX';
      case 'utage':
        return '宴会场';
      default:
        return '';
    }
  }

  /// 搜索曲目
  Future<List<Song>> searchSongs(String keyword) async {
    if (keyword.isEmpty) return _songs;
    return await _isarService.searchSongsByTitle(keyword);
  }

  /// 按版本筛选曲目
  List<Song> filterSongsByVersion(int version) {
    // Song 模型中 version 是 int 类型
    return _songs.where((song) => song.version == version).toList();
  }

  // ========== 成绩相关方法 ==========

  /// 获取 Best 50 成绩
  List<Score> getBest50Scores() {
    if (_scores.length <= 50) {
      return _scores;
    }
    return _scores.take(50).toList();
  }

  /// 按曲目 ID 获取成绩
  List<Score> getScoresBySongId(int songId) {
    return _scores.where((score) => score.songId == songId).toList();
  }

  /// 获取指定难度以上的成绩
  List<Score> getScoresByMinLevel(double minLevel) {
    return _scores.where((score) {
      // 需要解析 level 字段，如 "14+" -> 14.7
      final levelStr = score.level.replaceAll('+', '');
      final levelValue = double.tryParse(levelStr) ?? 0;
      final actualLevel = score.level.contains('+')
          ? levelValue + 0.7
          : levelValue;
      return actualLevel >= minLevel;
    }).toList();
  }

  /// 获取指定评级的成绩
  List<Score> getScoresByRate(String rateType) {
    return _scores.where((score) => score.rate?.name == rateType).toList();
  }

  /// 获取 FC/AP 成绩统计
  Map<String, int> getFcStats() {
    final stats = <String, int>{};
    for (final score in _scores) {
      if (score.fc != null) {
        final fcType = score.fc!.name;
        stats[fcType] = (stats[fcType] ?? 0) + 1;
      }
    }
    return stats;
  }

  /// 获取 FS 成绩统计
  Map<String, int> getFsStats() {
    final stats = <String, int>{};
    for (final score in _scores) {
      if (score.fs != null) {
        final fsType = score.fs!.name;
        stats[fsType] = (stats[fsType] ?? 0) + 1;
      }
    }
    return stats;
  }

  // ========== 数据刷新 ==========

  /// 清除所有数据并重新从 API 加载
  Future<void> refreshAllData() async {
    await loadAllData(forceRefresh: true);
  }

  @override
  void onClose() {
    // 清理资源
    super.onClose();
  }
}
