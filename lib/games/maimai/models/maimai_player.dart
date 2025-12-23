import 'package:isar_community/isar.dart';
import 'package:rank_hub/games/maimai/models/maimai_collection_base.dart';
import 'package:rank_hub/games/maimai/models/maimai_collection_items.dart';

part 'maimai_player.g.dart';

/// DX Rating 趋势
@collection
class MaimaiRatingTrend {
  MaimaiRatingTrend({
    this.id = Isar.autoIncrement,
    this.total = 0,
    this.standard = 0,
    this.dx = 0,
    this.date = '',
  });

  /// Isar 自增 ID
  Id id;

  /// 总 DX Rating
  late int total;

  /// 旧版本谱面总 DX Rating
  late int standard;

  /// 现版本谱面总 DX Rating
  late int dx;

  /// 日期
  @Index()
  late String date;

  factory MaimaiRatingTrend.fromJson(Map<String, dynamic> json) {
    return MaimaiRatingTrend(
      total: json['total'] as int? ?? 0,
      standard: json['standard'] as int? ?? 0,
      dx: json['dx'] as int? ?? 0,
      date: json['date'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'total': total, 'standard': standard, 'dx': dx, 'date': date};
  }
}

/// 玩家
@collection
class MaimaiPlayer {
  MaimaiPlayer({
    this.id = Isar.autoIncrement,
    this.name = '',
    this.rating = 0,
    this.friendCode = 0,
    this.courseRank = 0,
    this.classRank = 0,
    this.star = 0,
    MaimaiTrophy? trophy,
    MaimaiIconData? icon,
    MaimaiNamePlate? namePlate,
    MaimaiFrame? frame,
    this.uploadTime,
  }) : trophy = trophy,
       icon = icon,
       namePlate = namePlate,
       frame = frame;

  /// Isar 自增 ID（可存储多个玩家）
  Id id;

  /// 游戏内名称
  late String name;

  /// 玩家 DX Rating
  late int rating;

  /// 好友码
  @Index(unique: true)
  late int friendCode;

  /// 段位 ID
  late int courseRank;

  /// 阶级 ID
  late int classRank;

  /// 搭档觉醒数
  late int star;

  /// 称号（仅上传时可空）
  MaimaiTrophy? trophy;

  /// 头像
  MaimaiIconData? icon;

  /// 姓名框
  MaimaiNamePlate? namePlate;

  /// 背景
  MaimaiFrame? frame;

  /// 玩家被同步时的 UTC 时间（仅获取玩家信息返回）
  String? uploadTime;

  factory MaimaiPlayer.fromJson(Map<String, dynamic> json) {
    return MaimaiPlayer(
      name: json['name'] as String? ?? '',
      rating: json['rating'] as int? ?? 0,
      friendCode: json['friend_code'] as int? ?? 0,
      courseRank: json['course_rank'] as int? ?? 0,
      classRank: json['class_rank'] as int? ?? 0,
      star: json['star'] as int? ?? 0,
      trophy: json['trophy'] != null
          ? MaimaiTrophy.fromJson(json['trophy'])
          : null,
      icon: json['icon'] != null ? MaimaiIconData.fromJson(json['icon']) : null,
      namePlate: json['name_plate'] != null
          ? MaimaiNamePlate.fromJson(json['name_plate'])
          : null,
      frame: json['frame'] != null ? MaimaiFrame.fromJson(json['frame']) : null,
      uploadTime: json['upload_time'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rating': rating,
      'friend_code': friendCode,
      'course_rank': courseRank,
      'class_rank': classRank,
      'star': star,
      'trophy': trophy?.toJson(),
      'icon': icon?.toJson(),
      'name_plate': namePlate?.toJson(),
      'frame': frame?.toJson(),
      'upload_time': uploadTime,
    };
  }

  /// 段位图片 URL
  String get courseRankImageUrl =>
      'https://maimai.lxns.net/assets/maimai/course_rank/$courseRank.webp';

  /// 阶级图片 URL
  String get classRankImageUrl =>
      'https://maimai.lxns.net/assets/maimai/class_rank/$classRank.webp';

  /// 星星图标 URL
  String get starIconUrl =>
      'https://maimai.lxns.net/assets/maimai/icon_star.webp';
}
