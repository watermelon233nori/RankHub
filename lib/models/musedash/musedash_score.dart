import 'package:isar_community/isar.dart';

part 'musedash_score.g.dart';

/// MuseDash 成绩模型
@collection
class MuseDashScore {
  Id id = Isar.autoIncrement;

  /// 用户 UUID
  @Index()
  late String userUuid;

  /// 音乐 UID
  @Index()
  late String musicUid;

  /// 难度 (0-4)
  late int difficulty;

  /// 分数
  int? score;

  /// 准确率
  double? acc;

  /// 平台 (如 "Mobile", "PC")
  String? platform;

  /// 角色 UID
  String? characterUid;

  /// 精灵 UID
  String? elfinUid;

  /// 客户端排名 (API 的 i 字段)
  int? platformRank;

  /// 全平台排名 (API 的 sum 字段)
  int? globalRank;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashScore();

  factory MuseDashScore.fromJson(
    String userUuid,
    String musicUid,
    int difficulty,
    Map<String, dynamic> json,
  ) {
    final score = MuseDashScore()
      ..userUuid = userUuid
      ..musicUid = musicUid
      ..difficulty = difficulty
      ..score = json['score'] as int?
      ..acc = (json['acc'] as num?)?.toDouble()
      ..platform = json['platform'] as String?
      ..characterUid = json['character_uid'] as String?
      ..elfinUid = json['elfin_uid'] as String?
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    return score;
  }

  /// 从 API 播放记录创建成绩
  factory MuseDashScore.fromPlayRecord(
    String userUuid,
    Map<String, dynamic> play,
  ) {
    return MuseDashScore()
      ..userUuid = userUuid
      ..musicUid = play['uid'] as String? ?? ''
      ..difficulty = play['difficulty'] as int? ?? 0
      ..score = play['score'] as int?
      ..acc = (play['acc'] as num?)?.toDouble()
      ..platform = play['platform'] as String?
      ..characterUid = play['character_uid'] as String?
      ..elfinUid = play['elfin_uid'] as String?
      ..platformRank = play['i'] as int?
      ..globalRank = play['sum'] as int?
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'userUuid': userUuid,
      'musicUid': musicUid,
      'difficulty': difficulty,
      'score': score,
      'acc': acc,
      'platform': platform,
      'characterUid': characterUid,
      'elfinUid': elfinUid,
      'platformRank': platformRank,
      'globalRank': globalRank,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 是否有成绩
  bool get hasScore => score != null && score! > 0;

  /// 获取评级 (根据准确率)
  String get rank {
    if (acc == null) return '-';
    if (acc! >= 100) return 'SSS';
    if (acc! >= 95) return 'SS';
    if (acc! >= 90) return 'S';
    if (acc! >= 80) return 'A';
    if (acc! >= 70) return 'B';
    if (acc! >= 60) return 'C';
    return 'D';
  }
}
