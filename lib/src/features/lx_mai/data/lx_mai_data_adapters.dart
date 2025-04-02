import 'package:hive/hive.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/collection.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/game_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulties.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulty.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_notes.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class LxMaiDataAdapters {
  static void register() {
    Hive.registerAdapter(SongScoreAdapter());
    Hive.registerAdapter(SongInfoAdapter());
    Hive.registerAdapter(SongAliasAdapter());
    Hive.registerAdapter(SongGenreAdapter());
    Hive.registerAdapter(SongVersionAdapter());
    Hive.registerAdapter(SongNotesAdapter());
    Hive.registerAdapter(BuddyNotesAdapter());
    Hive.registerAdapter(SongDifficultyAdapter());
    Hive.registerAdapter(SongDifficultiesAdapter());
    Hive.registerAdapter(GameDataAdapter());
    Hive.registerAdapter(PlayerDataAdapter());
    Hive.registerAdapter(CollectionAdapter());
  }
}
