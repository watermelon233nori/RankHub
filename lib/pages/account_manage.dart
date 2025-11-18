import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_manager.dart';

/// 账号管理页面
class AccountManagePage extends StatefulWidget {
  const AccountManagePage({super.key});

  @override
  State<AccountManagePage> createState() => _AccountManagePageState();
}

class _AccountManagePageState extends State<AccountManagePage> {
  late final AccountController controller;

  @override
  void initState() {
    super.initState();
    // 获取已注册的 controller
    controller = Get.find<AccountController>();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('账号管理'), centerTitle: true),
      body: Obx(() {
        if (controller.isLoading && controller.accounts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.accounts.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 80,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(height: 16),
                Text('暂无绑定账号', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  '点击下方按钮绑定账号',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.accounts.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            final account = controller.accounts[index];
            return _AccountCard(account: account);
          },
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showBindAccountDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('绑定账号'),
      ),
    );
  }

  /// 显示绑定账号对话框
  void _showBindAccountDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _PlatformSelectionSheet(controller: controller),
    );
  }
}

/// 平台选择底部弹出框
class _PlatformSelectionSheet extends StatelessWidget {
  final AccountController controller;

  const _PlatformSelectionSheet({required this.controller});

  @override
  Widget build(BuildContext context) {
    final loginManager = PlatformLoginManager.instance;
    final handlers = loginManager.getAllHandlers();
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 拖动指示器
          Container(
            width: 32,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // 标题
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '选择平台',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // 平台列表
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: handlers.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final handler = handlers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: handler.platformIconUrl != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: handler.platformIconUrl!,
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Icon(
                                  handler.platformIcon,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  handler.platformIcon,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                            )
                          : Icon(
                              handler.platformIcon,
                              color: colorScheme.onPrimaryContainer,
                            ),
                    ),
                    title: Text(handler.platformName),
                    subtitle: Text(
                      handler.platformDescription,
                      style: const TextStyle(fontSize: 12),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () async {
                      Navigator.pop(context);
                      await _handlePlatformLogin(context, handler);
                    },
                  ),
                );
              },
            ),
          ),
          // 底部安全区域
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Future<void> _handlePlatformLogin(BuildContext context, handler) async {
    // 显示平台的登录页面
    final result = await handler.showLoginPage(context);
    if (result == null) {
      return; // 用户取消登录
    }

    // 绑定账号
    final success = await controller.bindAccount(
      platform: handler.platform,
      externalId: result.externalId,
      credentialData: result.credentialData,
      displayName: result.displayName,
      avatarUrl: result.avatarUrl,
    );

    if (success && context.mounted) {
      Get.snackbar('成功', '账号绑定成功');
    }
  }
}

/// 账号卡片组件
class _AccountCard extends StatelessWidget {
  final Account account;

  const _AccountCard({required this.account});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
    final colorScheme = Theme.of(context).colorScheme;
    final isCurrent = controller.currentAccount?.id == account.id;

    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: isCurrent ? colorScheme.primaryContainer : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // 头像（圆角矩形）
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8),
                    image: account.avatarUrl != null
                        ? DecorationImage(
                            image: NetworkImage(account.avatarUrl!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: account.avatarUrl == null
                      ? Icon(
                          Icons.person,
                          size: 32,
                          color: colorScheme.onSecondaryContainer,
                        )
                      : null,
                ),
                const SizedBox(width: 12),
                // 账号信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            account.displayName ?? account.externalId,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getPlatformName(account.platform),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (account.lastSyncTime != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          '最后同步: ${_formatTime(account.lastSyncTime!)}',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                      ],
                    ],
                  ),
                ),
                // 状态开关
                TextButton.icon(
                  onPressed: () => _showDeleteConfirmDialog(context, account),
                  icon: const Icon(Icons.delete_outline, size: 18),
                  label: const Text('解绑'),
                  style: TextButton.styleFrom(
                    foregroundColor: colorScheme.error,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getPlatformName(Platform platform) {
    switch (platform) {
      case Platform.divingFish:
        return '水鱼查分器';
      case Platform.lxns:
        return '落雪咖啡屋';
      case Platform.developerFish:
        return '开发者鱼';
      case Platform.custom:
        return '自定义';
    }
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final diff = now.difference(time);

    if (diff.inDays > 0) {
      return '${diff.inDays} 天前';
    } else if (diff.inHours > 0) {
      return '${diff.inHours} 小时前';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes} 分钟前';
    } else {
      return '刚刚';
    }
  }

  void _showDeleteConfirmDialog(BuildContext context, Account account) {
    final controller = Get.find<AccountController>();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确认解绑'),
        content: Text(
          '确定要解绑账号 "${account.displayName ?? account.externalId}" 吗？\n\n此操作将删除该账号的所有凭据信息。',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () async {
              Navigator.pop(context);
              await controller.unbindAccount(account.id);
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('解绑'),
          ),
        ],
      ),
    );
  }
}
