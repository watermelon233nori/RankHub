import 'package:rank_hub/core/platform.dart';
import 'package:rank_hub/core/platform_id.dart';

/// 平台注册表
/// 管理所有可用平台的实例
class PlatformRegistryProvider {
  final Map<String, Platform> _platforms = {};

  /// 注册平台
  void registerPlatform(Platform platform) {
    final key = platform.id.value;
    if (_platforms.containsKey(key)) {
      throw Exception('Platform already registered: $key');
    }
    _platforms[key] = platform;
  }

  /// 批量注册平台
  void registerPlatforms(List<Platform> platforms) {
    for (final platform in platforms) {
      registerPlatform(platform);
    }
  }

  /// 根据ID查找平台
  Platform? findById(PlatformId id) {
    return _platforms[id.value];
  }

  /// 根据ID字符串查找平台
  Platform? findByIdString(String id) {
    return _platforms[id];
  }

  /// 检查平台是否已注册
  bool hasPlatform(PlatformId id) {
    return _platforms.containsKey(id.value);
  }

  /// 获取所有平台
  List<Platform> getAllPlatforms() {
    return _platforms.values.toList();
  }

  /// 获取所有平台ID
  List<PlatformId> getAllPlatformIds() {
    return _platforms.keys.map((id) => PlatformId(id)).toList();
  }

  /// 移除平台
  void unregisterPlatform(PlatformId id) {
    _platforms.remove(id.value);
  }

  /// 清空所有平台
  void clear() {
    _platforms.clear();
  }

  /// 获取平台数量
  int get platformCount => _platforms.length;

  /// 检查是否为空
  bool get isEmpty => _platforms.isEmpty;

  /// 检查是否非空
  bool get isNotEmpty => _platforms.isNotEmpty;

  /// 获取平台名称映射
  Map<String, String> getPlatformNames() {
    return Map.fromEntries(
      _platforms.entries.map((e) => MapEntry(e.key, e.value.name)),
    );
  }
}
