import 'package:hive/hive.dart';

part 'play_stats.g.dart';

@HiveType(typeId: 70)
class PlayStats {
  @HiveField(0)
  final Map<DateTime, int> stats;

  PlayStats({required this.stats});
}