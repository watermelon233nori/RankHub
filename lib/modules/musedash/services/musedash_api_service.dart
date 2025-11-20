import 'package:dio/dio.dart';

/// MuseDash.moe API 服务
class MuseDashApiService {
  static final MuseDashApiService _instance = MuseDashApiService._internal();
  factory MuseDashApiService() => _instance;
  static MuseDashApiService get instance => _instance;

  MuseDashApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.musedash.moe',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// 搜索用户，返回 [[name, uuid], [name, uuid], ...]
  Future<List<List<String>>> searchUsers(String name) async {
    try {
      final response = await _dio.get('/search/$name');

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data as List<dynamic>;
        return data.map((item) {
          final List<dynamic> pair = item as List<dynamic>;
          return [pair[0].toString(), pair[1].toString()];
        }).toList();
      }

      return [];
    } catch (e) {
      print('搜索用户失败: $e');
      rethrow;
    }
  }

  /// 查询玩家信息
  Future<MuseDashPlayerInfo?> getPlayerInfo(String uuid) async {
    try {
      final response = await _dio.get('/player/$uuid');

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;

        // 检查是否找到用户（user_id 为 "404" 表示用户不存在）
        final user = data['user'] as Map<String, dynamic>?;
        if (user != null && user['user_id'] == '404') {
          return null; // 用户不存在
        }

        return MuseDashPlayerInfo.fromJson(data);
      }

      return null;
    } catch (e) {
      print('查询玩家信息失败: $e');
      rethrow;
    }
  }

  /// 验证 UUID 是否有效
  Future<bool> validateUuid(String uuid) async {
    final playerInfo = await getPlayerInfo(uuid);
    return playerInfo != null;
  }
}

/// Muse Dash 玩家信息
class MuseDashPlayerInfo {
  final String userId;
  final String nickname;
  final int lastUpdate;
  final String rl;
  final int diffHistoryNumber;

  MuseDashPlayerInfo({
    required this.userId,
    required this.nickname,
    required this.lastUpdate,
    required this.rl,
    required this.diffHistoryNumber,
  });

  factory MuseDashPlayerInfo.fromJson(Map<String, dynamic> json) {
    final user = json['user'] as Map<String, dynamic>;
    return MuseDashPlayerInfo(
      userId: user['user_id']?.toString() ?? '',
      nickname: user['nickname']?.toString() ?? '',
      lastUpdate: json['lastUpdate'] as int? ?? 0,
      rl: json['rl']?.toString() ?? 'NaN',
      diffHistoryNumber: json['diffHistoryNumber'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'nickname': nickname,
      'lastUpdate': lastUpdate,
      'rl': rl,
      'diffHistoryNumber': diffHistoryNumber,
    };
  }
}
