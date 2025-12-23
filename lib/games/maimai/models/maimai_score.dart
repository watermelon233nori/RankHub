import 'package:isar_community/isar.dart';
import 'enums/level_index.dart';
import 'enums/fc_type.dart';
import 'enums/fs_type.dart';
import 'enums/rate_type.dart';
import 'enums/song_type.dart';

part 'maimai_score.g.dart';

/// 游玩成绩
@collection
class MaimaiScore {
  MaimaiScore({
    this.id = Isar.autoIncrement,
    this.songId = 0,
    this.songName = '',
    this.level = '',
    this.levelIndex = LevelIndex.basic,
    this.achievements = 0.0,
    this.fc,
    this.fs,
    this.dxScore = 0,
    this.dxStar = 0,
    this.dxRating = 0.0,
    this.rate,
    this.type = SongType.standard,
    this.playTime,
    this.uploadTime,
    this.lastPlayedTime,
  });

  /// Isar 自增 ID
  Id id;

  /// 曲目 ID
  late int songId;

  /// 曲名（仅获取 Score 时返回）
  late String songName;

  /// 难度标级，如 14+（仅获取 Score 时返回）
  late String level;

  /// 难度
  @Enumerated(EnumType.name)
  late LevelIndex levelIndex;

  /// 达成率
  late double achievements;

  /// FULL COMBO 类型
  @Enumerated(EnumType.name)
  FCType? fc;

  /// FULL SYNC 类型
  @Enumerated(EnumType.name)
  FSType? fs;

  /// DX 分数
  late int dxScore;

  /// DX 星级，最大值为 5
  late int dxStar;

  /// DX Rating（仅获取 Score 时返回）
  late double dxRating;

  /// 评级类型（仅获取 Score 时返回）
  @Enumerated(EnumType.name)
  RateType? rate;

  /// 谱面类型
  @Enumerated(EnumType.name)
  late SongType type;

  /// 复合索引：songId + levelIndex + type 唯一标识一条成绩
  @Index(
    composite: [CompositeIndex('levelIndex'), CompositeIndex('type')],
    unique: true,
  )
  int get scoreKey => songId;

  /// 游玩的 UTC 时间，精确到分钟
  String? playTime;

  /// 成绩被同步时的 UTC 时间（仅获取 Score 时返回）
  String? uploadTime;

  /// 谱面最后游玩的 UTC 时间（仅获取成绩列表、获取最佳成绩时返回）
  String? lastPlayedTime;

  factory MaimaiScore.fromJson(Map<String, dynamic> json) {
    return MaimaiScore(
      songId: json['id'] as int? ?? 0,
      songName: json['song_name'] as String? ?? '',
      level: json['level'] as String? ?? '',
      levelIndex: json['level_index'] != null
          ? LevelIndex.fromValue(json['level_index'] as int)
          : LevelIndex.basic,
      achievements: (json['achievements'] as num?)?.toDouble() ?? 0.0,
      fc: json['fc'] != null ? FCType.fromValue(json['fc']) : null,
      fs: json['fs'] != null ? FSType.fromValue(json['fs']) : null,
      dxScore: json['dx_score'] as int? ?? 0,
      dxStar: json['dx_star'] as int? ?? 0,
      dxRating: (json['dx_rating'] as num?)?.toDouble() ?? 0.0,
      rate: json['rate'] != null ? RateType.fromValue(json['rate']) : null,
      type: json['type'] != null
          ? SongType.fromValue(json['type'])
          : SongType.standard,
      playTime: json['play_time'] as String?,
      uploadTime: json['upload_time'] as String?,
      lastPlayedTime: json['last_played_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': songId,
      'song_name': songName,
      'level': level,
      'level_index': levelIndex.value,
      'achievements': achievements,
      'fc': fc?.value,
      'fs': fs?.value,
      'dx_score': dxScore,
      'dx_star': dxStar,
      'dx_rating': dxRating,
      'rate': rate?.value,
      'type': type.value,
      'play_time': playTime,
      'upload_time': uploadTime,
      'last_played_time': lastPlayedTime,
    };
  }
}

/// 游玩成绩（简化）
@collection
class MaiMaiSimpleScore {
  MaiMaiSimpleScore({
    this.id = Isar.autoIncrement,
    this.songId = 0,
    this.songName = '',
    this.level = '',
    this.levelIndex = LevelIndex.basic,
    this.fc,
    this.fs,
    this.rate,
    this.type = SongType.standard,
  });

  /// Isar 自增 ID
  Id id;

  /// 曲目 ID
  @Index()
  late int songId;

  /// 曲名
  late String songName;

  /// 难度标级，如 14+
  late String level;

  /// 难度
  @Enumerated(EnumType.name)
  late LevelIndex levelIndex;

  /// FULL COMBO 类型
  @Enumerated(EnumType.name)
  FCType? fc;

  /// FULL SYNC 类型
  @Enumerated(EnumType.name)
  FSType? fs;

  /// 评级类型
  @Enumerated(EnumType.name)
  RateType? rate;

  /// 谱面类型
  @Enumerated(EnumType.name)
  late SongType type;

  factory MaiMaiSimpleScore.fromJson(Map<String, dynamic> json) {
    return MaiMaiSimpleScore(
      songId: json['id'] as int? ?? 0,
      songName: json['song_name'] as String? ?? '',
      level: json['level'] as String? ?? '',
      levelIndex: json['level_index'] != null
          ? LevelIndex.fromValue(json['level_index'] as int)
          : LevelIndex.basic,
      fc: json['fc'] != null ? FCType.fromValue(json['fc']) : null,
      fs: json['fs'] != null ? FSType.fromValue(json['fs']) : null,
      rate: json['rate'] != null ? RateType.fromValue(json['rate']) : null,
      type: json['type'] != null
          ? SongType.fromValue(json['type'])
          : SongType.standard,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': songId,
      'song_name': songName,
      'level': level,
      'level_index': levelIndex.value,
      'fc': fc?.value,
      'fs': fs?.value,
      'rate': rate?.value,
      'type': type.value,
    };
  }
}
