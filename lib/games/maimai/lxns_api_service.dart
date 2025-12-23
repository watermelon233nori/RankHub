import 'package:dio/dio.dart';
import 'package:rank_hub/games/maimai/models/enums/collection_type.dart';
import 'package:rank_hub/games/maimai/models/lxns_api_response.dart';
import 'package:rank_hub/games/maimai/models/maimai_collection.dart';
import 'package:rank_hub/games/maimai/models/maimai_player.dart';
import 'package:rank_hub/games/maimai/models/maimai_score.dart';
import 'package:rank_hub/games/maimai/models/maimai_song.dart';

class LxnsApiService {
  static LxnsApiService? _instance;
  static Dio? _dio;

  /// API 基础 URL
  static const String baseUrl = 'https://maimai.lxns.net';

  /// 资源基础 URL
  static const String assetsBaseUrl = 'https://assets2.lxns.net/maimai';

  /// 默认游戏版本
  static const int defaultVersion = 25000;

  LxnsApiService._();

  /// 获取单例实例
  static LxnsApiService get instance {
    _instance ??= LxnsApiService._();
    return _instance!;
  }

  Future<Dio> get dio async {
    if (_dio != null) return _dio!;
    _dio = await _initDio();
    return _dio!;
  }

  Future<Dio> _initDio() async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'User-Agent': 'RankHub/1.0.0'},
      ),
    );

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
        .map((e) => MaimaiSong.fromJson(e as Map<String, dynamic>))
        .toList();
    final genres = (data['genres'] as List)
        .map((e) => MaimaiGenre.fromJson(e as Map<String, dynamic>))
        .toList();
    final versions = (data['versions'] as List)
        .map((e) => MaimaiVersion.fromJson(e as Map<String, dynamic>))
        .toList();

    return {'songs': songs, 'genres': genres, 'versions': versions};
  }

  /// 获取曲目信息
  ///
  /// [songId] 曲目 ID
  /// [version] 游戏版本
  Future<MaimaiSong> getSong({
    required int songId,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/song/$songId',
      queryParameters: {'version': version},
    );

    final apiResponse = LxnsApiResponse<MaimaiSong>.fromJson(
      response.data,
      dataParser: (data) => MaimaiSong.fromJson(data as Map<String, dynamic>),
    );

    return apiResponse.data!;
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
  Future<List<MaimaiCollectionGenre>> getCollectionGenreList({
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/collection-genre/list',
      queryParameters: {'version': version},
    );

    final data = response.data as Map<String, dynamic>;
    final genres = data['collectionGenres'] as List;
    return genres.map((e) => MaimaiCollectionGenre.fromJson(e)).toList();
  }

  /// 获取收藏品分类信息
  Future<MaimaiCollectionGenre> getCollectionGenre({
    required int genreId,
    int version = defaultVersion,
  }) async {
    final client = await dio;
    final response = await client.get(
      '/api/v0/maimai/collection-genre/$genreId',
      queryParameters: {'version': version},
    );

    return MaimaiCollectionGenre.fromJson(
      response.data as Map<String, dynamic>,
    );
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
  Future<List<MaimaiScore>> getPlayerScores({
    required String accessToken,
    int version = defaultVersion,
  }) async {
    try {
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
          .map((e) => MaimaiScore.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw LxnsApiException(
          message: '玩家档案不存在,请前往落雪咖啡屋官网同步一次数据来创建玩家档案',
          code: 404,
          originalError: e,
        );
      }
      rethrow;
    }
  }

  /// 获取玩家 Best 50 成绩
  ///
  /// 返回玩家的 Best 50 成绩，包括：
  /// - dx: 当期版本 Best 15
  /// - standard: 往期版本 Best 35
  /// - dx_total: DX Rating 总和
  /// - standard_total: 标准 Rating 总和
  Future<Map<String, dynamic>> getPlayerBest50({
    required String accessToken,
    int version = defaultVersion,
  }) async {
    try {
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
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw LxnsApiException(
          message: '玩家档案不存在,请前往落雪咖啡屋官网同步一次数据来创建玩家档案',
          code: 404,
          originalError: e,
        );
      }
      rethrow;
    }
  }

  /// 获取玩家信息
  ///
  /// [accessToken] 访问令牌
  Future<MaimaiPlayer> getPlayerInfo({required String accessToken}) async {
    try {
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

      return MaimaiPlayer.fromJson(apiResponse.data!);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw LxnsApiException(
          message: '玩家档案不存在,请前往落雪咖啡屋官网同步一次数据来创建玩家档案',
          code: 404,
          originalError: e,
        );
      }
      rethrow;
    }
  }

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
}
