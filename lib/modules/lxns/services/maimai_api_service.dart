import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/models/maimai/player.dart';
import 'package:rank_hub/services/isar_service.dart';
import 'lxns_api_response.dart';

/// 收藏品类型枚举
enum CollectionType {
  trophy('trophy', 'trophies'),
  icon('icon', 'icons'),
  plate('plate', 'plates'),
  frame('frame', 'frames');

  const CollectionType(this.path, this.key);
  final String path;
  final String key;
}

/// Maimai API 服务
class MaimaiApiService {
  static MaimaiApiService? _instance;
  static Dio? _dio;

  /// API 基础 URL
  static const String baseUrl = 'https://maimai.lxns.net';

  /// 资源基础 URL
  static const String assetsBaseUrl = 'https://assets2.lxns.net/maimai';

  /// 默认游戏版本
  static const int defaultVersion = 25000;

  MaimaiApiService._();

  /// 获取单例实例
  static MaimaiApiService get instance {
    _instance ??= MaimaiApiService._();
    return _instance!;
  }

  /// 获取 Dio 实例
  Future<Dio> get dio async {
    if (_dio != null) return _dio!;
    _dio = await _initDio();
    return _dio!;
  }

  /// 初始化 Dio
  Future<Dio> _initDio() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'User-Agent': 'RankHub/1.0.0'},
      ),
    );

    // 添加日志拦截器（仅开发环境）
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => print('[API] $obj'),
      ),
    );

    return dio;
  }

  // ==================== 曲目相关 API ====================

  /// 获取曲目列表及相关数据
  ///
  /// [version] 游戏版本，默认 25000
  /// [notes] 是否包含谱面物量，默认 false
  /// [forceRefresh] 是否强制刷新，跳过缓存
  ///
  /// 返回值：
  /// - songs: 曲目列表
  /// - genres: 乐曲分类列表
  /// - versions: 曲目版本列表
  Future<Map<String, dynamic>> getSongList({
    int version = defaultVersion,
    bool notes = false,
    bool forceRefresh = false,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/song/list',
      queryParameters: {'version': version, 'notes': notes},
      options: Options(extra: forceRefresh ? {'refresh': true} : {}),
    );

    final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      dataParser: (data) => data as Map<String, dynamic>,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取曲目列表失败',
        code: apiResponse.code,
      );
    }

    final data = apiResponse.data!;
    final songs = (data['songs'] as List)
        .map((e) => Song.fromJson(e as Map<String, dynamic>))
        .toList();
    final genres = (data['genres'] as List)
        .map((e) => Genre.fromJson(e as Map<String, dynamic>))
        .toList();
    final versions = (data['versions'] as List)
        .map((e) => Version.fromJson(e as Map<String, dynamic>))
        .toList();

    return {'songs': songs, 'genres': genres, 'versions': versions};
  }

  /// 获取曲目信息
  ///
  /// [songId] 曲目 ID
  /// [version] 游戏版本
  Future<Song> getSong({
    required int songId,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/song/$songId',
      queryParameters: {'version': version},
    );

    return Song.fromJson(response.data as Map<String, dynamic>);
  }

  /// 获取曲目别名列表
  Future<List<Alias>> getAliasList() async {
    final client = await dio;
    final response = await client.get('/api/v0/maimai/alias/list');

    final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      dataParser: (data) => data as Map<String, dynamic>,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取别名列表失败',
        code: apiResponse.code,
      );
    }

    final aliases = apiResponse.data!['aliases'] as List;
    return aliases
        .map((e) => Alias.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  // ==================== 收藏品相关 API ====================

  /// 获取收藏品列表
  ///
  /// [type] 收藏品类型
  /// [version] 游戏版本
  /// [required] 是否包含曲目需求
  Future<List<MaimaiCollection>> getCollectionList({
    required CollectionType type,
    int version = defaultVersion,
    bool required = false,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/${type.path}/list',
      queryParameters: {'version': version, 'required': required},
    );

    final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      dataParser: (data) => data as Map<String, dynamic>,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取收藏品列表失败',
        code: apiResponse.code,
      );
    }

    final items = apiResponse.data![type.key] as List;
    return items.map((e) {
      final json = e as Map<String, dynamic>;
      // 添加类型信息到 JSON
      json['type'] = type.path;
      return MaimaiCollection.fromJson(json);
    }).toList();
  }

  /// 获取收藏品信息
  ///
  /// [type] 收藏品类型
  /// [collectionId] 收藏品 ID
  /// [version] 游戏版本
  Future<MaimaiCollection> getCollection({
    required CollectionType type,
    required int collectionId,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/${type.path}/$collectionId',
      queryParameters: {'version': version},
    );

    final json = response.data as Map<String, dynamic>;
    // 添加类型信息到 JSON
    json['type'] = type.path;
    return MaimaiCollection.fromJson(json);
  }

  /// 获取收藏品分类列表
  Future<List<CollectionGenre>> getCollectionGenreList({
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/collection-genre/list',
      queryParameters: {'version': version},
    );

    final data = response.data as Map<String, dynamic>;
    final genres = data['collectionGenres'] as List;
    return genres.map((e) => CollectionGenre.fromJson(e)).toList();
  }

  /// 获取收藏品分类信息
  Future<CollectionGenre> getCollectionGenre({
    required int genreId,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/collection-genre/$genreId',
      queryParameters: {'version': version},
    );

    return CollectionGenre.fromJson(response.data as Map<String, dynamic>);
  }

  // ==================== 玩家成绩相关 API ====================

  /// 获取玩家成绩列表
  ///
  /// [accessToken] 访问令牌（从账号凭据中获取）
  /// [version] 游戏版本
  ///
  /// 示例：
  /// ```dart
  /// final accountController = Get.find<AccountController>();
  /// final currentAccount = accountController.currentAccount;
  /// if (currentAccount?.accessToken != null) {
  ///   final scores = await MaimaiApiService.instance.getPlayerScores(
  ///     accessToken: currentAccount!.accessToken!,
  ///   );
  /// }
  /// ```
  Future<List<Score>> getPlayerScores({
    required String accessToken,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/user/maimai/player/scores',
      queryParameters: {'version': version},
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    final apiResponse = LxnsApiResponse<List>.fromJson(
      response.data,
      dataParser: (data) => data as List,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取玩家成绩失败',
        code: apiResponse.code,
      );
    }

    final scores = apiResponse.data!;
    return scores
        .map((e) => Score.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// 获取玩家 Best 50 成绩
  ///
  /// 返回玩家的 Best 50 成绩，包括：
  /// - dx: 当期版本 Best 15（DX 谱面）
  /// - standard: 往期版本 Best 35（标准谱面）
  /// - dx_total: DX Rating 总和
  /// - standard_total: 标准 Rating 总和
  Future<Map<String, dynamic>> getPlayerBest50({
    required String accessToken,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/user/maimai/player/bests',
      queryParameters: {'version': version},
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      dataParser: (data) => data as Map<String, dynamic>,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取 Best 50 失败',
        code: apiResponse.code,
      );
    }

    return apiResponse.data!;
  }

  /// 获取玩家信息
  ///
  /// [accessToken] 访问令牌
  Future<Player> getPlayerInfo({required String accessToken}) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/user/maimai/player',
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
      response.data,
      dataParser: (data) => data as Map<String, dynamic>,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取玩家信息失败',
        code: apiResponse.code,
      );
    }

    return Player.fromJson(apiResponse.data!);
  }

  // ==================== 资源 URL 生成 ====================

  /// 获取头像 URL
  static String getIconUrl(int iconId) {
    return '$assetsBaseUrl/icon/$iconId.png';
  }

  /// 获取姓名框 URL
  static String getPlateUrl(int plateId) {
    return '$assetsBaseUrl/plate/$plateId.png';
  }

  /// 获取背景 URL
  static String getFrameUrl(int frameId) {
    return '$assetsBaseUrl/frame/$frameId.png';
  }

  /// 获取曲绘 URL
  static String getJacketUrl(int songId) {
    return '$assetsBaseUrl/jacket/$songId.png';
  }

  /// 获取音频 URL
  static String getMusicUrl(int songId) {
    return '$assetsBaseUrl/music/$songId.mp3';
  }

  // ==================== 数据同步到数据库 ====================

  /// 同步所有曲目数据到数据库
  ///
  /// [version] 游戏版本
  /// [includeNotes] 是否包含谱面物量
  /// [onProgress] 进度回调 (当前进度, 总数, 描述)
  Future<void> syncSongsToDatabase({
    int version = defaultVersion,
    bool includeNotes = true,
    void Function(int current, int total, String description)? onProgress,
  }) async {
    try {
      print('🔄 开始同步曲目数据...');
      onProgress?.call(0, 4, '正在获取曲目列表...');

      // 1. 获取曲目列表及相关数据
      final data = await getSongList(version: version, notes: includeNotes);
      final songs = data['songs'] as List<Song>;
      final genres = data['genres'] as List<Genre>;
      final versions = data['versions'] as List<Version>;

      print('📥 获取到 ${songs.length} 首曲目');
      print('📥 获取到 ${genres.length} 个分类');
      print('📥 获取到 ${versions.length} 个版本');

      // 2. 保存曲目
      onProgress?.call(1, 4, '正在保存 ${songs.length} 首曲目...');
      await IsarService.instance.maimai.saveSongs(songs);

      // 3. 保存分类
      onProgress?.call(2, 4, '正在保存 ${genres.length} 个分类...');
      await IsarService.instance.maimai.saveGenres(genres);

      // 4. 保存版本
      onProgress?.call(3, 4, '正在保存 ${versions.length} 个版本...');
      await IsarService.instance.maimai.saveVersions(versions);

      // 5. 保存别名
      onProgress?.call(4, 4, '正在获取曲目别名...');
      final aliases = await getAliasList();
      print('📥 获取到 ${aliases.length} 个曲目别名');
      await IsarService.instance.maimai.saveAliases(aliases);

      onProgress?.call(4, 4, '曲目数据同步完成！');
      print('✨ 曲目数据同步完成！');
    } catch (e, stackTrace) {
      print('❌ 同步曲目数据失败: $e');
      print('❌ 错误堆栈: $stackTrace');
      rethrow;
    }
  }

  /// 同步所有收藏品数据到数据库
  ///
  /// [version] 游戏版本
  /// [includeRequired] 是否包含收藏品要求
  /// [onProgress] 进度回调
  Future<void> syncCollectionsToDatabase({
    int version = defaultVersion,
    bool includeRequired = false,
    void Function(int current, int total, String description)? onProgress,
  }) async {
    try {
      print('🔄 开始同步收藏品到数据库...');

      final types = CollectionType.values;
      final total = types.length + 1; // +1 for genres
      int current = 0;

      // 1. 同步各类收藏品
      for (final type in types) {
        current++;
        final typeName = _getCollectionTypeName(type);
        onProgress?.call(current, total, '正在同步$typeName...');

        print('📥 正在获取 $typeName (${type.path})...');

        final collections = await getCollectionList(
          type: type,
          version: version,
          required: includeRequired,
        );

        print('✅ 获取到 ${collections.length} 个 $typeName');
        print(
          '📝 样本: ${collections.take(2).map((c) => '${c.name}(${c.collectionType})').join(', ')}',
        );

        await IsarService.instance.maimai.saveCollections(collections);
        print('💾 已保存 ${collections.length} 个 $typeName 到数据库');
      }

      // 2. 同步收藏品分类
      current++;
      onProgress?.call(current, total, '正在同步收藏品分类...');
      print('📥 正在获取收藏品分类...');

      final genres = await getCollectionGenreList(version: version);
      print('✅ 获取到 ${genres.length} 个分类');

      await IsarService.instance.maimai.saveCollectionGenres(genres);
      print('💾 已保存 ${genres.length} 个分类到数据库');

      onProgress?.call(total, total, '收藏品同步完成！');
      print('✨ 收藏品同步全部完成！');
    } catch (e) {
      print('❌ 同步收藏品失败: $e');
      print('❌ 错误堆栈: ${StackTrace.current}');
      throw Exception('同步收藏品数据失败: $e');
    }
  }

  /// 同步玩家成绩数据到数据库
  ///
  /// [accessToken] 访问令牌
  /// [version] 游戏版本
  /// [onProgress] 进度回调
  Future<void> syncPlayerScoresToDatabase({
    required String accessToken,
    int version = defaultVersion,
    void Function(int current, int total, String description)? onProgress,
  }) async {
    try {
      print('🔄 开始同步玩家成绩数据...');
      onProgress?.call(0, 2, '正在获取玩家成绩...');

      // 1. 获取玩家成绩
      final scores = await getPlayerScores(
        accessToken: accessToken,
        version: version,
      );

      print('📥 获取到 ${scores.length} 条成绩');
      onProgress?.call(1, 2, '正在保存 ${scores.length} 条成绩...');

      // 2. 保存到数据库
      await IsarService.instance.maimai.saveScores(scores);

      onProgress?.call(2, 2, '成绩同步完成！');
      print('✨ 成绩同步完成！');
    } catch (e, stackTrace) {
      print('❌ 同步玩家成绩失败: $e');
      print('❌ 错误堆栈: $stackTrace');
      throw Exception('同步玩家成绩失败: $e');
    }
  }

  /// 同步所有数据到数据库（包括曲目、收藏品和玩家成绩）
  ///
  /// [version] 游戏版本
  /// [accessToken] 访问令牌（可选，如果提供则同步玩家成绩）
  /// [onProgress] 进度回调
  Future<void> syncAllDataToDatabase({
    int version = defaultVersion,
    String? accessToken,
    void Function(int current, int total, String description)? onProgress,
  }) async {
    final totalSteps = accessToken != null ? 3 : 2;

    try {
      // 1. 同步曲目数据
      onProgress?.call(1, totalSteps, '正在同步曲目数据...');
      await syncSongsToDatabase(
        version: version,
        includeNotes: true,
        onProgress: (c, t, desc) => onProgress?.call(1, totalSteps, desc),
      );

      // 2. 同步收藏品数据
      onProgress?.call(2, totalSteps, '正在同步收藏品数据...');
      await syncCollectionsToDatabase(
        version: version,
        includeRequired: false,
        onProgress: (c, t, desc) => onProgress?.call(2, totalSteps, desc),
      );

      // 3. 同步玩家成绩（如果提供了访问令牌）
      if (accessToken != null) {
        onProgress?.call(3, totalSteps, '正在同步玩家成绩...');
        await syncPlayerScoresToDatabase(
          accessToken: accessToken,
          version: version,
          onProgress: (c, t, desc) => onProgress?.call(3, totalSteps, desc),
        );
      }

      onProgress?.call(totalSteps, totalSteps, '所有数据同步完成！');
      print('✨ 所有数据同步完成！');
    } catch (e) {
      throw Exception('同步数据失败: $e');
    }
  }

  /// 获取收藏品类型中文名称
  String _getCollectionTypeName(CollectionType type) {
    switch (type) {
      case CollectionType.trophy:
        return '称号';
      case CollectionType.icon:
        return '头像';
      case CollectionType.plate:
        return '姓名框';
      case CollectionType.frame:
        return '背景';
    }
  }

  // ==================== 历史成绩相关 API ====================

  /// 获取谱面历史成绩
  ///
  /// [accessToken] 访问令牌
  /// [songId] 曲目ID
  /// [levelIndex] 难度索引 (0: Basic, 1: Advanced, 2: Expert, 3: Master, 4: Re:Master)
  /// [songType] 谱面类型 ('dx' 或 'standard')
  Future<List<Map<String, dynamic>>> getScoreHistory({
    required String accessToken,
    required int songId,
    required int levelIndex,
    required String songType,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/user/maimai/player/score/history',
      queryParameters: {
        'song_id': songId,
        'level_index': levelIndex,
        'song_type': songType,
      },
      options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
    );

    final apiResponse = LxnsApiResponse<List>.fromJson(
      response.data,
      dataParser: (data) => data as List,
    );

    if (!apiResponse.success) {
      throw LxnsApiException(
        message: apiResponse.message ?? '获取历史成绩失败',
        code: apiResponse.code,
      );
    }

    if (apiResponse.data == null) {
      return [];
    }

    return apiResponse.data!.map((e) => e as Map<String, dynamic>).toList();
  }

  /// 清除缓存
  Future<void> clearCache() async {
    final cacheDir = await getTemporaryDirectory();
    final cacheStore = FileCacheStore('${cacheDir.path}/dio_cache');
    await cacheStore.clean();
  }
}
