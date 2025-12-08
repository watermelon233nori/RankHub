import '../models/maimai/song.dart';
import '../models/maimai/score.dart';
import '../models/maimai/enums/song_type.dart';

/// Maimai DX分数和Rating计算辅助函数
class MaimaiScoreHelper {
  /// 计算DX Rating
  ///
  /// 公式: DX Rating = 谱面定数 × 达成率 × 评级系数 / 100 (向下取整)
  /// 注意: 达成率超过100.5000%的部分按100.5000%计算
  ///
  /// 参数:
  /// - [song]: 歌曲信息,包含定数等数据
  /// - [score]: 成绩信息,包含达成率等数据
  ///
  /// 返回: 计算得到的DX Rating值(整数)
  static double calculateDxRating(Song song, Score score) {
    // 从song中获取对应难度的定数
    double levelValue = 0.0;

    // 根据谱面类型和难度获取定数
    if (score.type == SongType.standard) {
      final difficulty = song.difficulties.standard.firstWhere(
        (d) => d.difficulty == score.levelIndex,
        orElse: () => song.difficulties.standard.first,
      );
      levelValue = difficulty.levelValue;
    } else if (score.type == SongType.dx) {
      final difficulty = song.difficulties.dx.firstWhere(
        (d) => d.difficulty == score.levelIndex,
        orElse: () => song.difficulties.dx.first,
      );
      levelValue = difficulty.levelValue;
    } else {
      // 宴会场谱面
      if (song.difficulties.utage.isNotEmpty) {
        levelValue = song.difficulties.utage.first.levelValue;
      }
    }

    // 获取评级系数
    final factor = _getAchievementFactor(score.achievements);

    // 计算Rating: 定数 × 达成率 × 系数 / 100，向下取整
    final rating = (levelValue * score.achievements * factor / 100)
        .floor()
        .toDouble();

    return rating;
  }

  /// 计算DX Star (0-5星)
  ///
  /// 根据DX分数占比计算星级:
  /// - 0-84.99%: 无星
  /// - 85.00%-89.99%: 1星
  /// - 90.00%-92.99%: 2星
  /// - 93.00%-94.99%: 3星
  /// - 95.00%-96.99%: 4星
  /// - 97.00%-100.00%: 5星
  ///
  /// 参数:
  /// - [song]: 歌曲信息,包含谱面总物量
  /// - [score]: 成绩信息,包含实际获得的DX分数
  ///
  /// 返回: 星级数(0-5)
  static int calculateDxStar(Song song, Score score) {
    // 获取该谱面的总物量以计算满分DX分数
    int totalNotes = 0;

    if (score.type == SongType.standard) {
      final difficulty = song.difficulties.standard.firstWhere(
        (d) => d.difficulty == score.levelIndex,
        orElse: () => song.difficulties.standard.first,
      );
      totalNotes = difficulty.notes?.total ?? 0;
    } else if (score.type == SongType.dx) {
      final difficulty = song.difficulties.dx.firstWhere(
        (d) => d.difficulty == score.levelIndex,
        orElse: () => song.difficulties.dx.first,
      );
      totalNotes = difficulty.notes?.total ?? 0;
    } else {
      // 宴会场谱面
      if (song.difficulties.utage.isNotEmpty) {
        totalNotes = song.difficulties.utage.first.notes?.total ?? 0;
      }
    }

    if (totalNotes == 0) return 0;

    // DX满分 = 总物量 × 3 (每个note最多3分)
    final maxDxScore = totalNotes * 3;

    // 计算DX分数占比
    final percentage = (score.dxScore / maxDxScore) * 100;

    // 根据占比区间确定星级
    if (percentage >= 97.0) return 5;
    if (percentage >= 95.0) return 4;
    if (percentage >= 93.0) return 3;
    if (percentage >= 90.0) return 2;
    if (percentage >= 85.0) return 1;
    return 0;
  }

  /// 根据达成率获取Rating系数
  ///
  /// 参数:
  /// - [achievements]: 达成率百分比 (如 101.0000)
  ///
  /// 返回: Rating系数
  static double _getAchievementFactor(double achievements) {
    // 达成率超过100.5000%按100.5000%计算
    if (achievements >= 100.5000) return 22.4;
    if (achievements >= 100.4999) return 22.2;
    if (achievements >= 100.0000) return 21.6;
    if (achievements >= 99.9999) return 21.4;
    if (achievements >= 99.5000) return 21.1;
    if (achievements >= 99.0000) return 20.8;
    if (achievements >= 98.9999) return 20.6;
    if (achievements >= 98.0000) return 20.3;
    if (achievements >= 97.0000) return 20.0;
    if (achievements >= 96.9999) return 17.6;
    if (achievements >= 94.0000) return 16.8;
    if (achievements >= 90.0000) return 15.2;
    if (achievements >= 80.0000) return 13.6;
    if (achievements >= 79.9999) return 12.8;
    if (achievements >= 75.0000) return 12.0;
    if (achievements >= 70.0000) return 11.2;
    if (achievements >= 60.0000) return 9.6;
    if (achievements >= 50.0000) return 8.0;
    if (achievements >= 40.0000) return 6.4;
    if (achievements >= 30.0000) return 4.8;
    if (achievements >= 20.0000) return 3.2;
    if (achievements >= 10.0000) return 1.6;
    return 0.0;
  }
}
