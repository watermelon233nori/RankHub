import 'package:isar_community/isar.dart';
import 'enums/level_index.dart';
import 'enums/fc_type.dart';
import 'enums/fs_type.dart';
import 'enums/rate_type.dart';
import 'enums/song_type.dart';
import 'score.dart';

part 'net_score.g.dart';

/// maimai DX NET 返回的成绩数据
/// 用于解析 Title API 返回的原始成绩数据，并转换为 LXNS Score 模型
@collection
class NetScore {
  NetScore({
    this.id = Isar.autoIncrement,
    this.musicId = 0,
    this.level = 0,
    this.playCount = 0,
    this.achievement = 0,
    this.comboStatus = 0,
    this.syncStatus = 0,
    this.deluxscoreMax = 0,
    this.scoreRank = 0,
    this.extNum1 = 0,
    this.extNum2 = 0,
  });

  /// Isar 自增 ID
  Id id;

  /// 曲目 ID
  late int musicId;

  /// 难度等级 (0-4)
  late int level;

  /// 游玩次数
  late int playCount;

  /// 达成率 (6位或7位整数, 如 1010000 表示 101.0000%)
  late int achievement;

  /// COMBO 状态 (0-4)
  late int comboStatus;

  /// SYNC 状态 (0-5)
  late int syncStatus;

  /// DX分数
  late int deluxscoreMax;

  /// 评级 (0-13)
  late int scoreRank;

  /// 扩展字段1
  late int extNum1;

  /// 扩展字段2
  late int extNum2;

