import 'package:dio/dio.dart';

class RankHubApiService {
  static final RankHubApiService _instance = RankHubApiService._internal();
  factory RankHubApiService() => _instance;
  RankHubApiService._internal() {
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  static const String baseUrl = 'https://api.rankhub.tjhzzc.cn';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  /// 启动短信验证码会话
  Future<Map<String, dynamic>> sendSmsCode(String phone) async {
    try {
      final response = await _dio.post(
        '/v1/auth/sms/create',
        data: {'phone': phone},
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// 验证码登录
  Future<Map<String, dynamic>> loginWithSms(
    String phone,
    String sessionId,
    String code,
  ) async {
    try {
      final response = await _dio.post(
        '/v1/auth/mobile',
        data: {
          'phone': {'number': phone, 'session_id': sessionId, 'code': code},
        },
      );
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    String message = '未知错误';
    if (error.response?.data != null && error.response?.data is Map) {
      final data = error.response?.data as Map;
      if (data.containsKey('message') &&
          data['message'] != null &&
          data['message'].toString().isNotEmpty) {
        message = data['message'];
      } else if (error.response?.statusCode != null) {
        message = '服务器错误: ${error.response?.statusCode}';
      }
    } else {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          message = '连接超时，请检查网络连接';
          break;
        case DioExceptionType.badResponse:
          message = '服务器错误: ${error.response?.statusCode}';
          break;
        case DioExceptionType.cancel:
          message = '请求已取消';
          break;
        default:
          message = '网络错误: ${error.message}';
      }
    }
    return Exception(message);
  }
}
