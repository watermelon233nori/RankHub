import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/musedash/musedash_controller.dart';
import 'package:rank_hub/models/musedash/musedash_elfin.dart';

/// MuseDash 精灵页面
class MuseDashElfinsPage extends StatelessWidget {
  const MuseDashElfinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MuseDashController>();

    return Scaffold(
      body: Obx(() {
        final elfins = controller.elfins;

        if (elfins.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('正在加载精灵数据...'),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 100,
          ),
          itemCount: elfins.length,
          itemBuilder: (context, index) {
            final elfin = elfins[index];
            return _buildElfinCard(elfin);
          },
        );
      }),
    );
  }

  /// 精灵卡片
  Widget _buildElfinCard(MuseDashElfin elfin) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 精灵名称
            Text(
              elfin.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // 描述
            if (elfin.description.isNotEmpty)
              Text(
                elfin.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  fontStyle: FontStyle.italic,
                ),
              ),

            const SizedBox(height: 12),

            // 技能
            if (elfin.skill.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        elfin.skill,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 8),

            // 芯片信息
            if (elfin.chipName.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.extension, color: Colors.blue, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            elfin.chipName,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (elfin.chipDescription.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              elfin.chipDescription,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
