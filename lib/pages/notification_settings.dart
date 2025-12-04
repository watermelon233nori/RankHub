import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../services/live_activity_service.dart';
import '../services/queue_status_manager.dart';
import 'live_activity_intro_page.dart';

/// 通知设置页面
class NotificationSettingsPage extends StatelessWidget {
  const NotificationSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('通知设置')),
      body: ListView(
        children: [
          // iOS 实时活动设置
          if (Platform.isIOS) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'iOS 实时活动',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const _LiveActivitySwitch(),
            const Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: const Icon(Icons.preview),
              title: const Text('效果预览'),
              subtitle: const Text('查看实时活动效果演示'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                LiveActivityIntroPage.show(showSkipButton: false);
              },
            ),
            const Divider(indent: 16, endIndent: 16),
            ListTile(
              leading: const Icon(Icons.animation),
              title: const Text('灵动岛管理'),
              subtitle: const Text('查看和管理 Live Activities'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                final activities = await LiveActivityService.instance
                    .getAllActivities();
                Get.dialog(
                  AlertDialog(
                    title: const Text('Live Activities'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('当前活动数: ${activities.length}'),
                        const SizedBox(height: 16),
                        const Text(
                          '所有活动将在队列结束时自动关闭',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    actions: [
                      if (activities.isNotEmpty)
                        TextButton(
                          onPressed: () async {
                            await LiveActivityService.instance
                                .endAllActivities();
                            Get.back();
                            Get.snackbar('成功', '已关闭所有 Live Activities');
                          },
                          child: const Text('关闭所有'),
                        ),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text('关闭'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],

          // 推送通知设置（预留）
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              '推送通知',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text('推送通知'),
            subtitle: const Text('功能开发中'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('提示', '功能开发中...');
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// 实时活动开关 Widget
class _LiveActivitySwitch extends StatefulWidget {
  const _LiveActivitySwitch();

  @override
  State<_LiveActivitySwitch> createState() => _LiveActivitySwitchState();
}

class _LiveActivitySwitchState extends State<_LiveActivitySwitch> {
  bool _isEnabled = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSwitchState();
  }

  Future<void> _loadSwitchState() async {
    final enabled = await LiveActivityService.instance.isEnabled();
    if (mounted) {
      setState(() {
        _isEnabled = enabled;
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleSwitch(bool value) async {
    setState(() {
      _isEnabled = value;
    });

    await LiveActivityService.instance.setEnabled(value);

    if (value) {
      // 开启时，尝试刷新排队状态以创建 Live Activity
      try {
        await QueueStatusManager.instance.refreshStatus();
      } catch (e) {
        // 忽略错误，可能当前没有排队状态
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.widgets),
      title: const Text('实时活动'),
      subtitle: const Text('在灵动岛显示排队状态'),
      trailing: _isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Switch(value: _isEnabled, onChanged: _toggleSwitch),
    );
  }
}
