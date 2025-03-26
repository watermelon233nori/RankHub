import 'package:dio/dio.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';
import 'package:uuid/uuid.dart';

class LxMaiRemote {
  static const baseUrl = 'https://maimai.lxns.net/api/v0';
  static const meow0Url = 'https://lx-api.meow0.fun';

  static const playerDataPath = '/user/maimai/player';
  static const playerScorePath = '/user/maimai/player/scores';
  static const songDataPath = '/maimai/song';
  static const songAliasPath = '/maimai/alias/list';

  static final Dio _dio = Dio();

  /// 处理网络请求并返回数据
  ///
  /// 仅可用于不需要开发者 API Key 的请求
  ///
  /// 涉及到需要开发者 API Key 的请求请使用 [fetchDataViaProxy]
  ///
  /// [endpoint] 请求的路径
  ///
  /// [queryParameters] 请求的参数
  ///
  /// [token] 请求的token
  ///
  /// 涉及到玩家数据的请求需要传入token
  ///
  /// 返回请求的数据
  ///
  /// 如果请求失败则抛出异常 [Exception]
  static Future<dynamic> fetchData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      final headers = token != null
          ? {
              'X-User-Token': token,
            }
          : null;

      final response = await _dio.get(
        baseUrl + endpoint,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      rethrow;
    }
  }

  /// 处理网络请求并返回数据
  ///
  /// 仅可用于需要开发者 API Key 的请求
  ///
  /// 涉及到不需要开发者 API Key 的请求请使用 [fetchData]
  ///
  /// [endpoint] 请求的路径
  ///
  /// [queryParameters] 请求的参数
  ///
  /// 返回请求的数据
  ///
  /// 如果请求失败则抛出异常 [Exception]
  static Future<dynamic> fetchDataViaProxy(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        meow0Url + endpoint,
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<
          ({
            List<SongInfo> songData,
            List<SongGenre> genresData,
            List<SongVersion> versionData
          })>
      fetchSongData(
          {bool forceRefresh = false, int? version, bool? notes}) async {
    final data = await fetchData(
      "$songDataPath/list",
      queryParameters: {'version': version, 'notes': notes},
    );

    final songData = data['songs'] ?? [];
    final genresData = data['genres'] ?? [];
    final versionData = data['versions'] ?? [];

    List<SongInfo> songs =
        songData.map<SongInfo>((json) => SongInfo.fromLxJson(json)).toList();
    List<SongGenre> genres = genresData
        .map<SongGenre>((json) => SongGenre.fromLxJson(json))
        .toList();
    List<SongVersion> versions = versionData
        .map<SongVersion>((json) => SongVersion.fromLxJson(json))
        .toList();

    return (songData: songs, genresData: genres, versionData: versions);
  }

  Future<SongInfo> fetchSongById(int id, {int? version}) async {
    final data = await fetchData(
      "$songDataPath/$id",
      queryParameters: {'version': version},
    );

    return SongInfo.fromLxJson(data);
  }

  Future<List<SongAlias>> fetchSongAlias() async {
    final data = await fetchData(songAliasPath);
    final aliasData = data['aliases'] ?? [];

    List<SongAlias> aliases =
        aliasData.map<SongAlias>((json) => SongAlias.fromLxJson(json)).toList();

    return aliases;
  }

  Future<List<SongScore>> fetchRecords(String token) async {
    final response = await fetchData(playerScorePath, token: token);
    final data = response['data'] ?? [];
    List<SongScore> scores =
        data.map<SongScore>((json) => SongScore.fromLxJson(json)).toList();

    return scores;
  }

  Future<List<SongScore>> recentRecords(String friendCode) async {
    final result = await LxMaiRemote.fetchDataViaProxy(
        '/maimai/player/$friendCode/recents');
    final data = result['data'] ?? [];

    List<SongScore> recents =
        data.map<SongScore>((json) => SongScore.fromLxJson(json)).toList();

    return recents;
  }

  Future<PlayerData> fetchPlayerData(String token) async {
    final uuid = const Uuid().v4();
    final data = await fetchData(
      playerDataPath,
      token: token,
    );

    final playerData = PlayerData.fromLxJson(data['data'], uuid);

    return playerData;
  }
}
