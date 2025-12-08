import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/maimai/net_user.dart';
import 'package:rank_hub/services/isar_service.dart';

/// NET用户本地存储服务
class NetUserService {
  static final NetUserService _instance = NetUserService._internal();
  factory NetUserService() => _instance;
  static NetUserService get instance => _instance;

  NetUserService._internal();

  Future<Isar> get _isar async => await IsarService.instance.maimai.db;

  /// 保存或更新NET用户
  Future<void> saveNetUser(NetUser netUser) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      // 先查询是否已存在该用户
      final existingUser = await isar.netUsers
          .filter()
          .userIdEqualTo(netUser.userId)
          .findFirst();

      if (existingUser != null) {
        // 如果用户已存在，更新现有记录的 ID 和信息
        netUser.id = existingUser.id;
        netUser.lastUsedAt = DateTime.now();
      }

      // 保存或更新用户
      await isar.netUsers.put(netUser);
    });
  }

  /// 根据用户ID获取NET用户
  Future<NetUser?> getNetUserById(int userId) async {
    final isar = await _isar;
    return await isar.netUsers.filter().userIdEqualTo(userId).findFirst();
  }

  /// 获取所有NET用户，按最后使用时间倒序排列
  Future<List<NetUser>> getAllNetUsers() async {
    final isar = await _isar;
    return await isar.netUsers.where().sortByLastUsedAtDesc().findAll();
  }

  /// 获取最近使用的N个NET用户
  Future<List<NetUser>> getRecentNetUsers({int limit = 10}) async {
    final isar = await _isar;
    return await isar.netUsers
        .where()
        .sortByLastUsedAtDesc()
        .limit(limit)
        .findAll();
  }

  /// 删除NET用户
  Future<bool> deleteNetUser(int userId) async {
    final isar = await _isar;
    bool deleted = false;
    await isar.writeTxn(() async {
      final user = await isar.netUsers
          .filter()
          .userIdEqualTo(userId)
          .findFirst();
      if (user != null) {
        deleted = await isar.netUsers.delete(user.id);
      }
    });
    return deleted;
  }

  /// 更新用户最后使用时间
  Future<void> updateLastUsedTime(int userId) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      final user = await isar.netUsers
          .filter()
          .userIdEqualTo(userId)
          .findFirst();
      if (user != null) {
        user.lastUsedAt = DateTime.now();
        await isar.netUsers.put(user);
      }
    });
  }

  /// 清空所有NET用户
  Future<void> clearAllNetUsers() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.netUsers.clear();
    });
  }

  /// 搜索NET用户（按用户名）
  Future<List<NetUser>> searchNetUsers(String query) async {
    if (query.isEmpty) {
      return await getAllNetUsers();
    }

    final isar = await _isar;
    return await isar.netUsers
        .filter()
        .userNameContains(query, caseSensitive: false)
        .sortByLastUsedAtDesc()
        .findAll();
  }
}
