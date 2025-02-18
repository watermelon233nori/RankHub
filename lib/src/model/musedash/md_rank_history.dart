import 'package:hive/hive.dart';

part 'md_rank_history.g.dart';

@HiveType(typeId: 32)
class MdRankHistory extends HiveObject {
  @HiveField(0)
  int lastRank;

  MdRankHistory({required this.lastRank});

  factory MdRankHistory.fromJson(Map<String, dynamic> json) => MdRankHistory(
    lastRank: json['lastRank'],
  );
}