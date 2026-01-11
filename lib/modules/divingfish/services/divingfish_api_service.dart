import 'package:dio/dio.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/divingfish/divingfish_alias.dart';
import 'package:rank_hub/models/divingfish/divingfish_score.dart';
import 'package:rank_hub/modules/divingfish/services/divingfish_credential_provider.dart';

/// 水鱼查分器 API 服务
/// 提供与 diving-fish API 的交互
/// 使用 JWT token cookie 认证
class DivingFishApiService {
  // 单例模式
  static final DivingFishApiService _instance =
      DivingFishApiService._internal();
  factory DivingFishApiService() => _instance;
  static DivingFishApiService get instance => _instance;

  DivingFishApiService._internal();

  static const String baseUrl = 'https://www.diving-fish.com/api';

  // 基础 Dio 实例（不需要认证的端点）
  final Dio _publicDio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      validateStatus: (status) => status != null && status < 500,
    ),
  );

  final DivingFishCredentialProvider _credentialProvider =
      DivingFishCredentialProvider();

  /// 获取带认证的 Dio 实例
  /// 会自动从 account 中获取 JWT token 并设置到 cookie
  Future<Dio> _getAuthenticatedDio(Account account) async {
    // 确保凭据有效（会自动登录获取 JWT token）
    await _credentialProvider.getCredential(account);
    return _credentialProvider.getDioWithCookies(account);
  }

  /// 获取舞萌 DX 曲目数据
  /// 端点: GET /maimaidxprober/music_data
  /// 不需要认证
  Future<List<dynamic>> getMaimaiMusicData() async {
    try {
      final response = await _publicDio.get('/maimaidxprober/music_data');

      if (response.statusCode == 200) {
        print('✅ 获取舞萌 DX 曲目数据成功，曲目数: ${response.data.length}');
        print('🔷 示例曲目数据: ${response.data[0]}');
        return response.data as List<dynamic>;
      } else {
        throw Exception('获取曲目数据失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取曲目数据失败: $e');
      rethrow;
    }
  }

  /// 获取用户的完整成绩信息
  /// 端点: GET /maimaidxprober/player/records
  /// 需要登录验证（JWT token cookie）
  /// 返回玩家信息和成绩列表
  Future<({DivingFishPlayerData playerData, List<DivingFishScore> scores})>
  getPlayerRecords({required Account account}) async {
    try {
      final dio = await _getAuthenticatedDio(account);

      final response = await dio.get('$baseUrl/maimaidxprober/player/records');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        // 解析玩家信息
        final playerData = DivingFishPlayerData.fromJson(data);

        // 解析成绩列表
        final recordsJson = data['records'] as List<dynamic>? ?? [];
        final scores = recordsJson
            .map(
              (json) => DivingFishScore.fromJson(json as Map<String, dynamic>),
            )
            .toList();

        print('✅ 获取玩家成绩成功: ${scores.length} 条记录');
        return (playerData: playerData, scores: scores);
      } else if (response.statusCode == 400) {
        final data = response.data;
        if (data is Map && data['message'] != null) {
          throw Exception(data['message']);
        }
        throw Exception('获取成绩失败');
      } else {
        throw Exception('获取成绩失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取玩家成绩失败: $e');
      rethrow;
    }
  }

  /// 获取用户的简略成绩信息（B50）
  /// 端点: POST /maimaidxprober/query/player
  /// 无需验证，但用户需要允许第三方查询
  Future<Map<String, dynamic>> queryPlayer({
    required String username,
    int? b50 = 1, // 是否返回 b50 数据
  }) async {
    try {
      final response = await _publicDio.post(
        '/maimaidxprober/query/player',
        data: {'username': username, 'b50': b50},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else if (response.statusCode == 400) {
        final data = response.data;
        if (data is Map && data['message'] != null) {
          throw Exception(data['message']);
        }
        throw Exception('查询玩家失败');
      } else {
        throw Exception('查询玩家失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 查询玩家失败: $e');
      rethrow;
    }
  }

  /// 按版本获取用户的成绩信息
  /// 端点: GET /maimaidxprober/query_plate
  /// 不需要认证
  Future<Map<String, dynamic>> queryPlate({
    required String username,
    required String version, // 版本名称，如 "霸者"
  }) async {
    try {
      final response = await _publicDio.get(
        '/maimaidxprober/query_plate',
        queryParameters: {'username': username, 'version': version},
      );

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('查询版本成绩失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 查询版本成绩失败: $e');
      rethrow;
    }
  }

  /// 获取 Rating 排行榜
  /// 端点: GET /maimaidxprober/rating_ranking
  /// 不需要认证
  Future<List<dynamic>> getRatingRanking() async {
    try {
      final response = await _publicDio.get('/maimaidxprober/rating_ranking');

      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('获取排行榜失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取排行榜失败: $e');
      rethrow;
    }
  }

  /// 获取谱面统计数据（拟合难度等）
  /// 端点: GET /maimaidxprober/chart_stats
  /// 不需要认证
  Future<Map<String, dynamic>> getChartStats() async {
    try {
      final response = await _publicDio.get('/maimaidxprober/chart_stats');

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('获取谱面统计失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取谱面统计失败: $e');
      rethrow;
    }
  }

  /// 获取曲目别名
  Future<List<DivingFishAlias>> getAliasList() async {
    try {
      final response = await Dio().get(
        'https://www.yuzuchan.moe/api/maimaidx/maimaidxalias',
      );

      if (response.statusCode == 200) {
        final data = response.data['content'];
        if (data is List) {
          final aliases = data
              .whereType<Map<String, dynamic>>()
              .map(DivingFishAlias.fromJson)
              .toList();
          print('✅ 获取曲目别名成功: ${aliases.length} 条');
          return aliases;
        }
        throw Exception('别名数据格式不正确');
      }
      throw Exception('获取别名失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取别名失败: $e');
      rethrow;
    }
  }

  /// 更新用户成绩
  /// 端点: POST /maimaidxprober/player/update_records
  /// 需要登录验证（JWT token cookie）
  Future<void> updatePlayerRecords({
    required Account account,
    required List<Map<String, dynamic>> records,
  }) async {
    try {
      final dio = await _getAuthenticatedDio(account);

      final response = await dio.post(
        '/maimaidxprober/player/update_records',
        data: records,
      );

      if (response.statusCode != 200) {
        throw Exception('更新成绩失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 更新成绩失败: $e');
      rethrow;
    }
  }

  /// 获取 CHUNITHM 曲目数据
  /// 端点: GET /chunithmprober/music_data
  /// 不需要认证
  Future<List<dynamic>> getChunithmMusicData() async {
    try {
      final response = await _publicDio.get('/chunithmprober/music_data');

      if (response.statusCode == 200) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('获取曲目数据失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取 CHUNITHM 曲目数据失败: $e');
      rethrow;
    }
  }

  /// 获取 CHUNITHM 玩家成绩
  /// 端点: GET /chunithmprober/player/records
  /// 需要登录验证（JWT token cookie）
  Future<Map<String, dynamic>> getChunithmPlayerRecords({
    required Account account,
  }) async {
    try {
      final dio = await _getAuthenticatedDio(account);

      final response = await dio.get('/chunithmprober/player/records');

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('获取成绩失败: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ 获取 CHUNITHM 成绩失败: $e');
      rethrow;
    }
  }
}
