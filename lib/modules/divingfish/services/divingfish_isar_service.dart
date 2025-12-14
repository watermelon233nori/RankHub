import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/divingfish/divingfish_song.dart';
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
  List<CollectionSchema<dynamic>> get schemas => [DivingFishSongSchema];

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
}
