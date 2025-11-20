import 'package:isar_community/isar.dart';

part 'musedash_player.g.dart';

/// MuseDash 玩家模型
@collection
class MuseDashPlayer {
  Id id = Isar.autoIncrement;

  /// 用户 UUID (唯一标识)
  @Index(unique: true)
  late String userUuid;

  /// 用户 Object ID
  late String objectId;

  /// 用户 ID
  late String userId;

  /// 昵称
  late String nickname;

  /// 最后更新时间戳
  late int lastUpdate;

  /// Rating Level
  late double rl;

  /// 不同难度历史记录数量
  late int diffHistoryNumber;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashPlayer();

  factory MuseDashPlayer.fromJson(String userUuid, Map<String, dynamic> json) {
    final player = MuseDashPlayer()
      ..userUuid = userUuid
      ..lastUpdate = json['lastUpdate'] as int? ?? 0
      ..rl = (json['rl'] as num?)?.toDouble() ?? 0.0
      ..diffHistoryNumber = json['diffHistoryNumber'] as int? ?? 0
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    // 解析用户信息
    if (json['user'] != null) {
      final user = json['user'] as Map<String, dynamic>;
      player.objectId = user['object_id'] as String? ?? '';
      player.userId = user['user_id'] as String? ?? '';
      player.nickname = user['nickname'] as String? ?? '';
    } else {
      player.objectId = '';
      player.userId = '';
      player.nickname = '';
    }

    return player;
  }

  Map<String, dynamic> toJson() {
    return {
      'userUuid': userUuid,
      'objectId': objectId,
      'userId': userId,
      'nickname': nickname,
      'lastUpdate': lastUpdate,
      'rl': rl,
      'diffHistoryNumber': diffHistoryNumber,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 获取最后更新时间
  DateTime get lastUpdateTime {
    return DateTime.fromMillisecondsSinceEpoch(lastUpdate);
  }
}
