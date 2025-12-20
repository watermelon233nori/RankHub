import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/nearcade/shop.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;
  final VoidCallback? onTap;
  final VoidCallback? onNavigate;

  const ShopCard({super.key, required this.shop, this.onTap, this.onNavigate});

  String _formatDistance() {
    if (shop.distance == null) return '距离未知';

    final distance = shop.distance!;
    if (distance < 1) {
      // 小于1km，显示米
      return '${(distance * 1000).toInt()}m';
    } else {
      // 大于等于1km，显示km，保留一位小数
      return '${distance.toStringAsFixed(1)}km';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isOpen = shop.isOpen;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainerHighest.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap:
            onTap ??
            () {
              Get.snackbar(
                '提示',
                '查看 ${shop.name} 详情',
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.all(16),
              );
            },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            shop.name,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        if (shop.distance != null) ...[
                          Icon(
                            Icons.location_on,
                            size: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            _formatDistance(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: isOpen
                                ? Colors.green.withOpacity(0.2)
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            isOpen ? '营业中' : '已闭店',
                            style: TextStyle(
                              fontSize: 12,
                              color: isOpen
                                  ? Colors.green[700]
                                  : Colors.grey[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        // 显示前两款游戏
                        ...shop.games
                            .take(2)
                            .map(
                              (game) => Chip(
                                label: Text(
                                  game.name,
                                  style: TextStyle(fontSize: 11),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.compact,
                              ),
                            ),
                        // 如果有更多游戏，显示 +x
                        if (shop.games.length > 2)
                          Chip(
                            label: Text(
                              '+${shop.games.length - 2}',
                              style: TextStyle(fontSize: 11),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondaryContainer,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      shop.address.fullAddress,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.6),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
