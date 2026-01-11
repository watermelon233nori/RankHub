import 'package:isar_community/isar.dart';

part 'osu_score.g.dart';

/// osu! 成绩模型 (Best 100)
@collection
class OsuScore {
  Id id = Isar.autoIncrement;

  /// 成绩 ID (来自 API)
  @Index(unique: true)
  late int scoreId;

  /// 关联的用户 ID
  @Index()
  late int userId;

  /// 谱面 ID
  @Index()
  late int beatmapId;

  /// 谱面集 ID
  late int beatmapSetId;

  /// 谱面标题
  late String beatmapTitle;

  /// 谱面版本 (难度名)
  late String version;

  /// 总分
  late int totalScore;

  /// 最大连击
  late int maxCombo;

  /// 评级 (SS, S, A, etc.)
  late String rank;

  /// PP 值
  double? pp;

  /// 准确率 (0-1)
  late double accuracy;

  /// 开启的 Mod 列表 (JSON 字符串)
  late List<String> mods;

  /// 成绩创建时间
  late DateTime createdAt;

  /// 游戏模式 (osu, taiko, fruits, mania)
  late String mode;

  OsuScore();

  factory OsuScore.fromJson(Map<String, dynamic> json) {
    final score = OsuScore()
      ..scoreId = json['id'] as int
      ..userId = json['user_id'] as int
      ..totalScore = json['score'] as int? ?? json['total_score'] as int? ?? 0
      ..maxCombo = json['max_combo'] as int
      ..rank = json['rank'] as String
      ..pp = (json['pp'] as num?)?.toDouble()
      ..accuracy = (json['accuracy'] as num).toDouble()
      ..createdAt = DateTime.parse(json['created_at'] as String)
      ..mode = json['mode'] as String;

    // 处理谱面信息
    if (json.containsKey('beatmap')) {
      final beatmap = json['beatmap'] as Map<String, dynamic>;
      score.beatmapId = beatmap['id'] as int;
      score.beatmapSetId = beatmap['beatmapset_id'] as int;
      score.version = beatmap['version'] as String;
    }
    
    if (json.containsKey('beatmapset')) {
      final beatmapset = json['beatmapset'] as Map<String, dynamic>;
      score.beatmapTitle = beatmapset['title'] as String;
    } else {
      score.beatmapTitle = 'Unknown Beatmap';
    }

    // 处理 Mods
    if (json['mods'] is List) {
      score.mods = (json['mods'] as List).map((e) => e.toString()).toList();
    } else {
      score.mods = [];
    }

    return score;
  }
}
