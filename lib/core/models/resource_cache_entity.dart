import 'package:isar_community/isar.dart';

part 'resource_cache_entity.g.dart';

/// 资源缓存实体
/// 记录资源的加载时间和过期时间，用于缓存管理
@Collection()
class ResourceCacheEntity {
  Id id = Isar.autoIncrement;

  /// 资源的完整 key（namespace:name@scope）
  @Index(unique: true)
  late String resourceKey;

  /// 账号标识（accountIdentifier + platformId）
  /// 用于区分不同账号的资源缓存
  @Index()
  late String accountKey;

  /// 资源命名空间
  @Index()
  late String namespace;

  /// 资源名称
  late String name;

  /// 资源作用域（可选）
  String? scope;

  /// 最后加载时间
  late DateTime lastLoadTime;

  /// 过期时间（根据 TTL 计算）
  late DateTime expiryTime;

  /// TTL 秒数
  late int ttlSeconds;

  /// 是否与账号相关
  late bool isAccountRelated;

  ResourceCacheEntity();

  ResourceCacheEntity.create({
    required this.resourceKey,
    required this.accountKey,
    required this.namespace,
    required this.name,
    this.scope,
    required this.ttlSeconds,
    required this.isAccountRelated,
  }) {
    final now = DateTime.now();
    lastLoadTime = now;
    expiryTime = now.add(Duration(seconds: ttlSeconds));
  }

  /// 更新加载时间和过期时间
  void updateLoadTime(int newTtlSeconds) {
    final now = DateTime.now();
    lastLoadTime = now;
    ttlSeconds = newTtlSeconds;
    expiryTime = now.add(Duration(seconds: newTtlSeconds));
  }

  /// 检查是否已过期
  bool get isExpired => DateTime.now().isAfter(expiryTime);
}
