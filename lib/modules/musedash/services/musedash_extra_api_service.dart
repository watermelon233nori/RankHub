import 'package:dio/dio.dart';
import 'package:rank_hub/models/musedash/musedash_character.dart';
import 'package:rank_hub/models/musedash/musedash_elfin.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';
import 'dart:convert';

/// MuseDash 角色和精灵 API 服务
class MuseDashExtraApiService {
  static final MuseDashExtraApiService _instance =
      MuseDashExtraApiService._internal();
  factory MuseDashExtraApiService() => _instance;
  static MuseDashExtraApiService get instance => _instance;

  MuseDashExtraApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl:
          'https://ghfast.top/raw.githubusercontent.com/simon300000/musedash.moe/refs/heads/master/api/extra',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  final _isarService = MuseDashIsarService.instance;

  /// 获取角色数据
  Future<List<Map<String, dynamic>>> fetchCharacters() async {
    try {
      final response = await _dio.get('/character_ChineseS.json');

      if (response.statusCode == 200 && response.data != null) {
        // 返回的是纯文本，需要解析 JSON
        final jsonStr = response.data is String
            ? response.data
            : json.encode(response.data);
        final List<dynamic> jsonList = json.decode(jsonStr);
        return jsonList.cast<Map<String, dynamic>>();
      }

      throw Exception('获取角色数据失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取角色数据失败: $e');
      rethrow;
    }
  }

  /// 获取精灵数据
  Future<List<Map<String, dynamic>>> fetchElfins() async {
    try {
      final response = await _dio.get('/elfin_ChineseS.json');

      if (response.statusCode == 200 && response.data != null) {
        // 返回的是纯文本，需要解析 JSON
        final jsonStr = response.data is String
            ? response.data
            : json.encode(response.data);
        final List<dynamic> jsonList = json.decode(jsonStr);
        return jsonList.cast<Map<String, dynamic>>();
      }

      throw Exception('获取精灵数据失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取精灵数据失败: $e');
      rethrow;
    }
  }

  /// 同步角色数据到数据库
  Future<void> syncCharactersToDatabase({
    required Function(int current, int total, String description) onProgress,
  }) async {
    try {
      print('📥 开始同步角色数据...');

      onProgress(0, 100, '正在获取角色数据...');

      final charactersData = await fetchCharacters();

      onProgress(50, 100, '正在解析角色数据...');

      final characters = <MuseDashCharacter>[];
      for (int i = 0; i < charactersData.length; i++) {
        final character = MuseDashCharacter.fromJson(i, charactersData[i]);
        characters.add(character);
      }

      print('📊 解析完成: ${characters.length} 个角色');

      onProgress(75, 100, '正在保存角色数据...');
      await _isarService.saveCharacters(characters);

      onProgress(100, 100, '同步完成');

      print('✅ 角色数据同步完成');
    } catch (e) {
      print('❌ 同步角色数据失败: $e');
      rethrow;
    }
  }

  /// 同步精灵数据到数据库
  Future<void> syncElfinsToDatabase({
    required Function(int current, int total, String description) onProgress,
  }) async {
    try {
      print('📥 开始同步精灵数据...');

      onProgress(0, 100, '正在获取精灵数据...');

      final elfinsData = await fetchElfins();

      onProgress(50, 100, '正在解析精灵数据...');

      final elfins = <MuseDashElfin>[];
      for (int i = 0; i < elfinsData.length; i++) {
        final elfin = MuseDashElfin.fromJson(i, elfinsData[i]);
        elfins.add(elfin);
      }

      print('📊 解析完成: ${elfins.length} 个精灵');

      onProgress(75, 100, '正在保存精灵数据...');
      await _isarService.saveElfins(elfins);

      onProgress(100, 100, '同步完成');

      print('✅ 精灵数据同步完成');
    } catch (e) {
      print('❌ 同步精灵数据失败: $e');
      rethrow;
    }
  }

  /// 同步所有额外数据（角色 + 精灵）
  Future<void> syncAllExtraData({
    required Function(int current, int total, String description) onProgress,
  }) async {
    try {
      // 同步角色（占50%进度）
      await syncCharactersToDatabase(
        onProgress: (current, total, description) {
          onProgress(current ~/ 2, 100, description);
        },
      );

      // 同步精灵（占50%进度）
      await syncElfinsToDatabase(
        onProgress: (current, total, description) {
          onProgress(50 + current ~/ 2, 100, description);
        },
      );

      onProgress(100, 100, '所有数据同步完成');
    } catch (e) {
      print('❌ 同步额外数据失败: $e');
      rethrow;
    }
  }
}
