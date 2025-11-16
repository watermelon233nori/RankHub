import 'package:hive/hive.dart';
import 'package:rank_hub/src/core/database/secure_storage_services.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_genre.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class LxMaiLocal {
  late final Box<PlayerData> playerDataBox;
  late final Box<List<SongScore>> scoreBox;
  late final Box<SongInfo> songBox;
  late final Box<SongGenre> genreBox;
  late final Box<SongVersion> versionBox;
  late final Box<SongAlias> aliasBox;

  LxMaiLocal._();

  static Future<LxMaiLocal> init() async {
    final local = LxMaiLocal._();

    local.playerDataBox = await _openBox<PlayerData>('LxMaiPlayerData');
    local.scoreBox = await _openBox<List<SongScore>>('LxMaiRecords');
    local.songBox = await _openBox<SongInfo>('LxMaiCnSongs');
    local.genreBox = await _openBox<SongGenre>('LxMaiCnGenres');
    local.versionBox = await _openBox<SongVersion>('LxMaiCnVersions');
    local.aliasBox = await _openBox<SongAlias>('LxMaiCnAliases');

    return local;
  }

  static Future<Box<T>> _openBox<T>(String name) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box<T>(name);
    } else {
      return await Hive.openBox<T>(name);
    }
  }

  Future<String> getPlayerToken(String uuid) async {
    final secureStorage = SecureStorageServices();
    String? token = await secureStorage.read(key: 'token_$uuid');
    if (token == null) {
      throw Exception('玩家 Token 不存在');
    }
    return token;
  }

  Future<void> savePlayerData(PlayerData playerData, String uuid) async {
    await playerDataBox.put(uuid, playerData);
  }

  Future<void> saveSongScores(List<SongScore> scores, String uuid) async {
    await scoreBox.put(uuid, scores);
  }

  Future<void> saveSongInfo(List<SongInfo> songs) async {
    await songBox.clear();
    for (var song in songs) {
      await songBox.put(song.id, song);
    }
  }

  Future<void> saveSongGenre(List<SongGenre> genres) async {
    await genreBox.clear();
    for (var genre in genres) {
      await genreBox.put(genre.id, genre);
    }
  }

  Future<void> saveSongAlias(List<SongAlias> aliases) async {
    await aliasBox.clear();
    for (var alias in aliases) {
      await aliasBox.put(alias.songId, alias);
    }
  }

  Future<void> saveSongVersion(List<SongVersion> versions) async {
    await versionBox.clear();
    for (var version in versions) {
      await versionBox.put(version.id, version);
    }
  }

  Future<PlayerData?> getPlayerData(String uuid) async {
    return playerDataBox.get(uuid);
  }

  Future<List<PlayerData>> getPlayerDataList() async {
    return playerDataBox.values.toList();
  }

  Future<List<SongScore>> getSongScores(String uuid) async {
    return scoreBox.get(uuid) ?? [];
  }

  Future<List<SongInfo>> getSongInfo() async {
    return songBox.values.toList();
  }

  Future<List<SongGenre>> getSongGenre() async {
    return genreBox.values.toList();
  }

  Future<List<SongVersion>> getSongVersion() async {
    return versionBox.values.toList();
  }

  Future<List<SongAlias>> getSongAlias() async {
    return aliasBox.values.toList();
  }

  Future<void> clearCache() async {
    await playerDataBox.clear();
    await scoreBox.clear();
    await songBox.clear();
    await genreBox.clear();
    await versionBox.clear();
    await aliasBox.clear();
  }
}
