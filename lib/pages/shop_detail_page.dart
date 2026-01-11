import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:rank_hub/models/nearcade/shop.dart';
import 'package:rank_hub/models/nearcade/game.dart';
import 'package:intl/intl.dart';

class ShopDetailPage extends StatelessWidget {
  const ShopDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Shop shop = Get.arguments as Shop;

    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name, maxLines: 1, overflow: TextOverflow.ellipsis),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 营业状态卡片
            Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        shop.isOpen ? Icons.check_circle : Icons.cancel,
                        color: shop.isOpen ? Colors.green : Colors.red,
                        size: 32,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              shop.isOpen ? '营业中' : '闭店中',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: shop.isOpen
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                            ),
                            if (shop.distance != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                '距离您 ${shop.distance!.toStringAsFixed(2)} km',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 地址信息
            _buildSection(
              context,
              icon: Icons.location_on,
              title: '地址',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.address.fullAddress,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => _openMapNavigation(context, shop),
                      icon: const Icon(Icons.navigation),
                      label: const Text('打开地图导航'),
                    ),
                  ),
                ],
              ),
            ),

            // 营业时间
            _buildSection(
              context,
              icon: Icons.access_time,
              title: '营业时间',
              child: _buildOpeningHours(context, shop.openingHours),
            ),

            // 游戏列表
            if (shop.games.isNotEmpty)
              _buildSection(
                context,
                icon: Icons.games,
                title: '机台信息 (${shop.games.length})',
                child: Column(
                  children: shop.games.map((game) {
                    return _buildGameCard(context, game);
                  }).toList(),
                ),
              ),

            // 在勤人数
            if (shop.totalAttendance != null)
              _buildSection(
                context,
                icon: Icons.people,
                title: '在勤人数',
                child: Row(
                  children: [
                    Text(
                      '${shop.totalAttendance}',
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Text('人', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),

            // 备注信息
            if (shop.comment.isNotEmpty)
              _buildSection(
                context,
                icon: Icons.note,
                title: '备注',
                child: Text(
                  shop.comment,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),

            // 数据来源
            _buildSection(
              context,
              icon: Icons.info_outline,
              title: '数据信息',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(context, '数据来源', shop.source),
                  const SizedBox(height: 8),
                  _buildInfoRow(
                    context,
                    '更新时间',
                    _formatDateTime(shop.updatedAt),
                  ),
                  if (shop.createdAt != null) ...[
                    const SizedBox(height: 8),
                    _buildInfoRow(
                      context,
                      '创建时间',
                      _formatDateTime(shop.createdAt!),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpeningHours(
    BuildContext context,
    List<List<double>> openingHours,
  ) {
    if (openingHours.isEmpty) {
      return Text(
        '暂无营业时间信息',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
      );
    }

    final weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];
    final now = DateTime.now();
    final currentDay = now.weekday - 1; // 0 = Monday

    if (openingHours.length == 1) {
      // 所有天相同
      final hours = openingHours[0];
      return Text(
        '每天 ${_formatHour(hours[0])} - ${_formatHour(hours[1])}',
        style: Theme.of(context).textTheme.bodyLarge,
      );
    }

    return Column(
      children: List.generate(
        openingHours.length > 7 ? 7 : openingHours.length,
        (index) {
          final hours = openingHours[index];
          final isToday = index == currentDay;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    weekDays[index],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    '${_formatHour(hours[0])} - ${_formatHour(hours[1])}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday
                          ? Theme.of(context).colorScheme.primary
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
        Expanded(
          child: Text(value, style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }

  Widget _buildGameCard(BuildContext context, Game game) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 游戏标题栏
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                            ),
                      ),
                      if (game.version.isNotEmpty)
                        Text(
                          '版本: ${game.version}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer
                                    .withOpacity(0.8),
                              ),
                        ),
                    ],
                  ),
                ),
                // 机台数量徽章
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.computer,
                        size: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${game.quantity}台',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 游戏详细信息
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 费用信息
                if (game.cost.isNotEmpty)
                  Row(
                    children: [
                      Icon(
                        Icons.payments,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '费用',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          game.cost,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ],
                  ),

                // 备注信息
                if (game.comment.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          game.comment,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withOpacity(0.7),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],

                // ID信息（用于调试或高级用户）
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'ID: ${game.gameId}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Title ID: ${game.titleId}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatHour(double hour) {
    final h = hour.floor();
    final m = ((hour - h) * 60).round();
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  String _formatDateTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr);
      return DateFormat('yyyy年MM月dd日 HH:mm').format(dateTime);
    } catch (e) {
      return dateTimeStr;
    }
  }

  Future<void> _openMapNavigation(BuildContext context, Shop shop) async {
    try {
      final availableMaps = await MapLauncher.installedMaps;

      if (availableMaps.isEmpty) {
        Get.snackbar('提示', '未找到可用的地图应用');
        return;
      }

      final coords = Coords(shop.location.latitude, shop.location.longitude);
      final title = shop.name;

      // 如果只有一个地图应用，直接打开
      if (availableMaps.length == 1) {
        await availableMaps.first.showMarker(coords: coords, title: title);
        return;
      }

      // 多个地图应用时显示选择对话框
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '选择地图应用',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...availableMaps.map((map) {
                    return ListTile(
                      leading: const Icon(Icons.map),
                      title: Text(map.mapName),
                      onTap: () {
                        Navigator.pop(context);
                        map.showMarker(coords: coords, title: title);
                      },
                    );
                  }),
                ],
              ),
            ),
          );
        },
      );
    } catch (e) {
      Get.snackbar('错误', '打开地图失败: $e');
    }
  }
}
