import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';
import 'package:rank_hub/modules/osu/models/sayobot_beatmap_detail.dart';

class SayobotApiService {
  static const String baseUrl = 'https://api.sayobot.cn';
  final Dio _dio;

  SayobotApiService({Dio? dio})
    : _dio =
          dio ??
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

  Future<SayobotBeatmapDetail> getBeatmapDetail(int sid) async {
    try {
      print('🔍 Fetching beatmap detail for SID: $sid');
      final response = await _dio.get(
        '/v2/beatmapinfo',
        queryParameters: {'K': sid, 'T': 0}, // K=sid, T=0 (auto match) or T=1
      );

      print('📥 Response status: ${response.statusCode}');

      if (response.statusCode == 200) {
        dynamic data = response.data;
        // Print raw data for debugging
        print('📄 Raw Response Data Type: ${data.runtimeType}');
        if (data is String) {
          print(
            '📄 Raw Response Data (String prefix): ${data.substring(0, data.length > 200 ? 200 : data.length)}...',
          );
          try {
            data = jsonDecode(data);
          } catch (e) {
            print('❌ JSON Decode Error: $e');
            print('📄 Full content causing error: $data');
            throw Exception('Failed to decode JSON: $e');
          }
        } else {
          // If it's already a map, try to print a part of it safely
          try {
            print(
              '📄 Raw Response Data (JSON): ${jsonEncode(data).substring(0, 200)}...',
            );
          } catch (_) {
            print('📄 Raw Response Data (Map): $data');
          }
        }

        if (data is! Map<String, dynamic>) {
          print('❌ Unexpected data type after decoding: ${data.runtimeType}');
          throw Exception('Unexpected response format: ${data.runtimeType}');
        }

        try {
          return SayobotBeatmapDetail.fromJson(data);
        } catch (e, stack) {
          print('❌ Model Parsing Error: $e');
          print('Stack trace: $stack');
          rethrow;
        }
      } else {
        throw Exception(
          'Failed to load beatmap detail: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('❌ getBeatmapDetail Error: $e');
      throw Exception('Failed to load beatmap detail: $e');
    }
  }
}
