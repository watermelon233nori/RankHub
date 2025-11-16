import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../controllers/account_controller.dart';
import '../models/account/account.dart';
import 'account_manage.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final controller = Get.put(AccountController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        titleSpacing: 24,
        centerTitle: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        actionsPadding: EdgeInsets.symmetric(horizontal: 8),
      ),
      body: ListView(
        children: [
          Obx(() {
            final accounts = controller.accounts;
            final currentAccount = controller.currentAccount;

            if (accounts.isEmpty) {
              // 无账号状态
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 64,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            '未绑定账号',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '点击下方按钮添加账号',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 16),
                          FilledButton.icon(
                            onPressed: () =>
                                Get.to(() => const AccountManagePage()),
                            icon: const Icon(Icons.add),
                            label: const Text('添加账号'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 账号选择区域
                  SizedBox(
                    height: 70,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: accounts.length + 1,
                      itemBuilder: (context, index) {
                        if (index == accounts.length) {
                          // 添加账号按钮
                          return GestureDetector(
                            onTap: () =>
                                Get.to(() => const AccountManagePage()),
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color:
                                          colorScheme.surfaceContainerHighest,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: colorScheme.outline.withOpacity(
                                          0.3,
                                        ),
                                        width: 2,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: colorScheme.onSurfaceVariant,
                                      size: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        final account = accounts[index];
                        final isSelected = currentAccount?.id == account.id;

                        return GestureDetector(
                          onTap: () => controller.switchAccount(account),
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? colorScheme.primary
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: colorScheme.primaryContainer,
                                      shape: BoxShape.circle,
                                      image: account.avatarUrl != null
                                          ? DecorationImage(
                                              image: NetworkImage(
                                                account.avatarUrl!,
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : null,
                                    ),
                                    child: account.avatarUrl == null
                                        ? Icon(
                                            Icons.person,
                                            color:
                                                colorScheme.onPrimaryContainer,
                                            size: 24,
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 当前账号信息
                  Row(
                    children: [
                      // 头像
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                          image: currentAccount?.avatarUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    currentAccount!.avatarUrl!,
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: currentAccount?.avatarUrl == null
                            ? Icon(
                                Icons.person,
                                size: 32,
                                color: colorScheme.onPrimaryContainer,
                              )
                            : null,
                      ),
                      const SizedBox(width: 16),
                      // 文字信息
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              currentAccount?.displayName ??
                                  currentAccount?.externalId ??
                                  '未知账号',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              currentAccount != null
                                  ? _getPlatformName(currentAccount.platform)
                                  : '',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 16),
          const Divider(),

          // 账号管理
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('账号管理'),
            subtitle: Obx(() {
              final count = controller.accounts.length;
              return Text(count > 0 ? '已绑定 $count 个账号' : '暂无绑定账号');
            }),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.to(() => const AccountManagePage()),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('数据同步'),
            subtitle: const Text('同步曲目、收藏品等数据'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Get.toNamed(AppRoutes.dataSync),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('个人资料'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('提示', '功能开发中...');
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text('我的成绩'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('提示', '功能开发中...');
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('提示', '功能开发中...');
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('关于'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Get.snackbar('提示', '功能开发中...');
            },
          ),
        ],
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
}
