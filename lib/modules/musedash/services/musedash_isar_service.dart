import 'package:rank_hub/services/base_isar_service.dart';
import 'package:rank_hub/models/musedash/musedash_album.dart';
import 'package:rank_hub/models/musedash/musedash_music.dart';
import 'package:rank_hub/models/musedash/musedash_score.dart';
import 'package:rank_hub/models/musedash/musedash_character.dart';
import 'package:rank_hub/models/musedash/musedash_elfin.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:isar_community/isar.dart';

/// MuseDash Isar 数据库服务
class MuseDashIsarService extends BaseIsarService {
  static MuseDashIsarService? _instance;

  static MuseDashIsarService get instance {
    _instance ??= MuseDashIsarService._();
    return _instance!;
  }

  MuseDashIsarService._();

  @override
  String get databaseName => 'musedash_data';

  @override
  List<CollectionSchema> get schemas => [
    MuseDashAlbumSchema,
    MuseDashMusicSchema,
    MuseDashScoreSchema,
    MuseDashCharacterSchema,
    MuseDashElfinSchema,
    MuseDashPlayerSchema,
  ]; // ========== 专辑操作 ==========

  /// 获取所有专辑
  Future<List<MuseDashAlbum>> getAllAlbums() async {
    final isar = await db;
    return await isar.museDashAlbums.where().findAll();
  }

  /// 根据 UID 获取专辑
  Future<MuseDashAlbum?> getAlbumByUid(String uid) async {
    final isar = await db;
    return await isar.museDashAlbums.filter().uidEqualTo(uid).findFirst();
  }

  /// 保存专辑列表（合并模式，保留现有 ID）
  Future<void> saveAlbums(List<MuseDashAlbum> albums) async {
    final isar = await db;
    await isar.writeTxn(() async {
      for (final album in albums) {
        // 尝试查找已存在的专辑
        final existing = await isar.museDashAlbums
            .filter()
            .uidEqualTo(album.uid)
            .findFirst();

        if (existing != null) {
          // 保留原有的 ID，更新其他字段
          album.id = existing.id;
        }

        await isar.museDashAlbums.put(album);
      }
    });
  }

