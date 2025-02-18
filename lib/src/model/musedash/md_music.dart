import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/musedash/md_localized_text.dart';

part 'md_music.g.dart';

@HiveType(typeId: 37)
class MdMusic {
  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String author;

  @HiveField(3)
  final String cover;

  @HiveField(4)
  final String bpm;

  @HiveField(5)
  final List<String> levelDesigner;

  @HiveField(6)
  final List<String> difficulty;

  @HiveField(7)
  final MdLocalizedText localized;

  MdMusic({
    required this.uid,
    required this.name,
    required this.author,
    required this.cover,
    required this.bpm,
    required this.levelDesigner,
    required this.difficulty,
    required this.localized,
  });

  factory MdMusic.fromJson(Map<String, dynamic> json) {
    return MdMusic(
      uid: json['uid'],
      name: json['name'],
      author: json['author'],
      cover: json['cover'],
      bpm: json['bpm'],
      levelDesigner: List<String>.from(json['levelDesigner'] ?? []),
      difficulty: List<String>.from(json['difficulty'] ?? []),
      localized: MdLocalizedText(
        chineseS: json['ChineseS']['name'] ?? '',
        chineseT: json['ChineseT']['name'] ?? '',
        english: json['English']['name'] ?? '',
        japanese: json['Japanese']['name'] ?? '',
        korean: json['Korean']['name'] ?? '',
      ),
    );
  }
}