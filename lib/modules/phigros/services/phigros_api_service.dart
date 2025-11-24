import 'package:dio/dio.dart';

/// Phigros API 服务
class PhigrosApiService {
  static final PhigrosApiService _instance = PhigrosApiService._internal();
  factory PhigrosApiService() => _instance;
  static PhigrosApiService get instance => _instance;

  PhigrosApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rak3ffdi.cloud.tds1.tapapis.cn/1.1',
      headers: {
        'X-LC-Id': 'rAK3FfdieFob2Nn8Am',
        'X-LC-Key': 'Qr9AEqtuoSVS3zeD6iVbM4ZC0AtkJcQ89tywVyi0',
        'User-Agent': 'LeanCloud-CSharp-SDK/1.0.3',
        'Accept': 'application/json',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// 获取用户信息
  ///
  /// 参数:
  /// - sessionToken: 用户的 session token
  ///
  /// 返回用户信息，包括昵称、头像等
  Future<PhigrosUserInfo> getUserInfo(String sessionToken) async {
    try {
      final response = await _dio.get(
        '/users/me',
        options: Options(headers: {'X-LC-Session': sessionToken}),
      );

      if (response.statusCode == 200) {
        return PhigrosUserInfo.fromJson(response.data);
      } else {
        throw Exception('获取用户信息失败: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Session Token 无效或已过期');
      }
      throw Exception('网络请求失败: ${e.message}');
    }
  }

  /// 获取游戏存档数据
  ///
  /// 参数:
  /// - sessionToken: 用户的 session token
  ///
  /// 返回游戏存档数据
  Future<PhigrosGameSave?> getGameSave(String sessionToken) async {
    try {
      final response = await _dio.get(
        '/classes/_GameSave',
        queryParameters: {'limit': 1},
        options: Options(headers: {'X-LC-Session': sessionToken}),
      );

      if (response.statusCode == 200) {
        final results = response.data['results'] as List?;
        if (results != null && results.isNotEmpty) {
          return PhigrosGameSave.fromJson(results[0]);
        }
        return null;
      } else {
        throw Exception('获取游戏数据失败: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Session Token 无效或已过期');
      }
      throw Exception('网络请求失败: ${e.message}');
    }
  }

  /// 验证 Session Token 是否有效
  Future<bool> validateSessionToken(String sessionToken) async {
    try {
      await getUserInfo(sessionToken);
      return true;
    } catch (e) {
      return false;
    }
  }
}

/// Phigros 用户信息
class PhigrosUserInfo {
  final String objectId;
  final String username;
  final String nickname;
  final String? avatar;
  final String sessionToken;
  final String? shortId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PhigrosUserInfo({
    required this.objectId,
    required this.username,
    required this.nickname,
    this.avatar,
    required this.sessionToken,
    this.shortId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PhigrosUserInfo.fromJson(Map<String, dynamic> json) {
    return PhigrosUserInfo(
      objectId: json['objectId'] as String,
      username: json['username'] as String,
      nickname: json['nickname'] as String? ?? json['username'] as String,
      avatar: json['avatar'] as String?,
      sessionToken: json['sessionToken'] as String,
      shortId: json['shortId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

/// Phigros 游戏存档
class PhigrosGameSave {
  final String objectId;
  final String name;
  final String summary;
  final PhigrosGameFile? gameFile;
  final DateTime? modifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  PhigrosGameSave({
    required this.objectId,
    required this.name,
    required this.summary,
    this.gameFile,
    this.modifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PhigrosGameSave.fromJson(Map<String, dynamic> json) {
    return PhigrosGameSave(
      objectId: json['objectId'] as String,
      name: json['name'] as String,
      summary: json['summary'] as String,
      gameFile: json['gameFile'] != null
          ? PhigrosGameFile.fromJson(json['gameFile'])
          : null,
      modifiedAt: json['modifiedAt'] != null
          ? DateTime.parse(
              (json['modifiedAt'] as Map<String, dynamic>)['iso'] as String,
            )
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }
}

/// Phigros 游戏文件
class PhigrosGameFile {
  final String objectId;
  final String name;
  final String url;
  final String? mimeType;
  final int? size;

  PhigrosGameFile({
    required this.objectId,
    required this.name,
    required this.url,
    this.mimeType,
    this.size,
  });

  factory PhigrosGameFile.fromJson(Map<String, dynamic> json) {
    return PhigrosGameFile(
      objectId: json['objectId'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      mimeType: json['mime_type'] as String?,
      size: json['metaData'] != null
          ? (json['metaData'] as Map<String, dynamic>)['size'] as int?
          : null,
    );
  }
}
