import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/collection.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/game_data.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulties.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulty.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_notes.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart' as mai;
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart' as mai;
import 'package:rank_hub/src/model/musedash/md_album.dart';
import 'package:rank_hub/src/model/musedash/md_ce_category.dart';
import 'package:rank_hub/src/model/musedash/md_ce_names.dart';
import 'package:rank_hub/src/model/musedash/md_localized_text.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';
import 'package:rank_hub/src/model/musedash/md_player_data.dart';
import 'package:rank_hub/src/model/musedash/md_player_info.dart';
import 'package:rank_hub/src/model/musedash/md_player_record.dart';
import 'package:rank_hub/src/model/musedash/md_rank_history.dart';
import 'package:rank_hub/src/model/player.dart' as common;

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initHive();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(
    ProviderScope(
      child: MyApp(settingsController: settingsController),
    ),
  );
}

Future<void> initHive() async {
  Hive.initFlutter();

  //common
  Hive.registerAdapter(common.PlayerAdapter());

  //maimai
  Hive.registerAdapter(mai.SongScoreAdapter());
  Hive.registerAdapter(mai.SongInfoAdapter());
  Hive.registerAdapter(mai.SongAliasAdapter());
  Hive.registerAdapter(mai.SongGenreAdapter());
  Hive.registerAdapter(mai.SongVersionAdapter());
  Hive.registerAdapter(mai.SongNotesAdapter());
  Hive.registerAdapter(mai.BuddyNotesAdapter());
  Hive.registerAdapter(mai.SongDifficultyAdapter());
  Hive.registerAdapter(mai.SongDifficultiesAdapter());
  Hive.registerAdapter(mai.GameDataAdapter());
  Hive.registerAdapter(mai.PlayerDataAdapter());
  Hive.registerAdapter(mai.CollectionAdapter());

  //musedash
  Hive.registerAdapter(MdAlbumAdapter());
  Hive.registerAdapter(MdCECategoryAdapter());
  Hive.registerAdapter(MdCENamesAdapter());
  Hive.registerAdapter(MdLocalizedTextAdapter());
  Hive.registerAdapter(MdMusicAdapter());
  Hive.registerAdapter(MdPlayerDataAdapter());
  Hive.registerAdapter(MdPlayerInfoAdapter());
  Hive.registerAdapter(MdPlayerRecordAdapter());
  Hive.registerAdapter(MdRankHistoryAdapter());
}
