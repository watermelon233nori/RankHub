import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

/// Isar 数据库基础服务
/// 提供通用的数据库操作,支持多个游戏数据库
abstract class BaseIsarService {
  static final Map<String, Isar> _databases = {};
  static final Map<String, Future<Isar>> _initializingDatabases = {};

  /// 获取数据库名称
  String get databaseName;

  /// 获取数据库 Schema 列表
  List<CollectionSchema> get schemas;

  /// 获取 Isar 数据库实例
  Future<Isar> get db async {
    // 如果已经初始化完成，直接返回
    if (_databases.containsKey(databaseName)) {
      return _databases[databaseName]!;
    }

    // 如果正在初始化中，等待初始化完成
    if (_initializingDatabases.containsKey(databaseName)) {
      return await _initializingDatabases[databaseName]!;
    }

    // 开始新的初始化
    final initFuture = _initIsar();
    _initializingDatabases[databaseName] = initFuture;

    try {
      final database = await initFuture;
      _databases[databaseName] = database;
      return database;
    } finally {
      _initializingDatabases.remove(databaseName);
    }
  }

  /// 初始化 Isar 数据库（使用同步方法避免潜在问题）
  Future<Isar> _initIsar() async {
    print('🔧 初始化数据库: $databaseName');

    // 检查 Isar 全局实例列表中是否已经存在
    if (Isar.instanceNames.contains(databaseName)) {
      print('⚠️ 数据库 $databaseName 已在 Isar 全局实例中，获取现有实例');
      final existingInstance = Isar.getInstance(databaseName);
      if (existingInstance != null) {
        return existingInstance;
      }
    }

    // 获取应用目录
    final dir = await getApplicationDocumentsDirectory();

    try {
      return Isar.openSync(schemas, directory: dir.path, name: databaseName);
    } catch (e) {
      print('❌ 打开数据库失败: $e');
      print('❌ 错误详情: ${e.runtimeType}');
      rethrow;
    }
  }

  /// 关闭数据库
  Future<void> close() async {
    final database = _databases[databaseName];
    if (database != null) {
      await database.close();
      _databases.remove(databaseName);
    }
  }

  /// 清空所有数据
  Future<void> clearAll() async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clear();
    });
  }

  /// 关闭所有数据库
  static Future<void> closeAll() async {
    for (final database in _databases.values) {
      await database.close();
    }
    _databases.clear();
  }
}
