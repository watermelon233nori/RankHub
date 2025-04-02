import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_data_adapters.dart';
import 'package:rank_hub/src/model/musedash/md_album.dart';
import 'package:rank_hub/src/model/musedash/md_ce_category.dart';
import 'package:rank_hub/src/model/musedash/md_ce_names.dart';
import 'package:rank_hub/src/model/musedash/md_localized_text.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';
import 'package:rank_hub/src/model/musedash/md_player_data.dart';
import 'package:rank_hub/src/model/musedash/md_player_info.dart';
import 'package:rank_hub/src/model/musedash/md_player_record.dart';
import 'package:rank_hub/src/model/musedash/md_rank_history.dart';
import 'package:rank_hub/src/model/player.dart';

import 'src/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initHive();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PlayerAdapter());
  LxMaiDataAdapters.register();

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
