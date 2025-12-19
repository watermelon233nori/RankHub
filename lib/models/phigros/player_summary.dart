import 'package:isar_community/isar.dart';
import 'game_record.dart';

part 'player_summary.g.dart';

/// Phigros 玩家数据摘要
@collection
class PhigrosPlayerSummary {
  Id id = Isar.autoIncrement;

  /// 关联的账号ID（外键）
  @Index(unique: true)
  late String accountId;

  /// 总RKS值
  late double totalRks;

  /// B19平均RKS
  late double b19AverageRks;

  /// Phi数量
  late int phiCount;

  /// 游玩总曲目数
  late int totalSongsPlayed;

  /// Full Combo数量
  late int fcCount;

  /// 各等级歌曲通关数量
  late int ezCount;
  late int hdCount;
  late int inCount;
  late int atCount;

  /// 各评级数量
  late int sCount;
  late int aCount;
  late int bCount;
  late int cCount;

  /// 挑战模式排名（三位数：百位=段位等级1-5，十位+个位=总难度）
  late int challengeModeRank;

  /// 挑战模式段位等级（1:绿 2:蓝 3:红 4:金 5:彩）
  @ignore
  int get challengeRankLevel => challengeModeRank ~/ 100;

  /// 挑战模式总难度（后两位数字）
  @ignore
  int get challengeDifficulty => challengeModeRank % 100;

  /// 挑战模式段位名称
  @ignore
  String get challengeRankName {
    switch (challengeRankLevel) {
      case 1:
        return '绿';
      case 2:
        return '蓝';
      case 3:
        return '红';
      case 4:
        return '金';
      case 5:
        return '彩';
      default:
        return '未知';
    }
  }

  /// 挑战模式完整描述（例如："绿 16"）
  @ignore
  String get challengeRankDescription {
    if (challengeModeRank == 0) return '未参与';
    return '$challengeRankName $challengeDifficulty';
  }

  /// 头像名称
  late String avatarName;

  /// 最后更新时间
  late DateTime lastUpdated;

  PhigrosPlayerSummary();

  /// 从记录列表和进度数据计算摘要
  factory PhigrosPlayerSummary.calculate(
    String accountId,
    List<PhigrosGameRecord> records,
    int challengeModeRank, {
    String avatarName = '',
  }) {
    // 计算B19（Best 19，取RKS最高的19首）
    final sortedRecords = List<PhigrosGameRecord>.from(records)
      ..sort((a, b) => b.rks.compareTo(a.rks));

    final b19Records = sortedRecords.take(19).toList();
    final b19Sum = b19Records.fold<double>(
      0.0,
      (sum, record) => sum + record.rks,
    );
    final b19Average = b19Records.isNotEmpty ? b19Sum / b19Records.length : 0.0;

    // 统计各种数据
    int phiCount = 0;
    int fcCount = 0;
    int ezCount = 0;
    int hdCount = 0;
    int inCount = 0;
    int atCount = 0;
    int sCount = 0;
    int aCount = 0;
    int bCount = 0;
    int cCount = 0;

    for (final record in records) {
      if (record.acc == 100.0) phiCount++;
      if (record.fc) fcCount++;

      switch (record.level) {
        case 'EZ':
          ezCount++;
          break;
        case 'HD':
          hdCount++;
          break;
        case 'IN':
          inCount++;
          break;
        case 'AT':
          atCount++;
          break;
      }

      final rating = record.rating;
      if (rating == 'S') {
        sCount++;
      } else if (rating == 'A') {
        aCount++;
      } else if (rating == 'B') {
        bCount++;
      } else if (rating == 'C') {
        cCount++;
      }
    }

    return PhigrosPlayerSummary()
      ..accountId = accountId
      ..totalRks =
          b19Average // 实际RKS通常就是B19平均值
      ..b19AverageRks = b19Average
      ..phiCount = phiCount
      ..totalSongsPlayed = records.length
      ..fcCount = fcCount
      ..ezCount = ezCount
      ..hdCount = hdCount
      ..inCount = inCount
      ..atCount = atCount
      ..sCount = sCount
      ..aCount = aCount
      ..bCount = bCount
      ..cCount = cCount
      ..challengeModeRank = challengeModeRank
      ..avatarName = avatarName
      ..lastUpdated = DateTime.now();
  }

  /// 从 API 数据和记录列表计算摘要
  /// 使用 API 提供的精确 RKS、课题模式排名和难度统计
  factory PhigrosPlayerSummary.calculateWithApiData(
    String accountId,
    List<PhigrosGameRecord> records,
    double apiRks,
    int apiChallengeModeRank, {
    int? ezCount,
    int? hdCount,
    int? inCount,
    int? atCount,
    int? fcCount,
    String avatarName = '',
  }) {
    // 计算B19（Best 19，取RKS最高的19首）
    final sortedRecords = List<PhigrosGameRecord>.from(records)
      ..sort((a, b) => b.rks.compareTo(a.rks));

    final b19Records = sortedRecords.take(19).toList();
    final b19Sum = b19Records.fold<double>(
      0.0,
      (sum, record) => sum + record.rks,
    );
    final b19Average = b19Records.isNotEmpty ? b19Sum / b19Records.length : 0.0;

    // 统计各种数据（如果 API 没有提供，则从记录计算）
    int phiCount = 0;
    int fcCountLocal = fcCount ?? 0;
    int ezCountLocal = ezCount ?? 0;
    int hdCountLocal = hdCount ?? 0;
    int inCountLocal = inCount ?? 0;
    int atCountLocal = atCount ?? 0;
    int sCount = 0;
    int aCount = 0;
    int bCount = 0;
    int cCount = 0;

    // 如果没有从 API 提供难度统计，从记录中计算
    bool needCalculate =
        ezCount == null ||
        hdCount == null ||
        inCount == null ||
        atCount == null ||
        fcCount == null;

    for (final record in records) {
      if (record.acc == 100.0) phiCount++;

      if (needCalculate) {
        if (record.fc) fcCountLocal++;

        switch (record.level) {
          case 'EZ':
            ezCountLocal++;
            break;
          case 'HD':
            hdCountLocal++;
            break;
          case 'IN':
            inCountLocal++;
            break;
          case 'AT':
            atCountLocal++;
            break;
        }
      }

      final rating = record.rating;
      if (rating == 'S') {
        sCount++;
      } else if (rating == 'A') {
        aCount++;
      } else if (rating == 'B') {
        bCount++;
      } else if (rating == 'C') {
        cCount++;
      }
    }

    return PhigrosPlayerSummary()
      ..accountId = accountId
      ..totalRks =
          apiRks // 使用 API 返回的精确 RKS
      ..b19AverageRks = b19Average
      ..phiCount = phiCount
      ..totalSongsPlayed = records.length
      ..fcCount = fcCountLocal
      ..ezCount = ezCountLocal
      ..hdCount = hdCountLocal
      ..inCount = inCountLocal
      ..atCount = atCountLocal
      ..sCount = sCount
      ..aCount = aCount
      ..bCount = bCount
      ..cCount = cCount
      ..challengeModeRank =
          apiChallengeModeRank // 使用 API 返回的课题模式排名
      ..avatarName = avatarName
      ..lastUpdated = DateTime.now();
  }
}
