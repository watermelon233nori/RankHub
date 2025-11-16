import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_local.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_remote.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_repository.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_song_filter_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lx_mai_provider.g.dart';

@riverpod
Future<LxMaiRepository> lxMaiRepository(Ref ref) async {
  final lxLocal = await LxMaiLocal.init();

  return LxMaiRepository(
    lxLocal,
    LxMaiRemote(),
  );
}

@riverpod
Future<List<SongScore>> filteredRecords(
    Ref ref, List<SongScore> records, MaiSongFilterData filterData) async {
  final repository = await ref.watch(lxMaiRepositoryProvider.future);
  final songs = await repository.getSongList();

  return LxMaiService().filterRecords(songs, records, filterData);
}

@riverpod
Future<List<SongScore>> getB15Records(Ref ref, String uuid) async {
  final repository = await ref.watch(lxMaiRepositoryProvider.future);
  final records = await repository.getRecordList(uuid);
  final versions = await repository.getSongVersion();

  return (await Future.wait(records.map((record) async {
    final songInfo = await repository.getSongById(record.id);
    return LxMaiService().isCurrentVersionSong(versions, songInfo.version)
        ? record
        : null;
  })))
      .whereType<SongScore>()
      .take(15)
      .toList();
}

@riverpod
Future<List<SongScore>> getB35Records(Ref ref, String uuid) async {
  final repository = await ref.watch(lxMaiRepositoryProvider.future);
  final records = await repository.getRecordList(uuid);
  final versions = await repository.getSongVersion();

  return (await Future.wait(records.map((record) async {
    final songInfo = await repository.getSongById(record.id);
    return LxMaiService().isCurrentVersionSong(versions, songInfo.version)
        ? null
        : record;
  })))
      .whereType<SongScore>()
      .take(35)
      .toList();
}

@riverpod
Future<
    ({
      PlayerData player,
      List<SongScore> b15Records,
      List<SongScore> b35Records,
      int b15Rating,
      int b35Rating,
    })> getB50Data(Ref ref, String uuid) async {
  final repository = await ref.watch(lxMaiRepositoryProvider.future);
  final player = await repository.getPlayerData(uuid);
  final b15Records = await ref.watch(getB15RecordsProvider(uuid).future);
  final b35Records = await ref.watch(getB35RecordsProvider(uuid).future);
  final b15Rating = LxMaiService().calcTotalDXRating(b15Records);
  final b35Rating = LxMaiService().calcTotalDXRating(b35Records);

  return (
    player: player,
    b15Records: b15Records,
    b35Records: b35Records,
    b15Rating: b15Rating,
    b35Rating: b35Rating
  );
}

@riverpod
Future<PlayerData> playerData(Ref ref, String uuid) async {
  final repository = await ref.watch(lxMaiRepositoryProvider.future);
  return await repository.getPlayerData(uuid);
}
