import 'dart:convert';
import 'package:isar_community/isar.dart';

part 'osu_user.g.dart';

/// osu! 用户信息模型
/// 包含 User 和 UserExtended 的合并数据
@collection
class OsuUser {
  Id id = Isar.autoIncrement;

  /// osu! 用户 ID (作为唯一索引)
  @Index(unique: true)
  late int userId;

  /// 用户名
  late String username;

  /// 头像 URL
  String? avatarUrl;

  /// 封面 URL (from UserExtended.cover.url)
  String? coverUrl;

  /// 国家代码 (ISO 3166-1 alpha-2)
  String? countryCode;

  /// 个人简介颜色 (Hex)
  String? profileColour;

  /// 是否活跃
  bool isActive = false;

  /// 是否机器人
  bool isBot = false;

  /// 是否已删除
  bool isDeleted = false;

  /// 是否在线
  bool isOnline = false;

  /// 是否是 Supporter
  bool isSupporter = false;

  /// 上次访问时间
  DateTime? lastVisit;

  /// 注册时间
  DateTime? joinDate;

  /// 游戏模式 (osu, taiko, catch, mania)
  /// 如果是多模式玩家，通常以默认模式或查询模式为主
  @Index()
  String? playmode;

  // ========== 统计信息 (UserStatistics) ==========

  /// 全球排名
  int? globalRank;

  /// 地区排名
  int? countryRank;

  /// PP 值
  double? pp;

  /// 准确率 (0-100)
  double? hitAccuracy;

  /// 游玩次数
  int? playCount;

  /// 游玩时长 (秒)
  int? playTime;

  /// 总得分
  int? totalScore;

  /// 最大连击
  int? maximumCombo;

  /// 等级
  int? currentLevel;

  /// 进度 (0-100)
  int? levelProgress;

  // ========== 增量模式存储字段 ==========

  /// 标准模式统计信息
  String? stdStatisticsJson;

  /// 太鼓模式统计信息
  String? taikoStatisticsJson;

  /// 接水果模式统计信息
  String? catchStatisticsJson;

  /// Mania 模式统计信息
  String? maniaStatisticsJson;

  /// 更新指定模式的统计信息
  void updateModeStatistics(String mode, Map<String, dynamic> stats) {
    // 序列化统计信息
    final jsonStr = jsonEncode(stats);

    // 根据模式存储 JSON
    switch (mode) {
      case 'osu':
        stdStatisticsJson = jsonStr;
        break;
      case 'taiko':
        taikoStatisticsJson = jsonStr;
        break;
      case 'fruits':
        catchStatisticsJson = jsonStr;
        break;
      case 'mania':
        maniaStatisticsJson = jsonStr;
        break;
    }

    // 更新主字段用于显示
    playmode = mode;
    pp = (stats['pp'] as num?)?.toDouble();
    hitAccuracy = (stats['hit_accuracy'] as num?)?.toDouble();
    playCount = stats['play_count'] as int?;
    playTime = stats['play_time'] as int?;
    totalScore = stats['total_score'] as int?;
    maximumCombo = stats['maximum_combo'] as int?;

    if (stats.containsKey('level')) {
      final level = stats['level'] as Map<String, dynamic>;
      currentLevel = level['current'] as int?;
      levelProgress = level['progress'] as int?;
    }

    if (stats.containsKey('rank')) {
      final rank = stats['rank'] as Map<String, dynamic>;
      globalRank = rank['global'] as int?;
      countryRank = rank['country'] as int?;
    } else {
      globalRank = stats['global_rank'] as int?;
    }

    updatedAt = DateTime.now();
  }

  /// 关注者数量
  int? followerCount;

  /// 映射关注者数量
  int? mappingFollowerCount;

  /// 喜欢的谱面集数量
  int? favouriteBeatmapsetCount;

  /// 坟图数量
  int? graveyardBeatmapsetCount;

  /// 提名图数量
  int? nominatedBeatmapsetCount;

  /// 喜爱图数量
  int? lovedBeatmapsetCount;

  /// 待定图数量
  int? pendingBeatmapsetCount;

  /// Ranked 图数量
  int? rankedBeatmapsetCount;

  /// 原始 JSON 数据 (用于存储 UserExtended 中未单独字段化的复杂结构)
  String? rawJson;

  /// 数据更新时间
  late DateTime updatedAt;

  OsuUser();

  /// 从 JSON 解析构建 OsuUser 对象
  factory OsuUser.fromJson(Map<String, dynamic> json) {
    final user = OsuUser()
      ..userId = json['id'] as int
      ..username = json['username'] as String
      ..avatarUrl = json['avatar_url'] as String?
      ..countryCode = json['country_code'] as String?
      ..profileColour = json['profile_colour'] as String?
      ..isActive = json['is_active'] as bool? ?? false
      ..isBot = json['is_bot'] as bool? ?? false
      ..isDeleted = json['is_deleted'] as bool? ?? false
      ..isOnline = json['is_online'] as bool? ?? false
      ..isSupporter = json['is_supporter'] as bool? ?? false
      ..updatedAt = DateTime.now();

    // 处理 UserExtended 字段
    if (json.containsKey('cover')) {
      final cover = json['cover'] as Map<String, dynamic>?;
      user.coverUrl = cover?['url'] as String?;
    } else {
      user.coverUrl = json['cover_url'] as String?; // 兼容旧字段
    }

    if (json['last_visit'] != null) {
      user.lastVisit = DateTime.tryParse(json['last_visit'] as String);
    }

    if (json['join_date'] != null) {
      user.joinDate = DateTime.tryParse(json['join_date'] as String);
    }

    user.playmode = json['playmode'] as String?;
    user.followerCount = json['follower_count'] as int?;
    user.mappingFollowerCount = json['mapping_follower_count'] as int?;

    // 谱面相关计数
    user.favouriteBeatmapsetCount = json['favourite_beatmapset_count'] as int?;
    user.graveyardBeatmapsetCount = json['graveyard_beatmapset_count'] as int?;
    user.nominatedBeatmapsetCount = json['nominated_beatmapset_count'] as int?;
    user.lovedBeatmapsetCount = json['loved_beatmapset_count'] as int?;
    user.pendingBeatmapsetCount = json['pending_beatmapset_count'] as int?;
    user.rankedBeatmapsetCount = json['ranked_beatmapset_count'] as int?;

    // 处理 Statistics
    if (json.containsKey('statistics')) {
      final stats = json['statistics'] as Map<String, dynamic>;
      user.pp = (stats['pp'] as num?)?.toDouble();
      user.hitAccuracy = (stats['hit_accuracy'] as num?)?.toDouble();
      user.playCount = stats['play_count'] as int?;
      user.playTime = stats['play_time'] as int?;
      user.totalScore = stats['total_score'] as int?;
      user.maximumCombo = stats['maximum_combo'] as int?;

      if (stats.containsKey('level')) {
        final level = stats['level'] as Map<String, dynamic>;
        user.currentLevel = level['current'] as int?;
        user.levelProgress = level['progress'] as int?;
      }

      if (stats.containsKey('rank')) {
        final rank = stats['rank'] as Map<String, dynamic>;
        user.globalRank = rank['global'] as int?;
        user.countryRank = rank['country'] as int?;
      } else {
        // 兼容扁平结构
        user.globalRank = stats['global_rank'] as int?;
        // country_rank 可能不在扁平结构中
      }
    }

    return user;
  }
}
