import 'package:dio/dio.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';

class SayobotApiService {
  static const String baseUrl = 'https://api.sayobot.cn';
  final Dio _dio;

  SayobotApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: const Duration(seconds: 10),
                receiveTimeout: const Duration(seconds: 10),
              ),
            );

  Future<SayobotListResponse> getBeatmapList({
    String? keyword,
    int limit = 20,
    int offset = 0,
    int? mode,
    int? status,
    int? genre,
    int? language,
    List<double>? stars,
  }) async {
    final Map<String, dynamic> data = {
      'cmd': 'beatmaplist',
      'limit': limit,
      'offset': offset,
    };

    if (keyword != null && keyword.isNotEmpty) {
      data['type'] = 'search';
      data['keyword'] = keyword;
    } else {
      data['type'] = 'hot';
    }

    // Filters
    if (mode != null) data['mode'] = mode;
    if (status != null) data['class'] = status;
    if (genre != null) data['genre'] = genre;
    if (language != null) data['language'] = language;
    if (stars != null && stars.length == 2) data['stars'] = stars;

    try {
      final response = await _dio.post(
        '/',
        queryParameters: {'post': ''}, // ?post
        data: data,
      );

      if (response.statusCode == 200) {
        return SayobotListResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load beatmaps: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load beatmaps: $e');
    }
  }
}
