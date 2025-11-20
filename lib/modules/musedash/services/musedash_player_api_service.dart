import 'package:dio/dio.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:rank_hub/models/musedash/musedash_score.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';

/// MuseDash 玩家成绩 API 服务
class MuseDashPlayerApiService {
  static final MuseDashPlayerApiService _instance =
      MuseDashPlayerApiService._internal();
  factory MuseDashPlayerApiService() => _instance;
  static MuseDashPlayerApiService get instance => _instance;

  MuseDashPlayerApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.musedash.moe',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  final _isarService = MuseDashIsarService.instance;

  /// 获取玩家数据
  Future<Map<String, dynamic>> fetchPlayerData(String userUuid) async {
    try {
      final response = await _dio.get('/player/$userUuid');

      if (response.statusCode == 200 && response.data != null) {
        return response.data as Map<String, dynamic>;
      }

      throw Exception('获取玩家数据失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取玩家数据失败: $e');
      rethrow;
    }
  }

  /// 同步玩家数据到数据库
  Future<void> syncPlayerDataToDatabase({
    required String userUuid,
    required Function(int current, int total, String description) onProgress,
  }) async {
    try {
      print('📥 开始同步玩家数据: $userUuid');

      onProgress(0, 100, '正在获取玩家数据...');

      // 获取玩家数据
      final playerData = await fetchPlayerData(userUuid);

      onProgress(25, 100, '正在解析玩家信息...');

      // 创建玩家对象
      final player = MuseDashPlayer.fromJson(userUuid, playerData);

      // 保存玩家信息
      await _isarService.savePlayer(player);

      print('📊 玩家信息: ${player.nickname}, RL: ${player.rl}');

      onProgress(50, 100, '正在解析成绩数据...');

      // 解析成绩数据
      final scores = <MuseDashScore>[];
      if (playerData['plays'] != null) {
        final plays = playerData['plays'] as List;

        for (int i = 0; i < plays.length; i++) {
          final play = plays[i] as Map<String, dynamic>;
          final score = MuseDashScore.fromPlayRecord(userUuid, play);
          scores.add(score);

          if (i % 10 == 0) {
            final progress = 50 + ((i / plays.length) * 25).round();
            onProgress(progress, 100, '正在解析成绩: ${i + 1}/${plays.length}');
          }
        }
      }

      print('📊 解析完成: ${scores.length} 条成绩');

      onProgress(75, 100, '正在保存成绩数据...');

      // 清空该玩家的旧成绩
      await _isarService.clearScoresByUserUuid(userUuid);

      // 保存新成绩
      await _isarService.saveScores(scores);

      onProgress(100, 100, '同步完成');

      print('✅ 玩家数据同步完成: ${scores.length} 条成绩');
    } catch (e) {
      print('❌ 同步玩家数据失败: $e');
      rethrow;
    }
  }

  /// 获取 Best 30 成绩
  Future<List<MuseDashScore>> getBest30Scores(String userUuid) async {
    return await _isarService.getPlayerBestScores(userUuid, 30);
  }

  /// 获取玩家 RL 历史数据
  /// [start] 起始位置，默认为0
  /// [length] 获取数据长度，默认为玩家的diffHistoryNumber
  Future<List<RlHistoryPoint>> fetchDiffHistory(
    String userUuid, {
    int start = 0,
    int? length,
  }) async {
    try {
      // 如果未指定length，从数据库获取玩家的diffHistoryNumber
      int historyLength = length ?? 0;
      if (historyLength == 0) {
        final player = await _isarService.getPlayerByUuid(userUuid);
        historyLength = player?.diffHistoryNumber ?? 100;
      }

      final response = await _dio.get(
        '/player/diffHistory/$userUuid',
        queryParameters: {'start': start, 'length': historyLength},
      );

      if (response.statusCode == 200 && response.data != null) {
        final List<dynamic> data = response.data as List;
        return data
            .map(
              (item) => RlHistoryPoint.fromJson(item as Map<String, dynamic>),
            )
            .toList();
      }

      throw Exception('获取RL历史数据失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取RL历史数据失败: $e');
      rethrow;
    }
  }
}

/// RL 历史数据点
class RlHistoryPoint {
  /// 时间戳（毫秒）
  final int time;

  /// RL 值
  final double diff;

  /// 排名
  final int rank;

  RlHistoryPoint({required this.time, required this.diff, required this.rank});

  factory RlHistoryPoint.fromJson(Map<String, dynamic> json) {
    return RlHistoryPoint(
      time: json['time'] as int,
      diff: (json['diff'] as num).toDouble(),
      rank: json['rank'] as int,
    );
  }

  /// 获取日期时间
  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(time);
}
