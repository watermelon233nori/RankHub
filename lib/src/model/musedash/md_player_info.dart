import 'package:hive/hive.dart';

part 'md_player_info.g.dart';

@HiveType(typeId: 33)
class MdPlayerInfo extends HiveObject {
  @HiveField(0)
  String objectId;

  @HiveField(1)
  DateTime createdAt;

  @HiveField(2)
  DateTime updatedAt;

  @HiveField(3)
  String userId;

  @HiveField(4)
  String nickname;

  MdPlayerInfo({
    required this.objectId,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.nickname,
  });

  factory MdPlayerInfo.fromJson(Map<String, dynamic> json) => MdPlayerInfo(
    objectId: json['object_id'],
    createdAt: DateTime.parse(json['created_at']),
    updatedAt: DateTime.parse(json['updated_at']),
    userId: json['user_id'],
    nickname: json['nickname'],
  );
}