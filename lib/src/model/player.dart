
import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 39)
class Player extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String provider;

  @HiveField(2)
  String uuid;

  @HiveField(3)
  String? avatarUrl;

  @HiveField(4)
  String? backgroundUrl;

  Player({required this.name, required this.provider, required this.uuid, this.avatarUrl, this.backgroundUrl});
}