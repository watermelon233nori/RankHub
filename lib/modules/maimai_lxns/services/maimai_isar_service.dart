import 'package:isar_community/isar.dart';
import 'package:rank_hub/services/base_isar_service.dart';

// 导入 Maimai 数据模型
import 'package:rank_hub/models/maimai/player.dart';
import 'package:rank_hub/models/maimai/song.dart';
import 'package:rank_hub/models/maimai/collection.dart';
import 'package:rank_hub/models/maimai/score.dart';

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

  /// 批量保存曲目
  Future<void> saveSongs(List<Song> songs) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.songs.putAll(songs);
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

  /// 保存分类
  Future<void> saveGenres(List<Genre> genres) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.genres.putAll(genres);
    });
  }

  /// 获取所有分类
  Future<List<Genre>> getAllGenres() async {
    final isar = await db;
    return await isar.genres.where().findAll();
  }

  /// 保存版本信息
  Future<void> saveVersions(List<Version> versions) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.versions.putAll(versions);
    });
  }

  /// 获取所有版本
  Future<List<Version>> getAllVersions() async {
    final isar = await db;
    return await isar.versions.where().findAll();
  }

  /// 保存曲目别名
  Future<void> saveAliases(List<Alias> aliases) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.alias.putAll(aliases);
    });
  }

  /// 根据曲目 ID 获取别名
  Future<Alias?> getAliasBySongId(int songId) async {
    final isar = await db;
    return await isar.alias.filter().songIdEqualTo(songId).findFirst();
  }

  // ==================== 成绩相关操作 ====================

  /// 批量保存成绩
  Future<void> saveScores(List<Score> scores) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.scores.putAll(scores);
    });
  }

  /// 获取指定曲目的所有成绩
  Future<List<Score>> getScoresBySongId(int songId) async {
    final isar = await db;
    return await isar.scores.filter().songIdEqualTo(songId).findAll();
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

  /// 批量保存收藏品
  Future<void> saveCollections(List<MaimaiCollection> collections) async {
    print('💾 准备保存 ${collections.length} 个收藏品到数据库...');
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.maimaiCollections.putAll(collections);
    });
    print('✅ 成功保存 ${collections.length} 个收藏品');
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

  /// 保存收藏品分类
  Future<void> saveCollectionGenres(List<CollectionGenre> genres) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.collectionGenres.putAll(genres);
    });
  }

  /// 获取所有收藏品分类
  Future<List<CollectionGenre>> getAllCollectionGenres() async {
    final isar = await db;
    return await isar.collectionGenres.where().findAll();
  }
}
