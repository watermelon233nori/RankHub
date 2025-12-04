import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/pages/mai_party_queue_page.dart';
import 'package:rank_hub/services/qr_code_scanner_service.dart';

/// 二维码功能测试页面
/// 用于快速测试排队功能，无需扫描真实二维码
class QRCodeTestPage extends StatelessWidget {
  const QRCodeTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController partyController = TextEditingController(
      text: 'test_party',
    );
    final TextEditingController playerController = TextEditingController(
      text: 'player_${DateTime.now().millisecondsSinceEpoch % 1000}',
    );

    return Scaffold(
      appBar: AppBar(title: const Text('二维码功能测试')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 注册的处理器列表
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '已注册的处理器',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...QRCodeScannerService().handlers.map((handler) {
                    return ListTile(
                      leading: const Icon(Icons.qr_code),
                      title: Text(handler.name),
                      subtitle: Text(handler.description),
                    );
                  }),
                  if (QRCodeScannerService().handlers.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('暂无已注册的处理器'),
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 快速测试
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '快速测试排队功能',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: partyController,
                    decoration: const InputDecoration(
                      labelText: '房间名称',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.room),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: playerController,
                    decoration: const InputDecoration(
                      labelText: '玩家名称（可选）',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () {
                      final party = partyController.text.trim();
                      if (party.isEmpty) {
                        Get.snackbar('提示', '请输入房间名称');
                        return;
                      }

                      Get.to(
                        () => MaiPartyQueuePage(
                          partyName: party,
                          initialPlayerName: playerController.text.trim(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('打开排队页面'),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // 测试二维码内容
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '测试二维码解析',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildTestQRButton(
                    context,
                    '测试1: 基础格式',
                    'maiparty://test_party',
                  ),
                  const SizedBox(height: 8),
                  _buildTestQRButton(
                    context,
                    '测试2: 带玩家名称',
                    'maiparty://test_party?player=TestPlayer',
                  ),
                  const SizedBox(height: 8),
                  _buildTestQRButton(
                    context,
                    '测试3: HTTP URL',
                    'https://mais.godserver.cn/party/test_party',
                  ),
                  const SizedBox(height: 8),
                  _buildTestQRButton(
                    context,
                    '测试4: HTTP URL 带参数',
                    'https://mais.godserver.cn/party/西单插电师舞萌1?player=Akarin',
                  ),
                  const SizedBox(height: 8),
                  _buildTestQRButton(
                    context,
                    '测试5: 无效格式',
                    'invalid://test',
                    isInvalid: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTestQRButton(
    BuildContext context,
    String label,
    String qrContent, {
    bool isInvalid = false,
  }) {
    return FilledButton.tonalIcon(
      onPressed: () async {
        try {
          final success = await QRCodeScannerService().handleQRCode(
            context,
            qrContent,
          );

          if (!success && !isInvalid) {
            Get.snackbar(
              '测试结果',
              '未找到匹配的处理器',
              snackPosition: SnackPosition.BOTTOM,
            );
          } else if (success && isInvalid) {
            Get.snackbar(
              '测试结果',
              '意外成功处理了无效格式',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orange,
            );
          }
        } catch (e) {
          // 错误已经在处理器中显示
        }
      },
      icon: Icon(isInvalid ? Icons.error : Icons.qr_code_2),
      label: Text(label),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }
}
