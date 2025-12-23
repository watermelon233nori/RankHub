import 'package:rank_hub/core/game_id.dart';
import 'package:rank_hub/core/platform_id.dart';

/// 资源加载作用域（不可变）
/// 包含资源加载所需的所有标识符信息
/// Scope 变化 = Loader 重建
class ResourceScope {
  /// 游戏ID
  final GameId gameId;

  /// 平台ID
  final PlatformId platformId;

  /// 账号标识符（用于缓存隔离）
  /// 可以是 external_id、user_id、username 等
  final String? accountIdentifier;

  /// 额外的作用域参数（用于特殊场景）
  final Map<String, dynamic> extras;

  const ResourceScope({
    required this.gameId,
    required this.platformId,
    this.accountIdentifier,
    this.extras = const {},
  });

  /// 创建游客作用域（无账号）
  const ResourceScope.guest({
    required this.gameId,
    required this.platformId,
    this.extras = const {},
  }) : accountIdentifier = null;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ResourceScope &&
        other.gameId == gameId &&
        other.platformId == platformId &&
        other.accountIdentifier == accountIdentifier;
  }

  @override
  int get hashCode =>
      gameId.hashCode ^
      platformId.hashCode ^
      (accountIdentifier?.hashCode ?? 0);

  @override
  String toString() {
    return 'ResourceScope(game=${gameId.value}, platform=${platformId.value}, account=$accountIdentifier)';
  }

  /// 判断是否有账号
  bool get hasAccount => accountIdentifier != null;

  /// 生成作用域唯一键（用于缓存等场景）
  String toKey() {
    final parts = [
      'game:${gameId.value}',
      'platform:${platformId.value}',
      if (accountIdentifier != null) 'account:$accountIdentifier',
    ];
    return parts.join('_');
  }
}
