import 'package:dio/dio.dart';
import 'package:rank_hub/models/nearcade/shop.dart';

class NearcadeApiService {
  static const String baseUrl = 'https://nearcade.phizone.cn';
  final Dio _dio;

  NearcadeApiService({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

  /// 获取附近店铺
  ///
  /// [longitude] 原点经度
  /// [latitude] 原点纬度
  /// [radius] 范围半径（单位 km；默认 10）
  /// [name] 原点名称
  /// [fetchAttendance] 是否获取在勤人数（默认为 true）
  Future<DiscoverResponse> discoverNearby({
    required double longitude,
    required double latitude,
    double? radius,
    String? name,
    bool? fetchAttendance,
  }) async {
    try {
      final response = await _dio.get(
        '/api/discover',
        queryParameters: {
          'longitude': longitude,
          'latitude': latitude,
          if (radius != null) 'radius': radius,
          if (name != null) 'name': name,
          if (fetchAttendance != null) 'fetchAttendance': fetchAttendance,
        },
      );

      return DiscoverResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// 获取店铺列表
  ///
  /// [q] 查询字符串
  /// [page] 页数
  /// [limit] 每页条目数
  Future<ShopsResponse> getShops({String? q, int? page, int? limit}) async {
    try {
      final response = await _dio.get(
        '/api/shops',
        queryParameters: {
          if (q != null) 'q': q,
          if (page != null) 'page': page,
          if (limit != null) 'limit': limit,
        },
      );

      return ShopsResponse.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exception('连接超时，请检查网络连接');
      case DioExceptionType.badResponse:
        return Exception('服务器错误: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return Exception('请求已取消');
      default:
        return Exception('网络错误: ${error.message}');
    }
  }
}
