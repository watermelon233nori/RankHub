import 'package:rank_hub/core/resource_key.dart';
import 'package:rank_hub/games/maimai/models/maimai_score.dart';
import 'package:rank_hub/games/maimai/models/maimai_song.dart';

final ResourceKey<List<MaimaiSong>> maimaiSongListResourceKey =
    ResourceKey<List<MaimaiSong>>(namespace: 'maimai', name: 'song_list');

final ResourceKey<List<MaimaiVersion>> maimaiVersionListResourceKey =
    ResourceKey<List<MaimaiVersion>>(namespace: 'maimai', name: 'version_list');

final ResourceKey<List<MaimaiGenre>> maimaiGenreListResourceKey =
    ResourceKey<List<MaimaiGenre>>(namespace: 'maimai', name: 'genre_list');

final ResourceKey<List<MaimaiScore>> maimaiScoreListResourceKey =
    ResourceKey<List<MaimaiScore>>(namespace: 'maimai', name: 'score_list');