  /// 从JSON创建
  factory NetScore.fromJson(Map<String, dynamic> json) {
    return NetScore(
      musicId: json['musicId'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
      playCount: json['playCount'] as int? ?? 0,
      achievement: json['achievement'] as int? ?? 0,
      comboStatus: json['comboStatus'] as int? ?? 0,
      syncStatus: json['syncStatus'] as int? ?? 0,
      deluxscoreMax: json['deluxscoreMax'] as int? ?? 0,
      scoreRank: json['scoreRank'] as int? ?? 0,
      extNum1: json['extNum1'] as int? ?? 0,
      extNum2: json['extNum2'] as int? ?? 0,
    );
  }

  /// 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'musicId': musicId,
      'level': level,
      'playCount': playCount,
      'achievement': achievement,
      'comboStatus': comboStatus,
      'syncStatus': syncStatus,
      'deluxscoreMax': deluxscoreMax,
      'scoreRank': scoreRank,
      'extNum1': extNum1,
      'extNum2': extNum2,
    };
  }

  /// 将syncStatus映射为FSType
  /// 映射规则:
  /// 0 -> null (empty)
  /// 1 -> fs
  /// 2 -> fsp
  /// 3 -> fsd (fdx)
  /// 4 -> fsdp (fdxp)
  /// 5 -> sync
  FSType? _mapSyncStatusToFS() {
    switch (syncStatus) {
      case 1:
        return FSType.fs;
      case 2:
        return FSType.fsPlus;
      case 3:
        return FSType.fsd;
      case 4:
        return FSType.fsdPlus;
      case 5:
        return FSType.sync;
      default:
        return null;
    }
  }

  /// 将comboStatus映射为FCType
  /// 映射规则:
  /// 0 -> null (empty)
  /// 1 -> fc
  /// 2 -> fcp
  /// 3 -> ap
  /// 4 -> app
  FCType? _mapComboStatusToFC() {
    switch (comboStatus) {
      case 1:
        return FCType.fc;
      case 2:
        return FCType.fcPlus;
      case 3:
        return FCType.ap;
      case 4:
        return FCType.apPlus;
      default:
        return null;
    }
  }

  /// 将level映射为LevelIndex
  /// 映射规则:
  /// 0 -> basic
  /// 1 -> advanced
  /// 2 -> expert
  /// 3 -> master
  /// 4 -> remaster
  LevelIndex _mapLevelToLevelIndex() {
    return LevelIndex.fromValue(level);
  }

  /// 将scoreRank映射为RateType
  /// 映射规则:
  /// 0 -> d
  /// 1 -> c
  /// 2 -> b
  /// 3 -> bb
  /// 4 -> bbb
  /// 5 -> a
  /// 6 -> aa
  /// 7 -> aaa
  /// 8 -> s
  /// 9 -> sp
  /// 10 -> ss
  /// 11 -> ssp
  /// 12 -> sss
  /// 13 -> sssp
  RateType? _mapScoreRankToRate() {
    switch (scoreRank) {
      case 0:
        return RateType.d;
      case 1:
        return RateType.c;
      case 2:
        return RateType.b;
      case 3:
        return RateType.bb;
      case 4:
        return RateType.bbb;
      case 5:
        return RateType.a;
      case 6:
        return RateType.aa;
      case 7:
        return RateType.aaa;
      case 8:
        return RateType.s;
      case 9:
        return RateType.sPlus;
      case 10:
        return RateType.ss;
      case 11:
        return RateType.ssPlus;
      case 12:
        return RateType.sss;
      case 13:
        return RateType.sssPlus;
      default:
        return null;
    }
  }

  /// 将achievement映射为达成率百分比
  /// achievement是6位或7位整数
  /// 如: 1010000 -> 101.0000%
  ///    950000 -> 95.0000%
  double _mapAchievementToPercentage() {
    if (achievement == 0) return 0.0;
    return achievement / 10000.0;
  }

  /// 转换为标准Score模型
  /// 注意: songName、level字符串、dxRating、dxStar需要额外计算或查询
  /// TODO: dx_rating和dx_star需要通过公共帮助函数计算
  Score toScore({
    String songName = '',
    String levelStr = '',
    SongType type = SongType.standard,
    double? dxRating,
    int? dxStar,
    String? playTime,
    String? uploadTime,
    String? lastPlayedTime,
  }) {
    return Score(
      songId: musicId,
      songName: songName,
      level: levelStr,
      levelIndex: _mapLevelToLevelIndex(),
      achievements: _mapAchievementToPercentage(),
      fc: _mapComboStatusToFC(),
      fs: _mapSyncStatusToFS(),
      dxScore: deluxscoreMax,
      dxStar: dxStar ?? 0, // TODO: 通过帮助函数计算
      dxRating: dxRating ?? 0.0, // TODO: 通过帮助函数计算
      rate: _mapScoreRankToRate(),
      type: type,
      playTime: playTime,
      uploadTime: uploadTime,
      lastPlayedTime: lastPlayedTime,
    );
  }
}

/// NET 返回的成绩列表响应
class NetScoreResponse {
  NetScoreResponse({
    required this.userId,
    required this.length,
    required this.nextIndex,
    required this.userMusicList,
  });

  final int userId;
  final int length;
  final int nextIndex;
  final List<UserMusicItem> userMusicList;

  factory NetScoreResponse.fromJson(Map<String, dynamic> json) {
    return NetScoreResponse(
      userId: json['userId'] as int? ?? 0,
      length: json['length'] as int? ?? 0,
      nextIndex: json['nextIndex'] as int? ?? 0,
      userMusicList:
          (json['userMusicList'] as List?)
              ?.map(
                (item) => UserMusicItem.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'length': length,
      'nextIndex': nextIndex,
      'userMusicList': userMusicList.map((item) => item.toJson()).toList(),
    };
  }
}

/// 用户音乐项
class UserMusicItem {
  UserMusicItem({required this.userMusicDetailList, required this.length});

  final List<NetScore> userMusicDetailList;
  final int length;

  factory UserMusicItem.fromJson(Map<String, dynamic> json) {
    return UserMusicItem(
      userMusicDetailList:
          (json['userMusicDetailList'] as List?)
              ?.map(
                (detail) => NetScore.fromJson(detail as Map<String, dynamic>),
              )
              .toList() ??
          [],
      length: json['length'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userMusicDetailList': userMusicDetailList
          .map((detail) => detail.toJson())
          .toList(),
      'length': length,
    };
  }
}
