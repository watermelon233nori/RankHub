import 'package:flutter/material.dart';

/// 平台自定义功能项
/// 用于在 Mine 页面展示平台特定的功能入口
class PlatformFeatureItem {
  /// 功能标题
  final String title;

  /// 功能描述（可选）
  final String? description;

  /// 功能图标
  final IconData icon;

  /// 图标颜色（可选）
  final Color? iconColor;

  /// 图标背景色（可选）
  final Color? iconBackgroundColor;

  /// 点击回调
  final VoidCallback onTap;

  /// 是否显示右侧箭头
  final bool showTrailingArrow;

  /// 自定义尾部部件（可选，优先级高于 showTrailingArrow）
  final Widget? trailing;

  /// 是否启用（禁用时变灰且不可点击）
  final bool enabled;

  /// 徽章文本（可选，例如 "New"、"Beta"）
  final String? badge;

  /// 徽章颜色（可选）
  final Color? badgeColor;

  PlatformFeatureItem({
    required this.title,
    this.description,
    required this.icon,
    this.iconColor,
    this.iconBackgroundColor,
    required this.onTap,
    this.showTrailingArrow = true,
    this.trailing,
    this.enabled = true,
    this.badge,
    this.badgeColor,
  });

  /// 构建功能项的 Widget
  Widget buildWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Opacity(
      opacity: enabled ? 1.0 : 0.5,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // 图标
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBackgroundColor ?? colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 24,
                  color: iconColor ?? colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),

              // 文本内容
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (badge != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: badgeColor ?? colorScheme.errorContainer,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              badge!,
                              style: textTheme.labelSmall?.copyWith(
                                color: badgeColor != null
                                    ? Colors.white
                                    : colorScheme.onErrorContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        description!,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              // 尾部
              if (trailing != null)
                trailing!
              else if (showTrailingArrow)
                Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
