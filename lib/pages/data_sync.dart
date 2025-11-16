import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/data_sync_controller.dart';

/// 数据同步设置页面
class DataSyncPage extends GetView<DataSyncController> {
  const DataSyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSyncing = controller.syncStatus.value == SyncStatus.syncing;
      final progress = controller.syncProgress.value;
      final description = controller.syncDescription.value;

      return Scaffold(
        appBar: AppBar(
          title: const Text('数据同步'),
          centerTitle: true,
          bottom: isSyncing
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                description.isEmpty ? '正在同步...' : description,
                                style: const TextStyle(fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${(progress * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(value: progress),
                      ],
                    ),
                  ),
                )
              : null,
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSyncStatusCard(),
            const SizedBox(height: 16),
            _buildSyncActionsCard(),
            const SizedBox(height: 16),
            _buildDatabaseStatsCard(),
            const SizedBox(height: 16),
            _buildMaintenanceCard(),
          ],
        ),
      );
    });
  }

  /// 同步状态卡片
  Widget _buildSyncStatusCard() {
    return Obx(() {
      final status = controller.syncStatus.value;
      final progress = controller.syncProgress.value;
      final description = controller.syncDescription.value;

      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.sync, size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    '同步状态',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  _buildStatusChip(status),
                ],
              ),
              if (status == SyncStatus.syncing) ...[
                const SizedBox(height: 16),
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              if (controller.lastSyncTime.value != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                    const SizedBox(width: 4),
                    Text(
                      '上次同步: ${_formatDateTime(controller.lastSyncTime.value!)}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
              if (controller.needsSync) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber,
                        size: 16,
                        color: Colors.orange[800],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '建议重新同步数据',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange[800],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }

  /// 同步操作卡片
  Widget _buildSyncActionsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.cloud_download, size: 24),
                SizedBox(width: 8),
                Text(
                  '同步操作',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() {
              final isSyncing =
                  controller.syncStatus.value == SyncStatus.syncing;

              return SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: isSyncing
                      ? null
                      : () => controller.syncCurrentAccount(),
                  icon: const Icon(Icons.sync),
                  label: const Text('同步当前账号数据'),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 数据库统计卡片
  Widget _buildDatabaseStatsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.storage, size: 24),
                SizedBox(width: 8),
                Text(
                  '数据库统计',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            FutureBuilder<Map<String, int>>(
              future: controller.getDatabaseStats(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final stats = snapshot.data!;
                return Column(
                  children: [
                    _buildStatRow('曲目', stats['songs'] ?? 0, Icons.music_note),
                    const Divider(height: 16),
                    _buildStatRow('玩家', stats['players'] ?? 0, Icons.person),
                    const Divider(height: 16),
                    _buildStatRow('成绩', stats['scores'] ?? 0, Icons.bar_chart),
                    const Divider(height: 16),
                    _buildStatRow(
                      '收藏品',
                      stats['collections'] ?? 0,
                      Icons.collections,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// 维护操作卡片
  Widget _buildMaintenanceCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.build, size: 24),
                SizedBox(width: 8),
                Text(
                  '维护操作',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showClearDataDialog(),
                icon: const Icon(Icons.delete_forever),
                label: const Text('清除本地数据'),
                style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 状态标签
  Widget _buildStatusChip(SyncStatus status) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case SyncStatus.idle:
        color = Colors.grey;
        label = '空闲';
        icon = Icons.circle;
        break;
      case SyncStatus.syncing:
        color = Colors.blue;
        label = '同步中';
        icon = Icons.sync;
        break;
      case SyncStatus.success:
        color = Colors.green;
        label = '成功';
        icon = Icons.check_circle;
        break;
      case SyncStatus.error:
        color = Colors.red;
        label = '错误';
        icon = Icons.error;
        break;
    }

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(label),
      labelStyle: TextStyle(color: color, fontSize: 12),
      backgroundColor: color.withOpacity(0.1),
      side: BorderSide(color: color, width: 1),
    );
  }

  /// 统计行
  Widget _buildStatRow(String label, int count, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
        const Spacer(),
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// 格式化日期时间
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  /// 显示清除数据确认对话框
  void _showClearDataDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('清除本地数据'),
        content: const Text('警告：此操作将删除所有本地数据，包括曲目、成绩、玩家信息等。此操作不可恢复！'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('取消')),
          FilledButton(
            onPressed: () {
              Get.back();
              controller.clearLocalData();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('确定清除'),
          ),
        ],
      ),
    );
  }
}
