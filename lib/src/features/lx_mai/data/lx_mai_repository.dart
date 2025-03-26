import 'package:rank_hub/src/core/database/hive_services.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_local.dart';
import 'package:rank_hub/src/features/lx_mai/data/lx_mai_remote.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class LxMaiRepository {
  static const scoreCacheDuration = Duration(hours: 1);
  static const dataCacheDuration = Duration(days: 1);

  final LxMaiLocal _local;
  final LxMaiRemote _remote;

  LxMaiRepository(this._local, this._remote);

  Future<PlayerData> getPlayerData(String uuid) async {
    PlayerData? playerData = await _local.getPlayerData(uuid);

    bool isCacheValid = await HiveServices.isCacheValid(
      'PlayerDataCacheTime_$uuid',
      dataCacheDuration,
    );

    if (playerData == null || !isCacheValid) {
      await refreshPlayerData(uuid);
      playerData = await _local.getPlayerData(uuid);
      if (playerData == null) {
        throw Exception('玩家数据不存在');
      }
    }

    return playerData;
  }

  Future<List<PlayerData>> getPlayerDataList() async {
    return _local.getPlayerDataList();
  }

  Future<void> refreshPlayerData(String uuid) async {
    final token = await _local.getPlayerToken(uuid);
    final playerData = await _remote.fetchPlayerData(token);
    await _local.savePlayerData(playerData, uuid);
  }

  Future<List<SongScore>> getRecordList(String uuid) async {
    List<SongScore> recordList = await _local.getSongScores(uuid);

    bool isCacheValid = await HiveServices.isCacheValid(
      'SongScoreCacheTime_$uuid',
      scoreCacheDuration,
    );

    if (recordList.isEmpty || !isCacheValid) {
      await refreshRecordList(uuid);
      recordList = await _local.getSongScores(uuid);
    }

    return recordList;
  }

  Future<void> refreshRecordList(String uuid) async {
    final token = await _local.getPlayerToken(uuid);
    final recordList = await _remote.fetchRecords(token);
    await _local.saveSongScores(recordList, uuid);
  }

  Future<List<SongInfo>> getSongList() async {
    List<SongInfo> songList = await _local.getSongInfo();

    bool isCacheValid = await _isSongDataCacheValid();

    if (songList.isEmpty || !isCacheValid) {
      await refreshSongData();
      songList = await _local.getSongInfo();
    }

    return songList;
  }

  Future<SongInfo> getSongById(int id) async {
    SongInfo song = await _remote.fetchSongById(id);

    return song;
  }

  Future<List<SongGenre>> getSongGenre() async {
    List<SongGenre> songGenre = await _local.getSongGenre();

    bool isCacheValid = await _isSongDataCacheValid();

    if (songGenre.isEmpty || !isCacheValid) {
      await refreshSongData();
      songGenre = await _local.getSongGenre();
    }

    return songGenre;
  }

  Future<SongGenre> getSongGenreById(int id) async {
    SongGenre songGenre = await getSongGenre()
        .then((value) => value.firstWhere((element) => element.id == id));

    return songGenre;
  }

  Future<List<SongVersion>> getSongVersion() async {
    List<SongVersion> songVersion = await _local.getSongVersion();

    bool isCacheValid = await _isSongDataCacheValid();

    if (songVersion.isEmpty || !isCacheValid) {
      await refreshSongData();
      songVersion = await _local.getSongVersion();
    }

    return songVersion;
  }

  Future<SongVersion> getSongVersionById(int id) async {
    SongVersion songVersion = await getSongVersion()
        .then((value) => value.firstWhere((element) => element.id == id));

    return songVersion;
  }

  Future<List<SongAlias>> getSongAlias() async {
    List<SongAlias> songAlias = await _local.getSongAlias();

    bool isCacheValid = await HiveServices.isCacheValid(
      'LxMaiSongAliasCacheTime',
      dataCacheDuration,
    );

    if (songAlias.isEmpty || !isCacheValid) {
      await refreshSongAlias();
      songAlias = await _local.getSongAlias();
    }

    return songAlias;
  }

  Future<void> refreshSongAlias() async {
    final data = await _remote.fetchSongAlias();
    await _local.saveSongAlias(data);
  }

  Future<void> refreshSongData() async {
    final data = await _remote.fetchSongData();
    await _local.saveSongInfo(data.songData);
    await _local.saveSongGenre(data.genresData);
    await _local.saveSongVersion(data.versionData);
  }

  Future<void> clearCache() async {
    await _local.clearCache();
  }

  Future<bool> _isSongDataCacheValid() async {
    return HiveServices.isCacheValid(
      'LxMaiCnSongDataCacheTime',
      dataCacheDuration,
    );
  }
}
