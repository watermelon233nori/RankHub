import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/controllers/mai_party_queue_controller.dart';

/// 舞萌排队页面
class MaiPartyQueuePage extends StatelessWidget {
  final String partyName;
  final String? initialPlayerName;

  const MaiPartyQueuePage({
    super.key,
    required this.partyName,
    this.initialPlayerName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // 创建控制器
    final controller = Get.put(
      MaiPartyQueueController(
        partyName: partyName,
        initialPlayerName: initialPlayerName,
      ),
      tag: partyName,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('排队 - $partyName'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.loadQueue,
            tooltip: '刷新',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.queue.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: controller.loadQueue,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 玩家名称输入
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '玩家信息',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListTile(
                        leading: Icon(Icons.person, color: colorScheme.primary),
                        title: const Text('玩家名称'),
                        subtitle: Obx(
                          () => Text(
                            controller.playerName.value.isEmpty
                                ? '未设置'
                                : controller.playerName.value,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        tileColor: colorScheme.surfaceContainerHighest,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // 玩家状态提示
                      Obx(() {
                        final position = controller.getPlayerPosition();
                        if (position == null) {
                          return const SizedBox.shrink();
                        }

                        final isPlaying = position <= 2;
                        return Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isPlaying
                                ? colorScheme.primaryContainer
                                : colorScheme.secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isPlaying ? Icons.videogame_asset : Icons.queue,
                                color: isPlaying
                                    ? colorScheme.onPrimaryContainer
                                    : colorScheme.onSecondaryContainer,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  isPlaying
                                      ? '你在上机位置 (第 $position 位)'
                                      : '你在队列中 (第 $position 位)',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: isPlaying
                                        ? colorScheme.onPrimaryContainer
                                        : colorScheme.onSecondaryContainer,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 操作按钮
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '操作',
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          FilledButton.tonalIcon(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.leaveQueue,
                            icon: const Icon(Icons.remove),
                            label: const Text('退勤'),
                          ),
                          FilledButton.tonalIcon(
                            onPressed:
                                controller.isLoading.value ||
                                    !controller.isPlayerInFirstPosition
                                ? null
                                : controller.completePlay,
                            icon: const Icon(Icons.done),
                            label: const Text('完成上机'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 队列列表
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '队列',
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primaryContainer,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${controller.queue.length} 人',
                              style: textTheme.labelSmall?.copyWith(
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (controller.queue.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.inbox,
                                  size: 48,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '队列为空',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.queue.length,
                          separatorBuilder: (context, index) =>
                              const Divider(height: 1),
                          itemBuilder: (context, index) {
                            final person = controller.queue[index];
                            final position = index + 1;
                            final isPlaying = position <= 2;
                            final isCurrentPlayer =
                                person == controller.playerName.value.trim();

                            return ListTile(
                              leading: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isPlaying
                                      ? colorScheme.primary
                                      : colorScheme.surfaceContainerHighest,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '$position',
                                    style: textTheme.titleMedium?.copyWith(
                                      color: isPlaying
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurfaceVariant,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      person,
                                      style: textTheme.bodyLarge?.copyWith(
                                        fontWeight: isCurrentPlayer
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  if (isPlaying)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorScheme.primary,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '上机中',
                                        style: textTheme.labelSmall?.copyWith(
                                          color: colorScheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  if (isCurrentPlayer && !isPlaying)
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colorScheme.secondaryContainer,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        '我',
                                        style: textTheme.labelSmall?.copyWith(
                                          color:
                                              colorScheme.onSecondaryContainer,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              trailing:
                                  !isCurrentPlayer &&
                                      controller.playerName.value
                                          .trim()
                                          .isNotEmpty
                                  ? IconButton(
                                      icon: const Icon(Icons.arrow_upward),
                                      onPressed: controller.isLoading.value
                                          ? null
                                          : () => controller.changePosition(
                                              person,
                                            ),
                                      tooltip: '插队到此位置',
                                    )
                                  : null,
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
