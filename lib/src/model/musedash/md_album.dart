import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/musedash/md_localized_text.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';

part 'md_album.g.dart';

@HiveType(typeId: 38)
class MdAlbum {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String jsonKey;

  @HiveField(2)
  final MdLocalizedText localized;

  @HiveField(3)
  final String tag;

  @HiveField(4)
  final List<MdMusic> musicList;

  MdAlbum({
    required this.title,
    required this.jsonKey,
    required this.localized,
    required this.tag,
    required this.musicList,
  });

  factory MdAlbum.fromJson(String key, Map<String, dynamic> json) {
    var musicMap = json['music'] as Map<String, dynamic>? ?? {};
    List<MdMusic> musicList = musicMap.values.map((m) => MdMusic.fromJson(m)).toList();
    
    return MdAlbum(
      title: json['title'] ?? '',
      jsonKey: key,
      localized: MdLocalizedText.fromJson(json),
      tag: json['tag'] ?? '',
      musicList: musicList,
    );
  }
}