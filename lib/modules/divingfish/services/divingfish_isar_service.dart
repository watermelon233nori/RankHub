import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/divingfish/divingfish_alias.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';
import 'package:rank_hub/models/divingfish/divingfish_score.dart';
import 'package:rank_hub/services/base_isar_service.dart';

/// 水鱼查分器 Isar 数据库服务
class DivingFishIsarService extends BaseIsarService {
  static final DivingFishIsarService _instance =
      DivingFishIsarService._internal();
  factory DivingFishIsarService() => _instance;
  static DivingFishIsarService get instance => _instance;

  DivingFishIsarService._internal();

  @override
  String get databaseName => 'divingfish';

  @override
  List<CollectionSchema<dynamic>> get schemas => [
    DivingFishAliasSchema,
    DivingFishSongSchema,
    DivingFishScoreSchema,
    DivingFishPlayerDataSchema,
  ];

  // ========== 别名操作 ==========

  /// 保存曲目别名（智能合并）
  Future<void> saveAliases(List<DivingFishAlias> aliases) async {
    if (aliases.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final alias in aliases) {
        final existing = await isar.divingFishAlias
            .filter()
            .songIdEqualTo(alias.songId)
            .findFirst();

        if (existing != null) {
          alias.id = existing.id;
        }

        await isar.divingFishAlias.put(alias);
      }
    });
  }

  /// 获取所有别名
  Future<List<DivingFishAlias>> getAllAliases() async {
    final isar = await db;
    return await isar.divingFishAlias.where().findAll();
  }

  /// 根据曲目 ID 获取别名
  Future<DivingFishAlias?> getAliasBySongId(int songId) async {
    final isar = await db;
    return await isar.divingFishAlias
        .filter()
        .songIdEqualTo(songId)
        .findFirst();
  }

  /// 清空所有别名
  Future<void> clearAllAliases() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.divingFishAlias.clear();
    });
  }

  // ========== 曲目操作 ==========

  /// 保存曲目列表（智能合并）
  Future<void> saveSongs(List<DivingFishSong> songs) async {
    if (songs.isEmpty) return;

    print('💾 准备保存 ${songs.length} 首曲目到数据库...');
    final isar = await db;

    await isar.writeTxn(() async {
      int newCount = 0;
      int updateCount = 0;

      for (final song in songs) {
        // 检查是否已存在（通过 songId 唯一索引）
        final existing = await isar.divingFishSongs
            .filter()
            .songIdEqualTo(song.songId)
            .findFirst();

        if (existing != null) {
          // 已存在，保留 Isar ID 并更新数据
          song.id = existing.id;
          updateCount++;
        } else {
          // 新数据
          newCount++;
        }

        await isar.divingFishSongs.put(song);
      }

      print('✅ 成功保存曲目: 新增 $newCount 首, 更新 $updateCount 首');
    });
  }

  /// 获取所有曲目
  Future<List<DivingFishSong>> getAllSongs() async {
    final isar = await db;
    return await isar.divingFishSongs.where().findAll();
  }

  /// 根据 ID 获取曲目
  Future<DivingFishSong?> getSongById(int songId) async {
    final isar = await db;
    return await isar.divingFishSongs
        .filter()
        .songIdEqualTo(songId)
        .findFirst();
  }

  /// 搜索曲目
  Future<List<DivingFishSong>> searchSongs(String keyword) async {
    final isar = await db;

    return await isar.divingFishSongs
        .filter()
        .titleContains(keyword, caseSensitive: false)
        .or()
        .basicInfo((q) => q.artistContains(keyword, caseSensitive: false))
        .or()
        .basicInfo((q) => q.genreContains(keyword, caseSensitive: false))
        .findAll();
  }

  /// 按类型筛选曲目
  Future<List<DivingFishSong>> getSongsByType(String type) async {
    final isar = await db;
    return await isar.divingFishSongs.filter().typeEqualTo(type).findAll();
  }

  /// 按流派筛选曲目
  Future<List<DivingFishSong>> getSongsByGenre(String genre) async {
    final isar = await db;
    return await isar.divingFishSongs
        .filter()
        .basicInfo((q) => q.genreEqualTo(genre))
        .findAll();
  }

  /// 获取所有流派
  Future<List<String>> getAllGenres() async {
    final isar = await db;
    final songs = await isar.divingFishSongs.where().findAll();
    final genres = songs
        .map((s) => s.basicInfo?.genre ?? '')
        .where((g) => g.isNotEmpty)
        .toSet()
        .toList();
    genres.sort();
    return genres;
  }

  /// 获取所有版本
  Future<List<String>> getAllVersions() async {
    final isar = await db;
    final songs = await isar.divingFishSongs.where().findAll();
    final versions = songs
        .map((s) => s.basicInfo?.from ?? '')
        .where((v) => v.isNotEmpty)
        .toSet()
        .toList();
    versions.sort();
    return versions;
  }

  /// 清空所有曲目
  Future<void> clearAllSongs() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.divingFishSongs.clear();
    });
  }

  /// 获取曲目总数
  Future<int> getSongCount() async {
    final isar = await db;
    return await isar.divingFishSongs.count();
  }

  // ========== 成绩操作 ==========

  /// 保存成绩列表
  Future<void> saveScores(List<DivingFishScore> scores) async {
    if (scores.isEmpty) return;

    print('💾 准备保存 ${scores.length} 条成绩到数据库...');
    final isar = await db;

    await isar.writeTxn(() async {
      int newCount = 0;
      int updateCount = 0;

      for (final score in scores) {
        // 检查是否已存在（通过复合索引）
        final existing = await isar.divingFishScores
            .filter()
            .songIdEqualTo(score.songId)
            .and()
            .levelIndexEqualTo(score.levelIndex)
            .and()
            .typeEqualTo(score.type)
            .findFirst();

        if (existing != null) {
          score.id = existing.id;
          updateCount++;
        } else {
          newCount++;
        }

        await isar.divingFishScores.put(score);
      }

      print('✅ 成功保存成绩: 新增 $newCount 条, 更新 $updateCount 条');
    });
  }

  /// 获取所有成绩
  Future<List<DivingFishScore>> getAllScores() async {
    final isar = await db;
    return await isar.divingFishScores.where().findAll();
  }

  /// 根据曲目 ID 获取成绩
  Future<List<DivingFishScore>> getScoresBySongId(int songId) async {
    final isar = await db;
    return await isar.divingFishScores.filter().songIdEqualTo(songId).findAll();
  }

  /// 获取成绩总数
  Future<int> getScoreCount() async {
    final isar = await db;
    return await isar.divingFishScores.count();
  }

  /// 清空所有成绩
  Future<void> clearAllScores() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.divingFishScores.clear();
    });
  }

  // ========== 玩家信息操作 ==========

  /// 保存玩家信息
  Future<void> savePlayerData(DivingFishPlayerData playerData) async {
    print('💾 保存玩家信息: ${playerData.nickname}');
    final isar = await db;

    await isar.writeTxn(() async {
      // 查找已存在的玩家信息
      final existing = await isar.divingFishPlayerDatas
          .filter()
          .usernameEqualTo(playerData.username)
          .findFirst();

      if (existing != null) {
        playerData.id = existing.id;
      }

      await isar.divingFishPlayerDatas.put(playerData);
    });

    print('✅ 成功保存玩家信息');
  }

  /// 获取玩家信息（按用户名）
  Future<DivingFishPlayerData?> getPlayerData(String username) async {
    final isar = await db;
    return await isar.divingFishPlayerDatas
        .filter()
        .usernameEqualTo(username)
        .findFirst();
  }

  /// 获取最近更新的玩家信息
  Future<DivingFishPlayerData?> getLatestPlayerData() async {
    final isar = await db;
    final players = await isar.divingFishPlayerDatas.where().findAll();
    if (players.isEmpty) return null;

    // 按最后更新时间排序，返回最新的
    players.sort((a, b) {
      if (a.lastUpdated == null && b.lastUpdated == null) return 0;
      if (a.lastUpdated == null) return 1;
      if (b.lastUpdated == null) return -1;
      return b.lastUpdated!.compareTo(a.lastUpdated!);
    });

    return players.first;
  }
}