  /// 清空所有专辑
  Future<void> clearAlbums() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashAlbums.clear();
    });
  }

  // ========== 音乐操作 ==========

  /// 获取所有音乐
  Future<List<MuseDashMusic>> getAllMusic() async {
    final isar = await db;
    return await isar.museDashMusics.where().findAll();
  }

  /// 根据 UID 获取音乐
  Future<MuseDashMusic?> getMusicByUid(String uid) async {
    final isar = await db;
    return await isar.museDashMusics.filter().uidEqualTo(uid).findFirst();
  }

  /// 根据专辑 UID 获取音乐列表
  Future<List<MuseDashMusic>> getMusicByAlbumUid(String albumUid) async {
    final isar = await db;
    return await isar.museDashMusics
        .filter()
        .albumUidEqualTo(albumUid)
        .findAll();
  }

  /// 搜索音乐（按名称或作者）
  Future<List<MuseDashMusic>> searchMusic(String keyword) async {
    final isar = await db;
    final lowerKeyword = keyword.toLowerCase();

    return await isar.museDashMusics
        .filter()
        .nameContains(lowerKeyword, caseSensitive: false)
        .or()
        .authorContains(lowerKeyword, caseSensitive: false)
        .findAll();
  }

  /// 按难度筛选音乐
  Future<List<MuseDashMusic>> filterMusicByDifficulty(int minDifficulty) async {
    final allMusic = await getAllMusic();
    return allMusic
        .where((music) => music.getMaxDifficulty() >= minDifficulty)
        .toList();
  }

  /// 保存音乐列表（合并模式，保留现有 ID）
  Future<void> saveMusic(List<MuseDashMusic> musicList) async {
    final isar = await db;
    await isar.writeTxn(() async {
      for (final music in musicList) {
        // 尝试查找已存在的音乐
        final existing = await isar.museDashMusics
            .filter()
            .uidEqualTo(music.uid)
            .findFirst();

        if (existing != null) {
          // 保留原有的 ID，更新其他字段
          music.id = existing.id;
        }

        await isar.museDashMusics.put(music);
      }
    });
  }

  /// 清空所有音乐
  Future<void> clearMusic() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashMusics.clear();
    });
  }

  // ========== 成绩操作 ==========

  /// 获取指定用户的所有成绩
  Future<List<MuseDashScore>> getScoresByUserUuid(String userUuid) async {
    final isar = await db;
    return await isar.museDashScores
        .filter()
        .userUuidEqualTo(userUuid)
        .findAll();
  }

  /// 获取指定用户指定音乐的成绩
  Future<List<MuseDashScore>> getScoresByUserAndMusic(
    String userUuid,
    String musicUid,
  ) async {
    final isar = await db;
    return await isar.museDashScores
        .filter()
        .userUuidEqualTo(userUuid)
        .and()
        .musicUidEqualTo(musicUid)
        .findAll();
  }

  /// 保存成绩列表
  Future<void> saveScores(List<MuseDashScore> scores) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashScores.putAll(scores);
    });
  }

  /// 清空所有成绩
  Future<void> clearScores() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashScores.clear();
    });
  }

  /// 清空指定用户的成绩
  Future<void> clearScoresByUserUuid(String userUuid) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashScores.filter().userUuidEqualTo(userUuid).deleteAll();
    });
  }

  // ========== 统计信息 ==========

  /// 获取专辑数量
  Future<int> getAlbumCount() async {
    final isar = await db;
    return await isar.museDashAlbums.count();
  }

  /// 获取音乐数量
  Future<int> getMusicCount() async {
    final isar = await db;
    return await isar.museDashMusics.count();
  }

  /// 获取成绩数量
  Future<int> getScoreCount(String userUuid) async {
    final isar = await db;
    return await isar.museDashScores.filter().userUuidEqualTo(userUuid).count();
  }

  // ========== 角色操作 ==========

  /// 获取所有角色
  Future<List<MuseDashCharacter>> getAllCharacters() async {
    final isar = await db;
    return await isar.museDashCharacters.where().sortByCharacterId().findAll();
  }

  /// 根据角色 ID 获取角色
  Future<MuseDashCharacter?> getCharacterById(int characterId) async {
    final isar = await db;
    return await isar.museDashCharacters
        .filter()
        .characterIdEqualTo(characterId)
        .findFirst();
  }

  /// 保存角色列表（合并模式，保留现有 ID）
  Future<void> saveCharacters(List<MuseDashCharacter> characters) async {
    final isar = await db;
    await isar.writeTxn(() async {
      for (final character in characters) {
        final existing = await isar.museDashCharacters
            .filter()
            .characterIdEqualTo(character.characterId)
            .findFirst();

        if (existing != null) {
          character.id = existing.id;
        }

        await isar.museDashCharacters.put(character);
      }
    });
  }

  /// 清空所有角色
  Future<void> clearCharacters() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashCharacters.clear();
    });
  }

  // ========== 精灵操作 ==========

  /// 获取所有精灵
  Future<List<MuseDashElfin>> getAllElfins() async {
    final isar = await db;
    return await isar.museDashElfins.where().sortByElfinId().findAll();
  }

  /// 根据精灵 ID 获取精灵
  Future<MuseDashElfin?> getElfinById(int elfinId) async {
    final isar = await db;
    return await isar.museDashElfins
        .filter()
        .elfinIdEqualTo(elfinId)
        .findFirst();
  }

  /// 保存精灵列表（合并模式，保留现有 ID）
  Future<void> saveElfins(List<MuseDashElfin> elfins) async {
    final isar = await db;
    await isar.writeTxn(() async {
      for (final elfin in elfins) {
        final existing = await isar.museDashElfins
            .filter()
            .elfinIdEqualTo(elfin.elfinId)
            .findFirst();

        if (existing != null) {
          elfin.id = existing.id;
        }

        await isar.museDashElfins.put(elfin);
      }
    });
  }

  /// 清空所有精灵
  Future<void> clearElfins() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.museDashElfins.clear();
    });
  }

  /// 获取角色数量
  Future<int> getCharacterCount() async {
    final isar = await db;
    return await isar.museDashCharacters.count();
  }

  /// 获取精灵数量
  Future<int> getElfinCount() async {
    final isar = await db;
    return await isar.museDashElfins.count();
  }

  // ========== 玩家操作 ==========

  /// 获取玩家信息
  Future<MuseDashPlayer?> getPlayerByUuid(String userUuid) async {
    final isar = await db;
    return await isar.museDashPlayers
        .filter()
        .userUuidEqualTo(userUuid)
        .findFirst();
  }

  /// 保存玩家信息（合并模式）
  Future<void> savePlayer(MuseDashPlayer player) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final existing = await isar.museDashPlayers
          .filter()
          .userUuidEqualTo(player.userUuid)
          .findFirst();

      if (existing != null) {
        player.id = existing.id;
      }

      await isar.museDashPlayers.put(player);
    });
  }

  /// 获取玩家的所有成绩（按准确率排序）
  Future<List<MuseDashScore>> getPlayerScoresSortedByAcc(
    String userUuid,
  ) async {
    final isar = await db;
    final scores = await isar.museDashScores
        .filter()
        .userUuidEqualTo(userUuid)
        .findAll();

    // 按准确率降序排序
    scores.sort((a, b) {
      final accA = a.acc ?? 0;
      final accB = b.acc ?? 0;
      return accB.compareTo(accA);
    });

    return scores;
  }

  /// 获取玩家的 Best N 成绩
  Future<List<MuseDashScore>> getPlayerBestScores(
    String userUuid,
    int count,
  ) async {
    final scores = await getPlayerScoresSortedByAcc(userUuid);
    return scores.take(count).toList();
  }
}
