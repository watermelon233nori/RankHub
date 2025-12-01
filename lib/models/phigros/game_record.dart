import 'package:isar_community/isar.dart';

part 'game_record.g.dart';

/// Phigros 游戏成绩记录
@collection
class PhigrosGameRecord {
  Id id = Isar.autoIncrement;

  /// 关联的账号ID（外键）
  @Index()
  late String accountId;

  /// 歌曲ID
  @Index()
  late String songId;

  /// 歌曲名称
  late String songName;

  /// 曲师
  late String artist;

  /// 难度等级（EZ/HD/IN/AT/Legacy）
  @Index()
  late String level;

  /// 定数
  late double constant;

  /// 分数
  late int score;

  /// 准确率（百分比，如 99.85）
  late double acc;

  /// RKS值
  late double rks;

  /// 是否Full Combo
  late bool fc;

  /// 评级（根据分数和FC状态计算）
  /// 规则：
  /// - 100w分: Phi (ϕ)
  /// - 除100w分外任意分数FC: V (蓝V)
  /// - 96w分以上: V (白V)
  /// - 92w分以上: S
  /// - 88w分以上: A
  /// - 82w分以上: B
  /// - 70w分以上: C
  /// - 0分以上: F
  String get rating {
    if (score >= 1000000) return 'ϕ'; // Phi
    if (fc && score < 1000000) return 'V'; // 蓝V (FC但非100w)
    if (score >= 960000) return 'V'; // 白V
    if (score >= 920000) return 'S';
    if (score >= 880000) return 'A';
    if (score >= 820000) return 'B';
    if (score >= 700000) return 'C';
    return 'F';
  }

  /// 是否为蓝V（FC但非满分）
  bool get isBlueV => fc && score < 1000000;

  /// 最后更新时间
  late DateTime lastUpdated;

  PhigrosGameRecord();

  factory PhigrosGameRecord.fromDecryptedData(
    String accountId,
    Map<String, dynamic> data,
  ) {
    return PhigrosGameRecord()
      ..accountId = accountId
      ..songId = data['id'] as String
      ..songName = data['name'] as String
      ..artist = data['artist'] as String
      ..level = data['level'] as String
      ..constant = (data['constant'] as num).toDouble()
      ..score = data['score'] as int
      ..acc = (data['acc'] as num).toDouble()
      ..rks = (data['rks'] as num).toDouble()
      ..fc = data['fc'] as bool
      ..lastUpdated = DateTime.now();
  }

  /// 转换为Map（用于导出）
  Map<String, dynamic> toMap() {
    return {
      'songId': songId,
      'songName': songName,
      'artist': artist,
      'level': level,
      'constant': constant,
      'score': score,
      'acc': acc,
      'rks': rks,
      'fc': fc,
      'rating': rating,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }
}
