import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/osu/osu_user.dart';
import 'package:rank_hub/services/base_isar_service.dart';

/// osu! 数据库服务
/// 负责存储和查询 osu! 相关的本地数据
class OsuIsarService extends BaseIsarService {
  static OsuIsarService? _instance;

  OsuIsarService._();

  static OsuIsarService get instance {
    _instance ??= OsuIsarService._();
    return _instance!;
  }

  @override
  String get databaseName => 'osu_db';

  @override
  List<CollectionSchema> get schemas => [OsuUserSchema];

  /// 保存 osu! 用户信息
  /// 如果用户已存在，则更新信息
  Future<void> saveUser(OsuUser user) async {
    final isar = await db;
    await isar.writeTxn(() async {
      // 查找是否存在相同 userId 的用户
      final existingUser = await isar.osuUsers
          .filter()
          .userIdEqualTo(user.userId)
          .findFirst();
      
      if (existingUser != null) {
        // 复用现有 Isar ID 以进行更新
        user.id = existingUser.id;
      }
      
      await isar.osuUsers.put(user);
    });
  }

  /// 根据 osu! userId 获取用户信息
  Future<OsuUser?> getUser(int userId) async {
    final isar = await db;
    return await isar.osuUsers.filter().userIdEqualTo(userId).findFirst();
  }

  /// 清除指定 osu! 用户的数据 (登出时调用)
  Future<void> clearUser(int userId) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.osuUsers.filter().userIdEqualTo(userId).deleteAll();
    });
  }
}
