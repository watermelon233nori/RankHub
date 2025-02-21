
import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 39)
class Player extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String provider;

  @HiveField(2)
  final String uuid;

  Player({required this.name, required this.provider, required this.uuid});
}