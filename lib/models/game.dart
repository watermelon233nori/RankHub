import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';

/// 游戏内容视图 - 用于多 Tab 场景
class GameContentView {
  /// Tab 标签名称
  final String label;

  /// Tab 图标（可选）
  final IconData? icon;

  /// 内容构建器
  final Widget Function(BuildContext) builder;

  /// AppBar 操作按钮（可选）
  final List<Widget> Function(BuildContext)? actionsBuilder;

  /// 浮动操作按钮（可选）
  final Widget Function(BuildContext)? fabBuilder;

  const GameContentView({
    required this.label,
    required this.builder,
    this.icon,
    this.actionsBuilder,
    this.fabBuilder,
  });
}

/// 游戏接口 - 定义游戏的基本属性和方法
/// 一个游戏属于一个平台，管理游戏数据和玩家数据
abstract class IGame {
  /// 游戏唯一标识符
  String get id;

  /// 游戏显示名称
  String get name;

  /// 游戏描述
  String get description;

  /// 游戏图标
  IconData get icon;

  /// 游戏图标 URL（可选）
  String? get iconUrl => null;

  /// 游戏颜色（可选，用于个性化展示）
  Color? get color => null;

  /// 游戏是否启用
  bool get isEnabled => true;

  /// 游戏排序权重（数值越小越靠前）
  int get sortOrder => 0;

  /// 游戏分类标签（用于分组）
  List<String> get tags => [];

  /// 游戏元数据（可扩展的键值对）
  Map<String, dynamic> get metadata => {};

  // ========== 生命周期 ==========

  /// 游戏被选中时的回调
  void onSelected();

  /// 游戏初始化（可选）
  Future<void> initialize() async {}

  /// 游戏销毁时的清理工作（可选）
  void dispose() {}

  // ========== 视图相关方法 ==========

  /// 构建游戏的Wiki内容视图
  /// 返回多个视图时使用 TabView 展示
  List<GameContentView> buildWikiViews(BuildContext context);

  /// 构建游戏的Rank内容视图
  /// 返回多个视图时使用 TabView 展示
  List<GameContentView> buildRankViews(BuildContext context);

  /// 构建游戏的 FloatingActionButton（可选）
  Widget? buildFloatingActionButton(BuildContext context) => null;

  /// 构建游戏在选择器中的自定义列表项（可选）
  /// 如果返回 null，则使用默认样式
  Widget? buildSelectorListTile(
    BuildContext context,
    bool isSelected,
    VoidCallback onTap,
  ) => null;

  /// 构建游戏的空状态视图（可选）
  Widget? buildEmptyView(BuildContext context) => null;

  /// 构建游戏的加载状态视图（可选）
  Widget? buildLoadingView(BuildContext context) => null;

  /// 构建游戏的错误状态视图（可选）
  Widget? buildErrorView(BuildContext context, String error) => null;

  /// 构建玩家信息卡片（可选）
  /// 如果游戏支持玩家信息展示，返回玩家卡片 Widget
  /// [account] 当前账号，用于获取对应的玩家数据
  Widget? buildPlayerInfoCard(BuildContext context, Account account) => null;
}

/// 基础游戏实现类 - 提供默认实现
class BaseGame implements IGame {
  @override
  final String id;

  @override
  final String name;

  @override
  final String description;

  @override
  final IconData icon;

  @override
  final String? iconUrl;

  @override
  final Color? color;

  @override
  final bool isEnabled;

  @override
  final int sortOrder;

  @override
  final List<String> tags;

  @override
  final Map<String, dynamic> metadata;

  final VoidCallback? onTap;

  /// 自定义Wiki视图构建器（可选）
  final List<GameContentView> Function(BuildContext)? wikiViewsBuilder;

  /// 自定义Rank视图构建器（可选）
  final List<GameContentView> Function(BuildContext)? rankViewsBuilder;

  BaseGame({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    this.iconUrl,
    this.color,
    this.isEnabled = true,
    this.sortOrder = 0,
    this.tags = const [],
    this.metadata = const {},
    this.onTap,
    this.wikiViewsBuilder,
    this.rankViewsBuilder,
  });

  @override
  void onSelected() {
    onTap?.call();
  }

  @override
  Future<void> initialize() async {}

  @override
  void dispose() {}

  // ========== 视图方法的默认实现 ==========

  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    if (wikiViewsBuilder != null) {
      return wikiViewsBuilder!(context);
    }

    // 默认Wiki视图
    return [
      GameContentView(
        label: 'Wiki',
        icon: Icons.menu_book_outlined,
        builder: (context) => _buildDefaultView(context, 'Wiki'),
      ),
    ];
  }

  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    if (rankViewsBuilder != null) {
      return rankViewsBuilder!(context);
    }

    // 默认Rank视图
    return [
      GameContentView(
        label: 'Rank',
        icon: Icons.leaderboard_outlined,
        builder: (context) => _buildDefaultView(context, 'Rank'),
      ),
    ];
  }

  Widget _buildDefaultView(BuildContext context, String viewType) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: color ?? colorScheme.primary),
          const SizedBox(height: 20),
          Text(
            '$name - $viewType',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          if (description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget? buildFloatingActionButton(BuildContext context) => null;

  @override
  Widget? buildSelectorListTile(
    BuildContext context,
    bool isSelected,
    VoidCallback onTap,
  ) => null;

  @override
  Widget? buildEmptyView(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64,
            color: colorScheme.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            '暂无数据',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget? buildLoadingView(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  @override
  Widget? buildErrorView(BuildContext context, String error) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: colorScheme.error),
          const SizedBox(height: 16),
          Text(
            '加载失败',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: colorScheme.error),
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget? buildPlayerInfoCard(BuildContext context, Account account) => null;
}
