import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/musedash/md_player_info.dart';
import 'package:rank_hub/src/model/musedash/md_player_record.dart';

part 'md_player_data.g.dart';

@HiveType(typeId: 30)
class MdPlayerData extends HiveObject {
  @HiveField(0)
  DateTime lastUpdate;

  @HiveField(1)
  double rl;

  @HiveField(2)
  int diffHistoryNumber;

  @HiveField(3)
  List<MdPlayerRecord> plays;

  @HiveField(4)
  MdPlayerInfo user;

  @HiveField(5)
  String keyString;

  MdPlayerData({
    required this.lastUpdate,
    required this.rl,
    required this.diffHistoryNumber,
    required this.plays,
    required this.user,
    required this.keyString,
  });

  factory MdPlayerData.fromJson(Map<String, dynamic> json) => MdPlayerData(
    lastUpdate: DateTime.fromMillisecondsSinceEpoch(json['lastUpdate']),
    rl: json['rl'].toDouble(),
    diffHistoryNumber: json['diffHistoryNumber'],
    plays: (json['plays'] as List).map((e) => MdPlayerRecord.fromJson(e)).toList(),
    user: MdPlayerInfo.fromJson(json['user']),
    keyString: json['key'],
  );
}
