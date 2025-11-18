import 'package:isar_community/isar.dart';
import 'package:rank_hub/services/base_isar_service.dart';

// 导入 Maimai 数据模型
import 'package:rank_hub/models/maimai/player.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/score.dart';
import 'package:rank_hub/models/maimai/enums/level_index.dart';
import 'package:rank_hub/models/maimai/enums/song_type.dart';

/// Maimai 游戏数据库服务
class MaimaiIsarService extends BaseIsarService {
  static MaimaiIsarService? _instance;

  MaimaiIsarService._();

  /// 获取单例实例
  static MaimaiIsarService get instance {
    _instance ??= MaimaiIsarService._();
    return _instance!;
  }

  @override
  String get databaseName => 'maimai_db';

  @override
  List<CollectionSchema> get schemas => [
    // 玩家相关
    PlayerSchema,
    RatingTrendSchema,

    // 曲目相关
    SongSchema,
    GenreSchema,
    VersionSchema,
    AliasSchema,

    // 成绩相关
    ScoreSchema,
    SimpleScoreSchema,

    // 收藏品相关
    MaimaiCollectionSchema,
    CollectionGenreSchema,
  ];

  // ==================== 玩家相关操作 ====================

  /// 保存或更新玩家信息
  Future<void> savePlayer(Player player) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.players.put(player);
    });
  }

  /// 根据好友码获取玩家
  Future<Player?> getPlayerByFriendCode(int friendCode) async {
    final isar = await db;
    return await isar.players
        .filter()
        .friendCodeEqualTo(friendCode)
        .findFirst();
  }

  /// 获取所有玩家
  Future<List<Player>> getAllPlayers() async {
    final isar = await db;
    return await isar.players.where().findAll();
  }

  /// 删除玩家
  Future<void> deletePlayer(Id id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.players.delete(id);
    });
  }

  /// 保存 Rating 趋势
  Future<void> saveRatingTrend(RatingTrend trend) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.ratingTrends.put(trend);
    });
  }

  /// 获取指定日期范围的 Rating 趋势
  Future<List<RatingTrend>> getRatingTrends({
    required String startDate,
    required String endDate,
  }) async {
    final isar = await db;
    return await isar.ratingTrends
        .filter()
        .dateBetween(startDate, endDate)
        .sortByDate()
        .findAll();
  }

  // ==================== 曲目相关操作 ====================

  /// 批量保存曲目（智能合并）
  Future<void> saveSongs(List<Song> songs) async {
    if (songs.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final song in songs) {
        // 检查是否已存在
        final existing = await isar.songs
            .filter()
            .songIdEqualTo(song.songId)
            .findFirst();

        if (existing != null) {
          // 合并数据：保留 Isar ID，更新其他字段
          song.id = existing.id;
        }

        await isar.songs.put(song);
      }
    });
  }

  /// 根据曲目 ID 获取曲目
  Future<Song?> getSongById(int songId) async {
    final isar = await db;
    return await isar.songs.filter().songIdEqualTo(songId).findFirst();
  }

  /// 搜索曲目（按标题）
  Future<List<Song>> searchSongsByTitle(String keyword) async {
    final isar = await db;
    return await isar.songs
        .filter()
        .titleContains(keyword, caseSensitive: false)
        .findAll();
  }

  /// 获取指定分类的曲目
  Future<List<Song>> getSongsByGenre(String genre) async {
    final isar = await db;
    return await isar.songs.filter().genreEqualTo(genre).findAll();
  }

  /// 获取所有曲目
  Future<List<Song>> getAllSongs() async {
    final isar = await db;
    return await isar.songs.where().findAll();
  }

  /// 保存分类（智能合并）
  Future<void> saveGenres(List<Genre> genres) async {
    if (genres.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final genre in genres) {
        // 检查是否已存在
        final existing = await isar.genres
            .filter()
            .genreEqualTo(genre.genre)
            .findFirst();

        if (existing != null) {
          genre.id = existing.id;
        }

        await isar.genres.put(genre);
      }
    });
  }

  /// 获取所有分类
  Future<List<Genre>> getAllGenres() async {
    final isar = await db;
    return await isar.genres.where().findAll();
  }

  /// 保存版本信息（智能合并）
  Future<void> saveVersions(List<Version> versions) async {
    if (versions.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final version in versions) {
        // 检查是否已存在
        final existing = await isar.versions
            .filter()
            .versionEqualTo(version.version)
            .findFirst();

        if (existing != null) {
          version.id = existing.id;
        }

        await isar.versions.put(version);
      }
    });
  }

  /// 获取所有版本
  Future<List<Version>> getAllVersions() async {
    final isar = await db;
    return await isar.versions.where().findAll();
  }

  /// 保存曲目别名（智能合并）
  Future<void> saveAliases(List<Alias> aliases) async {
    if (aliases.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final alias in aliases) {
        // 检查是否已存在
        final existing = await isar.alias
            .filter()
            .songIdEqualTo(alias.songId)
            .findFirst();

        if (existing != null) {
          alias.id = existing.id;
        }

        await isar.alias.put(alias);
      }
    });
  }

  /// 根据曲目 ID 获取别名
  Future<Alias?> getAliasBySongId(int songId) async {
    final isar = await db;
    return await isar.alias.filter().songIdEqualTo(songId).findFirst();
  }

  // ==================== 成绩相关操作 ====================

  /// 批量保存成绩（智能合并）
  Future<void> saveScores(List<Score> scores) async {
    if (scores.isEmpty) return;

    print('💾 准备保存 ${scores.length} 条成绩到数据库...');
    final isar = await db;

    await isar.writeTxn(() async {
      int newCount = 0;
      int updateCount = 0;

      for (final score in scores) {
        // 检查是否已存在（通过曲目ID、难度和类型精确匹配）
        final existing = await isar.scores
            .filter()
            .songIdEqualTo(score.songId)
            .and()
            .levelIndexEqualTo(score.levelIndex)
            .and()
            .typeEqualTo(score.type)
            .findFirst();

        if (existing != null) {
          // 已存在，保留 Isar ID 并更新数据
          score.id = existing.id;
          updateCount++;
        } else {
          // 新数据
          newCount++;
        }

        await isar.scores.put(score);
      }

      print('✅ 成功保存成绩: 新增 $newCount 条, 更新 $updateCount 条');
    });
  }

  /// 获取指定曲目的所有成绩
  Future<List<Score>> getScoresBySongId(int songId) async {
    final isar = await db;
    return await isar.scores.filter().songIdEqualTo(songId).findAll();
  }

  /// 根据曲目ID、难度和类型获取成绩
  Future<Score?> getScoreBySongIdAndDifficulty({
    required int songId,
    required LevelIndex levelIndex,
    required SongType type,
  }) async {
    final isar = await db;
    return await isar.scores
        .filter()
        .songIdEqualTo(songId)
        .and()
        .levelIndexEqualTo(levelIndex)
        .and()
        .typeEqualTo(type)
        .findFirst();
  }

  /// 获取所有成绩，按 DX Rating 降序
  Future<List<Score>> getAllScoresSortedByRating() async {
    final isar = await db;
    return await isar.scores.where().sortByDxRatingDesc().findAll();
  }

  /// 获取 Best 50 成绩
  Future<List<Score>> getBest50Scores() async {
    final isar = await db;
    return await isar.scores.where().sortByDxRatingDesc().limit(50).findAll();
  }

  /// 删除成绩
  Future<void> deleteScore(Id id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.scores.delete(id);
    });
  }

  /// 保存简化成绩
  Future<void> saveSimpleScores(List<SimpleScore> scores) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.simpleScores.putAll(scores);
    });
  }

  /// 获取所有简化成绩
  Future<List<SimpleScore>> getAllSimpleScores() async {
    final isar = await db;
    return await isar.simpleScores.where().findAll();
  }

  // ==================== 收藏品相关操作 ====================

  /// 批量保存收藏品（智能合并，避免 ID 冲突）
  Future<void> saveCollections(List<MaimaiCollection> collections) async {
    if (collections.isEmpty) return;

    print('💾 准备保存 ${collections.length} 个收藏品到数据库...');
    final isar = await db;

    await isar.writeTxn(() async {
      int newCount = 0;
      int updateCount = 0;

      for (final collection in collections) {
        // 检查是否已存在（通过类型和收藏品ID精确匹配）
        final existing = await isar.maimaiCollections
            .filter()
            .collectionTypeEqualTo(collection.collectionType)
            .and()
            .collectionIdEqualTo(collection.collectionId)
            .findFirst();

        if (existing != null) {
          // 已存在，保留 Isar ID 并更新数据
          collection.id = existing.id;
          updateCount++;
        } else {
          // 新数据
          newCount++;
        }

        await isar.maimaiCollections.put(collection);
      }

      print('✅ 成功保存收藏品: 新增 $newCount 个, 更新 $updateCount 个');
    });
  }

  /// 根据收藏品 ID 获取收藏品（可能有多个不同类型的同 ID 收藏品）
  Future<MaimaiCollection?> getCollectionById(int collectionId) async {
    final isar = await db;
    return await isar.maimaiCollections
        .filter()
        .collectionIdEqualTo(collectionId)
        .findFirst();
  }

  /// 根据收藏品类型和 ID 获取收藏品（精确查询）
  Future<MaimaiCollection?> getCollectionByTypeAndId(
    String collectionType,
    int collectionId,
  ) async {
    final isar = await db;
    return await isar.maimaiCollections
        .filter()
        .collectionTypeEqualTo(collectionType)
        .and()
        .collectionIdEqualTo(collectionId)
        .findFirst();
  }

  /// 根据类型获取收藏品列表
  Future<List<MaimaiCollection>> getCollectionsByType(
    String collectionType,
  ) async {
    final isar = await db;
    return await isar.maimaiCollections
        .filter()
        .collectionTypeEqualTo(collectionType)
        .findAll();
  }

  /// 获取指定分类的收藏品
  Future<List<MaimaiCollection>> getCollectionsByGenre(String genre) async {
    final isar = await db;
    return await isar.maimaiCollections.filter().genreEqualTo(genre).findAll();
  }

  /// 获取所有收藏品
  Future<List<MaimaiCollection>> getAllCollections() async {
    final isar = await db;
    final collections = await isar.maimaiCollections.where().findAll();
    print('📊 数据库查询收藏品: 共 ${collections.length} 个');
    return collections;
  }

  /// 清空所有收藏品（用于数据迁移）
  Future<void> clearAllCollections() async {
    print('🗑️ 清空所有收藏品数据...');
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.maimaiCollections.clear();
    });
    print('✅ 收藏品数据已清空');
  }

  /// 保存收藏品分类（智能合并）
  Future<void> saveCollectionGenres(List<CollectionGenre> genres) async {
    if (genres.isEmpty) return;

    final isar = await db;
    await isar.writeTxn(() async {
      for (final genre in genres) {
        // 检查是否已存在
        final existing = await isar.collectionGenres
            .filter()
            .genreIdEqualTo(genre.genreId)
            .findFirst();

        if (existing != null) {
          genre.id = existing.id;
        }

        await isar.collectionGenres.put(genre);
      }
    });
  }

  /// 获取所有收藏品分类
  Future<List<CollectionGenre>> getAllCollectionGenres() async {
    final isar = await db;
    return await isar.collectionGenres.where().findAll();
  }
}
