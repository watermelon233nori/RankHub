import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/musedash/md_rank_history.dart';

part 'md_player_record.g.dart';

@HiveType(typeId: 31)
class MdPlayerRecord extends HiveObject {
  @HiveField(0)
  int score;

  @HiveField(1)
  double acc;

  @HiveField(2)
  int i;

  @HiveField(3)
  String platform;

  @HiveField(4)
  MdRankHistory history;

  @HiveField(5)
  int difficulty;

  @HiveField(6)
  String uid;

  @HiveField(7)
  int sum;

  @HiveField(8)
  String characterUid;

  @HiveField(9)
  String elfinUid;

  MdPlayerRecord({
    required this.score,
    required this.acc,
    required this.i,
    required this.platform,
    required this.history,
    required this.difficulty,
    required this.uid,
    required this.sum,
    required this.characterUid,
    required this.elfinUid,
  });

  factory MdPlayerRecord.fromJson(Map<String, dynamic> json) => MdPlayerRecord(
    score: json['score'],
    acc: json['acc'].toDouble(),
    i: json['i'],
    platform: json['platform'],
    history: MdRankHistory.fromJson(json['history']),
    difficulty: json['difficulty'],
    uid: json['uid'],
    sum: json['sum'],
    characterUid: json['character_uid'],
    elfinUid: json['elfin_uid'],
  );
}