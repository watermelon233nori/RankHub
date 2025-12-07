import 'package:dio/dio.dart';

/// 舞萌 Party 排队 API 服务
class MaiPartyApiService {
  static final MaiPartyApiService _instance = MaiPartyApiService._internal();
  factory MaiPartyApiService() => _instance;
  MaiPartyApiService._internal();

  static const String baseUrl = 'https://mais.godserver.cn';
  late final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// 获取 party 的排卡队列
  /// [party] 房间名称
  /// 返回队列数组，第一第二是上机位置
  Future<List<String>> getQueue(String party) async {
    try {
      final response = await _dio.get(
        '/api/mai/v1/party',
        queryParameters: {'party': party},
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<String>.from(response.data);
      }

      throw Exception('获取队列失败: 响应格式错误');
    } on DioException catch (e) {
      throw Exception('获取队列失败: ${e.message}');
    }
  }

  /// 排卡
  /// [party] 房间名称
  /// [people] 排卡名称
  /// 返回更新后的队列
  Future<List<String>> joinQueue(String party, String people) async {
    try {
      final response = await _dio.post(
        '/api/mai/v1/party',
        queryParameters: {'party': party, 'people': people},
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<String>.from(response.data);
      }

      throw Exception('排卡失败: 响应格式错误');
    } on DioException catch (e) {
      throw Exception('排卡失败: ${e.message}');
    }
  }

  /// 排卡插队位置
  /// [party] 房间名称
  /// [people] 排卡名称
  /// [changeToPeople] 插队对象名称
  /// 返回更新后的队列
  Future<List<String>> changePosition(
    String party,
    String people,
    String changeToPeople,
  ) async {
    try {
      final response = await _dio.put(
        '/api/mai/v1/party',
        queryParameters: {
          'party': party,
          'people': people,
          'changeToPeople': changeToPeople,
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<String>.from(response.data);
      }

      throw Exception('插队失败: 响应格式错误');
    } on DioException catch (e) {
      throw Exception('插队失败: ${e.message}');
    }
  }

  /// 退勤
  /// [party] 房间名称
  /// [people] 排卡名称
  /// 返回更新后的队列
  Future<List<String>> leaveQueue(String party, String people) async {
    try {
      final response = await _dio.delete(
        '/api/mai/v1/party',
        queryParameters: {'party': party, 'people': people},
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<String>.from(response.data);
      }

      throw Exception('退勤失败: 响应格式错误');
    } on DioException catch (e) {
      throw Exception('退勤失败: ${e.message}');
    }
  }

  /// 完成一次上机
  /// [party] 房间名称
  /// 返回更新后的队列（第一个人移到队尾）
  Future<List<String>> completePlay(String party) async {
    try {
      final response = await _dio.post(
        '/api/mai/v1/partyPlay',
        queryParameters: {'party': party},
      );

      if (response.statusCode == 200 && response.data is List) {
        return List<String>.from(response.data);
      }

      throw Exception('完成上机失败: 响应格式错误');
    } on DioException catch (e) {
      throw Exception('完成上机失败: ${e.message}');
    }
  }
}
