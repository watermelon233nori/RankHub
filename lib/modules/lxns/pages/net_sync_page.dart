import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/modules/lxns/controllers/net_sync_controller.dart';
import 'package:rank_hub/models/maimai/net_user.dart';

/// NET数据同步页面
class NetSyncPage extends StatelessWidget {
  final Account account;

  const NetSyncPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NetSyncController(account: account));

    return Scaffold(
      appBar: AppBar(title: const Text('从NET同步成绩')),
      body: Obx(() {
        switch (controller.currentStep.value) {
          case NetSyncStep.input:
            return _buildInputStep(context, controller);
          case NetSyncStep.preview:
            return _buildPreviewStep(context, controller);
          case NetSyncStep.syncing:
            return _buildSyncingStep(context, controller);
          case NetSyncStep.success:
            return _buildSuccessStep(context, controller);
          case NetSyncStep.error:
            return _buildErrorStep(context, controller);
        }
      }),
    );
  }

  /// 输入步骤
  Widget _buildInputStep(BuildContext context, NetSyncController controller) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 二维码获取提示
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: Colors.blue.shade700,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '如何获取二维码',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. 在微信中打开「舞萌｜中二」公众号\n'
                    '2. 点击「玩家二维码」\n'
                    '3. 打开得到的链接，长按识别二维码\n'
                    '4. 完整地复制识别到的字符串',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[800],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 统一输入框
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.input, size: 24),
                      const SizedBox(width: 8),
                      const Text(
                        '输入 User ID 或 QR Code',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '支持以下格式：\n• User ID（纯数字）\n• QR Code（SGWCMAID开头）',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) => controller.input.value = value,
                    decoration: InputDecoration(
                      hintText: '输入User ID或粘贴QR Code内容',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.content_paste),
                        onPressed: () {
                          controller.pasteFromClipboard((text) {
                            controller.input.value = text;
                          });
                        },
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading.value
                            ? null
                            : controller.fetchUserByInput,
                        child: controller.isLoading.value
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('获取用户信息'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // 最近使用的用户
          Obx(() {
            if (controller.recentNetUsers.isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '最近使用',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ...controller.recentNetUsers.map(
                  (user) => _buildUserListTile(context, user, controller),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  /// 用户列表项
  Widget _buildUserListTile(
    BuildContext context,
    NetUser user,
    NetSyncController controller,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.userName.isNotEmpty ? user.userName[0] : 'U'),
        ),
        title: Text(
          user.userName.isNotEmpty ? user.userName : 'User ${user.userId}',
        ),
        subtitle: Text('Rating: ${user.playerRating} · ID: ${user.userId}'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => controller.selectRecentUser(user),
      ),
    );
  }

  /// 预览步骤
  Widget _buildPreviewStep(BuildContext context, NetSyncController controller) {
    final user = controller.selectedNetUser.value;
    if (user == null) return const SizedBox.shrink();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Text(
                      user.userName.isNotEmpty ? user.userName[0] : 'U',
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user.userName.isNotEmpty
                        ? user.userName
                        : 'User ${user.userId}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'User ID: ${user.userId}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildInfoRow('Rating', user.playerRating.toString()),
                  if (user.lastPlayDate != null)
                    _buildInfoRow('最后游玩', user.lastPlayDate!),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 查分器账号信息
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 20,
                        color: Colors.orange.shade700,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '将同步到以下账号',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '查分器账号：',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      Expanded(
                        child: Text(
                          account.displayName ?? account.username ?? '未知',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '请确认账号无误后再同步',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: controller.startSync,
            icon: const Icon(Icons.cloud_upload),
            label: const Text('确认并开始同步'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: controller.backToInput,
            icon: const Icon(Icons.arrow_back),
            label: const Text('返回'),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }

  /// 同步中步骤
  Widget _buildSyncingStep(BuildContext context, NetSyncController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => CircularProgressIndicator(
                value: controller.syncProgress.value,
              ),
            ),
            const SizedBox(height: 24),
            Obx(
              () => Text(
                controller.syncMessage.value,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final progress = (controller.syncProgress.value * 100).toInt();
              return Text(
                '$progress%',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 成功步骤
  Widget _buildSuccessStep(BuildContext context, NetSyncController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, size: 80, color: Colors.green),
            const SizedBox(height: 24),
            const Text(
              '同步成功！',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Text(
                '已同步 ${controller.syncedScoreCount.value} 条成绩',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: const Text('完成'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: controller.backToInput,
              child: const Text('继续同步其他用户'),
            ),
          ],
        ),
      ),
    );
  }

  /// 错误步骤
  Widget _buildErrorStep(BuildContext context, NetSyncController controller) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 80, color: Colors.red),
            const SizedBox(height: 24),
            const Text(
              '同步失败',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Obx(
              () => Text(
                controller.syncMessage.value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: controller.backToInput,
              child: const Text('返回重试'),
            ),
          ],
        ),
      ),
    );
  }
}
