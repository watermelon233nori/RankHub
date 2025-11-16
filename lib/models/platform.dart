import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/game.dart';
import 'package:rank_hub/models/sync_task.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/platform_login_handler.dart';

/// 平台接口 - 定义游戏平台的核心功能
/// 一个平台可以管辖多个账号、凭据系统和多个游戏
abstract class IPlatform {
  /// 平台唯一标识符
  String get id;

  /// 平台类型（对应 Account.Platform 枚举）
  Platform get platform;

  /// 平台显示名称
  String get name;

  /// 平台描述
  String get description;

  /// 平台图标
  IconData get icon;

  /// 平台图标 URL (可选)
  String? get iconUrl => null;

  /// 平台背景图 URL (可选)
  String? get backgroundUrl => null;

  /// 平台颜色（用于UI主题）
  Color? get color => null;

  /// 平台是否启用
  bool get isEnabled => true;

  /// 平台排序权重（数值越小越靠前）
  int get sortOrder => 0;

  // ========== 账号与凭据管理 ==========

  /// 获取平台的登录处理器
  PlatformLoginHandler get loginHandler;

  /// 获取平台的凭据提供者
  CredentialProvider get credentialProvider;

  /// 验证账号是否属于此平台
  bool isAccountBelongsToPlatform(Account account) {
    return account.platform == platform;
  }

  // ========== 游戏管理 ==========

  /// 获取平台支持的游戏列表
  List<IGame> getGames();

  /// 根据ID获取游戏
  IGame? getGameById(String gameId) {
    return getGames().firstWhere(
      (game) => game.id == gameId,
      orElse: () => throw Exception('Game not found: $gameId'),
    );
  }

  /// 获取启用的游戏列表
  List<IGame> getEnabledGames() {
    return getGames().where((game) => game.isEnabled).toList();
  }

  // ========== 生命周期 ==========

  /// 平台初始化
  Future<void> initialize() async {}

  /// 平台销毁时的清理工作
  void dispose() {}

  // ========== 数据同步 ==========

  /// 创建全量同步任务组
  /// 平台自行决定需要同步哪些数据
  SyncTaskGroup createFullSyncTasks(Account account);

  /// 创建增量同步任务组（可选）
  SyncTaskGroup? createIncrementalSyncTasks(Account account) => null;

  /// 是否支持增量同步
  bool get supportsIncrementalSync => false;

  // ========== UI相关 ==========

  /// 构建平台在选择器中的自定义列表项（可选）
  Widget? buildSelectorListTile(
    BuildContext context,
    bool isSelected,
    VoidCallback onTap,
  ) => null;
}

/// 基础平台实现类 - 提供默认实现
abstract class BasePlatform implements IPlatform {
  @override
  final String id;

  @override
  final Platform platform;

  @override
  final String name;

  @override
  final String description;

  @override
  final IconData icon;

  @override
  final String? iconUrl;

  @override
  final String? backgroundUrl;

  @override
  final Color? color;

  @override
  final bool isEnabled;

  @override
  final int sortOrder;

  BasePlatform({
    required this.id,
    required this.platform,
    required this.name,
    required this.description,
    required this.icon,
    this.iconUrl,
    this.backgroundUrl,
    this.color,
    this.isEnabled = true,
    this.sortOrder = 0,
  });

  @override
  bool isAccountBelongsToPlatform(Account account) {
    return account.platform == platform;
  }

  @override
  IGame? getGameById(String gameId) {
    try {
      return getGames().firstWhere((game) => game.id == gameId);
    } catch (e) {
      return null;
    }
  }

  @override
  List<IGame> getEnabledGames() {
    return getGames().where((game) => game.isEnabled).toList();
  }

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {}

  @override
  Widget? buildSelectorListTile(
    BuildContext context,
    bool isSelected,
    VoidCallback onTap,
  ) => null;
}
