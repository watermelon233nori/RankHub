import 'package:isar_community/isar.dart';

part 'net_user.g.dart';

/// NET用户信息
/// 用于保存使用过的NET用户，方便快速选择
@collection
class NetUser {
  NetUser({
    this.id = Isar.autoIncrement,
    required this.userId,
    this.userName = '',
    this.playerRating = 0,
    this.iconId = 0,
    this.nameplateId = 0,
    this.trophyId = 0,
    this.lastPlayDate,
    this.lastUsedAt,
    this.qrCodeKey,
    this.qrCodeTimestamp,
  });

  /// Isar 自增 ID
  Id id;

  /// NET用户ID (唯一)
  @Index(unique: true)
  late int userId;

  /// 用户名
  late String userName;

  /// 玩家Rating
  late int playerRating;

  /// 图标ID
  late int iconId;

  /// 姓名牌ID
  late int nameplateId;

  /// 奖杯ID
  late int trophyId;

  /// 最后游玩日期
  String? lastPlayDate;

  /// 最后使用时间（用于排序）
  DateTime? lastUsedAt;

  /// QR Code Key (用于快速登录)
  String? qrCodeKey;

  /// QR Code 时间戳
  String? qrCodeTimestamp;

  /// 从 User Preview 响应创建
  factory NetUser.fromPreview(Map<String, dynamic> json) {
    return NetUser(
      userId: json['userId'] as int? ?? 0,
      userName: json['userName'] as String? ?? '',
      playerRating: json['playerRating'] as int? ?? 0,
      iconId: json['iconId'] as int? ?? 0,
      nameplateId: json['nameplateId'] as int? ?? 0,
      trophyId: json['trophyId'] as int? ?? 0,
      lastPlayDate: json['lastPlayDate'] as String?,
      lastUsedAt: DateTime.now(),
    );
  }

  /// 从 QR API 响应创建或更新
  factory NetUser.fromQrApi(Map<String, dynamic> json) {
    return NetUser(
      userId: json['userID'] as int? ?? 0,
      userName: '', // QR API不返回用户名，需要后续更新
      qrCodeKey: json['key'] as String?,
      qrCodeTimestamp: json['timestamp'] as String?,
      lastUsedAt: DateTime.now(),
    );
  }

  /// 更新用户信息（从 User Data 或 Preview）
  void updateFromPreview(Map<String, dynamic> json) {
    userName = json['userName'] as String? ?? userName;
    playerRating = json['playerRating'] as int? ?? playerRating;
    iconId = json['iconId'] as int? ?? iconId;
    nameplateId = json['nameplateId'] as int? ?? nameplateId;
    trophyId = json['trophyId'] as int? ?? trophyId;
    lastPlayDate = json['lastPlayDate'] as String? ?? lastPlayDate;
    lastUsedAt = DateTime.now();
  }

  /// 更新QR Code信息
  void updateQrCode(String key, String timestamp) {
    qrCodeKey = key;
    qrCodeTimestamp = timestamp;
    lastUsedAt = DateTime.now();
  }

  /// 转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userName': userName,
      'playerRating': playerRating,
      'iconId': iconId,
      'nameplateId': nameplateId,
      'trophyId': trophyId,
      'lastPlayDate': lastPlayDate,
      'lastUsedAt': lastUsedAt?.toIso8601String(),
      'qrCodeKey': qrCodeKey,
      'qrCodeTimestamp': qrCodeTimestamp,
    };
  }
}
