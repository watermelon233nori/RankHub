import 'package:isar_community/isar.dart';
import 'package:rank_hub/services/base_isar_service.dart';
import 'package:rank_hub/models/phigros/song.dart';
import 'package:rank_hub/models/phigros/collection.dart';
import 'package:rank_hub/models/phigros/avatar.dart';

/// Phigros Isar 数据库服务
class PhigrosIsarService extends BaseIsarService {
  static final PhigrosIsarService _instance = PhigrosIsarService._internal();
  factory PhigrosIsarService() => _instance;
  static PhigrosIsarService get instance => _instance;

  PhigrosIsarService._internal();

  @override
  String get databaseName => 'phigros';

  @override
  List<CollectionSchema> get schemas => [
        PhigrosSongSchema,
        PhigrosCollectionSchema,
        PhigrosAvatarSchema,
      ];

  // ========== 歌曲操作 ==========

  /// 保存歌曲列表
  Future<void> saveSongs(List<PhigrosSong> songs) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.phigrosSongs.putAll(songs);
    });
    print('💾 保存了 ${songs.length} 首歌曲到数据库');
  }

  /// 获取所有歌曲
  Future<List<PhigrosSong>> getAllSongs() async {
    final isar = await db;
    return await isar.phigrosSongs.where().findAll();
  }

  /// 根据ID获取歌曲
  Future<PhigrosSong?> getSongById(String songId) async {
    final isar = await db;
    return await isar.phigrosSongs
        .filter()
        .songIdEqualTo(songId)
        .findFirst();
  }

  /// 根据名称搜索歌曲
  Future<List<PhigrosSong>> searchSongsByName(String keyword) async {
    final isar = await db;
    return await isar.phigrosSongs
        .filter()
        .nameContains(keyword, caseSensitive: false)
        .or()
        .composerContains(keyword, caseSensitive: false)
        .findAll();
  }

  /// 获取歌曲总数
  Future<int> getSongCount() async {
    final isar = await db;
    return await isar.phigrosSongs.count();
  }

  // ========== 收藏品操作 ==========

  /// 保存收藏品列表
  Future<void> saveCollections(List<PhigrosCollection> collections) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.phigrosCollections.putAll(collections);
    });
    print('💾 保存了 ${collections.length} 个收藏品到数据库');
  }

  /// 获取所有收藏品
  Future<List<PhigrosCollection>> getAllCollections() async {
    final isar = await db;
    return await isar.phigrosCollections.where().findAll();
  }

  /// 根据ID获取收藏品
  Future<PhigrosCollection?> getCollectionById(String collectionId) async {
    final isar = await db;
    return await isar.phigrosCollections
        .filter()
        .collectionIdEqualTo(collectionId)
        .findFirst();
  }

  /// 获取收藏品总数
  Future<int> getCollectionCount() async {
    final isar = await db;
    return await isar.phigrosCollections.count();
  }

  // ========== 头像操作 ==========

  /// 保存头像列表
  Future<void> saveAvatars(List<PhigrosAvatar> avatars) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.phigrosAvatars.putAll(avatars);
    });
    print('💾 保存了 ${avatars.length} 个头像到数据库');
  }

  /// 获取所有头像
  Future<List<PhigrosAvatar>> getAllAvatars() async {
    final isar = await db;
    return await isar.phigrosAvatars.where().findAll();
  }

  /// 根据名称获取头像
  Future<PhigrosAvatar?> getAvatarByName(String avatarName) async {
    final isar = await db;
    return await isar.phigrosAvatars
        .filter()
        .avatarNameEqualTo(avatarName)
        .findFirst();
  }

  /// 获取头像总数
  Future<int> getAvatarCount() async {
    final isar = await db;
    return await isar.phigrosAvatars.count();
  }

  // ========== 清理操作 ==========

  /// 清空所有数据
  Future<void> clearAllData() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.phigrosSongs.clear();
      await isar.phigrosCollections.clear();
      await isar.phigrosAvatars.clear();
    });
    print('🗑️ 已清空所有Phigros数据');
  }
}
