import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class MaiGameData {
  final List<SongInfo> songs;
  final List<SongGenre> genres;
  final List<SongVersion> versions;

  MaiGameData({
    required this.songs,
    required this.genres,
    required this.versions
  });
}
