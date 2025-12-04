import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/services/queue_status_manager.dart';
import 'package:rank_hub/pages/mai_party_queue_page.dart';

/// 排队状态卡片
class QueueStatusCard extends StatelessWidget {
  const QueueStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final manager = Get.find<QueueStatusManager>();

    return Obx(() {
      final status = manager.queueStatus.value;
      if (status == null) {
        return const SizedBox.shrink();
      }

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Material(
          color: status.isPlaying
              ? colorScheme.primaryContainer
              : colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(16),
          elevation: 2,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Get.to(
                () => MaiPartyQueuePage(
                  partyName: status.partyName,
                  initialPlayerName: status.playerName,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 标题栏
                  Row(
                    children: [
                      Icon(
                        status.isPlaying
                            ? Icons.videogame_asset
                            : Icons.access_time,
                        color: status.isPlaying
                            ? colorScheme.onPrimaryContainer
                            : colorScheme.onSecondaryContainer,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        status.isPlaying ? '正在游玩' : '排队中',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: status.isPlaying
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSecondaryContainer,
                        ),
                      ),
                      const Spacer(),
                      // 刷新按钮
                      IconButton(
                        icon: Icon(
                          Icons.refresh,
                          size: 20,
                          color: status.isPlaying
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSecondaryContainer,
                        ),
                        onPressed: () async {
                          await manager.refreshStatus();
                          Get.snackbar(
                            '已刷新',
                            '排队状态已更新',
                            snackPosition: SnackPosition.BOTTOM,
                            duration: const Duration(seconds: 1),
                          );
                        },
                        tooltip: '刷新状态',
                      ),
                      // 关闭按钮
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 20,
                          color: status.isPlaying
                              ? colorScheme.onPrimaryContainer
                              : colorScheme.onSecondaryContainer,
                        ),
                        onPressed: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text('确认'),
                              content: const Text('确定要清除排队状态吗？'),
                              actions: [
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text('取消'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    manager.clearStatus();
                                    Get.back();
                                  },
                                  child: const Text('确定'),
                                ),
                              ],
                            ),
                          );
                        },
                        tooltip: '清除状态',
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 房间和玩家信息
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoItem(
                          context,
                          '房间',
                          status.partyName,
                          Icons.meeting_room,
                          colorScheme,
                          status.isPlaying,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildInfoItem(
                          context,
                          '玩家',
                          status.playerName,
                          Icons.person,
                          colorScheme,
                          status.isPlaying,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // 位置和等待时间
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoItem(
                          context,
                          '位置',
                          '${status.position}/${status.totalPeople}',
                          Icons.format_list_numbered,
                          colorScheme,
                          status.isPlaying,
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (!status.isPlaying)
                        Expanded(
                          child: _buildInfoItem(
                            context,
                            '预计等待',
                            '~${status.estimatedWaitMinutes} 分钟',
                            Icons.schedule,
                            colorScheme,
                            status.isPlaying,
                          ),
                        ),
                    ],
                  ),

                  // 上机提示
                  if (status.isPlaying) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: colorScheme.onPrimaryContainer,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '双人上机预计 12-15 分钟，单人上机预计 10-12 分钟',
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // 点击查看详情提示
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      '点击查看详情',
                      style: textTheme.bodySmall?.copyWith(
                        color:
                            (status.isPlaying
                                    ? colorScheme.onPrimaryContainer
                                    : colorScheme.onSecondaryContainer)
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInfoItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    ColorScheme colorScheme,
    bool isPlaying,
  ) {
    final textColor = isPlaying
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSecondaryContainer;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: textColor.withOpacity(0.7)),
              const SizedBox(width: 4),
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: textColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
