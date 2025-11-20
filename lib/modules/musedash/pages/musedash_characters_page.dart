import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/musedash/musedash_controller.dart';
import 'package:rank_hub/models/musedash/musedash_character.dart';

/// MuseDash 角色页面
class MuseDashCharactersPage extends StatelessWidget {
  const MuseDashCharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MuseDashController>();

    return Scaffold(
      body: Obx(() {
        final characters = controller.characters;

        if (characters.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('正在加载角色数据...'),
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
          itemCount: characters.length,
          itemBuilder: (context, index) {
            final character = characters[index];
            return _buildCharacterCard(character);
          },
        );
      }),
    );
  }

  /// 角色卡片
  Widget _buildCharacterCard(MuseDashCharacter character) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 角色名称和服装名称
            Row(
              children: [
                Text(
                  character.characterName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Text(
                    character.cosName,
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 配音演员
            if (character.cv.isNotEmpty)
              Text(
                'CV: ${character.cv}',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),

            const SizedBox(height: 12),

            // 描述
            if (character.description.isNotEmpty)
              Text(character.description, style: const TextStyle(fontSize: 14)),

            const SizedBox(height: 12),

            // 技能
            if (character.skill.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.purple.withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.stars, color: Colors.purple, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        character.skill,
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 8),

            // 芯片信息
            if (character.chipName.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.withOpacity(0.3)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.memory, color: Colors.orange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.chipName,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (character.chipDescription.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              character.chipDescription,
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

            // 皮肤列表
            if (character.skinNames.isNotEmpty &&
                character.skinNames.length > 1) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: character.skinNames.map((skinName) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(skinName, style: const TextStyle(fontSize: 12)),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
