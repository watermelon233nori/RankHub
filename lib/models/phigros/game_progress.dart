import 'package:isar_community/isar.dart';

part 'game_progress.g.dart';

/// Phigros 游戏进度
@collection
class PhigrosGameProgress {
  Id id = Isar.autoIncrement;

  /// 关联的账号ID（外键）
  @Index()
  late String accountId;

  /// 是否首次运行
  late bool isFirstRun;

  /// Legacy章节是否完成
  late bool legacyChapterFinished;

  /// 是否已显示收藏品提示
  late bool alreadyShowCollectionTip;

  /// 是否已显示自动解锁IN提示
  late bool alreadyShowAutoUnlockInTip;

  /// 已完成的内容
  late String completed;

  /// 歌曲更新信息
  late int songUpdateInfo;

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

  /// 货币数量（5种货币）
  late List<int> money;

  /// Spasmodic解锁标志
  late int unlockFlagOfSpasmodic;

  /// Igallta解锁标志
  late int unlockFlagOfIgallta;

  /// Rrharil解锁标志
  late int unlockFlagOfRrharil;

  /// 歌曲记录键标志
  late int flagOfSongRecordKey;

  /// 随机版本已解锁
  late int randomVersionUnlocked;

  /// 第8章解锁开始
  late bool chapter8UnlockBegin;

  /// 第8章解锁第二阶段
  late bool chapter8UnlockSecondPhase;

  /// 第8章已通过
  late bool chapter8Passed;

  /// 第8章歌曲已解锁
  late int chapter8SongUnlocked;

  /// 最后更新时间
  late DateTime lastUpdated;

  PhigrosGameProgress();

  factory PhigrosGameProgress.fromDecryptedData(
    String accountId,
    Map<String, dynamic> data,
  ) {
    return PhigrosGameProgress()
      ..accountId = accountId
      ..isFirstRun = data['is_first_run'] as bool
      ..legacyChapterFinished = data['legacy_chapter_finished'] as bool
      ..alreadyShowCollectionTip = data['already_show_collection_tip'] as bool
      ..alreadyShowAutoUnlockInTip =
          data['already_show_auto_unlock_in_tip'] as bool
      ..completed = data['completed'] as String
      ..songUpdateInfo = data['song_update_info'] as int
      ..challengeModeRank = data['challenge_mode_rank'] as int
      ..money = (data['money'] as List).cast<int>()
      ..unlockFlagOfSpasmodic = data['unlock_flag_of_spasmodic'] as int
      ..unlockFlagOfIgallta = data['unlock_flag_of_igallta'] as int
      ..unlockFlagOfRrharil = data['unlock_flag_of_rrharil'] as int
      ..flagOfSongRecordKey = data['flag_of_song_record_key'] as int
      ..randomVersionUnlocked = data['random_version_unlocked'] as int
      ..chapter8UnlockBegin = data['chapter8_unlock_begin'] as bool
      ..chapter8UnlockSecondPhase = data['chapter8_unlock_second_phase'] as bool
      ..chapter8Passed = data['chapter8_passed'] as bool
      ..chapter8SongUnlocked = data['chapter8_song_unlocked'] as int
      ..lastUpdated = DateTime.now();
  }
}
