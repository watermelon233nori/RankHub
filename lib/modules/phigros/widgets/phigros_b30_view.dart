import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/modules/phigros/phigros_controller.dart';
import 'package:rank_hub/modules/phigros/widgets/phigros_record_list_item.dart';
import 'package:rank_hub/controllers/account_controller.dart';
import 'package:rank_hub/models/phigros/game_record.dart';

/// Phigros B30成绩视图
class PhigrosB30View extends StatefulWidget {
  const PhigrosB30View({super.key});

  @override
  State<PhigrosB30View> createState() => _PhigrosB30ViewState();
}

class _PhigrosB30ViewState extends State<PhigrosB30View> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<PhigrosController>();
    final accountController = Get.find<AccountController>();

    // 延迟加载成绩
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (accountController.currentAccount != null) {
        controller.loadRecords(accountController.currentAccount!.id.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PhigrosController>();
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final b30Records = controller.getB30Records();

      if (b30Records.isEmpty) {
        return RefreshIndicator(
          onRefresh: () async {
            final accountController = Get.find<AccountController>();
            if (accountController.currentAccount != null) {
              await controller.loadRecords(
                accountController.currentAccount!.id.toString(),
                forceRefresh: true,
              );
            }
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.music_off,
                      size: 64,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '暂无成绩数据',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          final accountController = Get.find<AccountController>();
          if (accountController.currentAccount != null) {
            await controller.loadRecords(
              accountController.currentAccount!.id.toString(),
              forceRefresh: true,
            );
          }
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(bottom: 100),
          itemCount:
              1 + // player info card
              2 + // 2 section headers
              (b30Records['phi']?.length ?? 0) +
              (b30Records['best']?.length ?? 0),
          itemBuilder: (context, index) {
            // Player info card
            if (index == 0) {
              return _buildPlayerInfoCard(context, controller.records);
            }

            // P1-P3 section
            if (index == 1) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: const Text(
                        'P1-P3',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Phi评级歌曲前三',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // P1, P2, P3
            if (index >= 2 && index <= 4) {
              final recordIndex = index - 2;
              if (recordIndex < (b30Records['phi']?.length ?? 0)) {
                return PhigrosRecordListItem(
                  record: b30Records['phi']![recordIndex],
                );
              }
              return const SizedBox.shrink();
            }

            // B1-B27 section header
            final phiCount = b30Records['phi']?.length ?? 0;
            if (index == 2 + phiCount) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.purple),
                      ),
                      child: const Text(
                        'B1-B27',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '剩余最佳成绩',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // B1-B27
            if (index >= 3 + phiCount) {
              final recordIndex = index - 3 - phiCount;
              if (recordIndex < (b30Records['best']?.length ?? 0)) {
                return PhigrosRecordListItem(
                  record: b30Records['best']![recordIndex],
                );
              }
            }

            return const SizedBox.shrink();
          },
        ),
      );
    });
  }

  Widget _buildPlayerInfoCard(
    BuildContext context,
    List<PhigrosGameRecord> records,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.find<PhigrosController>();

    if (records.isEmpty) {
      return const SizedBox.shrink();
    }

    // 计算统计数据
    final stats = _calculateStats(records);

    // 从 controller 获取进度数据（用于显示挑战模式）
    final summary = controller.playerSummary.value;

    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RKS 和课题模式
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RKS',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stats.totalRks.toStringAsFixed(2),
                      style: textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // 挑战模式信息
                if (summary != null && summary.challengeModeRank > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _getChallengeColor(
                        summary.challengeRankLevel,
                      ).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _getChallengeColor(summary.challengeRankLevel),
                      ),
                    ),
                    child: Text(
                      summary.challengeDifficulty.toString(),
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getChallengeColor(summary.challengeRankLevel),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 12),
            // 各难度统计
            Row(
              children: [
                Expanded(
                  child: _buildDifficultyStats(
                    'EZ',
                    stats.ezCount,
                    colorScheme,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyStats(
                    'HD',
                    stats.hdCount,
                    colorScheme,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyStats(
                    'IN',
                    stats.inCount,
                    colorScheme,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyStats(
                    'AT',
                    stats.atCount,
                    colorScheme,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // FC 和 Phi 统计
            Row(
              children: [
                Expanded(
                  child: _buildStatChip(
                    'FC',
                    stats.fcCount,
                    Colors.blue,
                    colorScheme,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildStatChip(
                    'Phi',
                    stats.phiCount,
                    Colors.amber,
                    colorScheme,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDifficultyStats(
    String level,
    int count,
    ColorScheme colorScheme,
  ) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            level,
            style: textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            count.toString(),
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(
    String label,
    int count,
    Color color,
    ColorScheme colorScheme,
  ) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            count.toString(),
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  /// 从记录列表计算统计数据
  _PlayerStats _calculateStats(List<PhigrosGameRecord> records) {
    // 计算B19（Best 19，取RKS最高的19首）
    final sortedRecords = List<PhigrosGameRecord>.from(records)
      ..sort((a, b) => b.rks.compareTo(a.rks));

    final b19Records = sortedRecords.take(19).toList();
    final b19Sum = b19Records.fold<double>(
      0.0,
      (sum, record) => sum + record.rks,
    );
    final b19Average = b19Records.isNotEmpty ? b19Sum / b19Records.length : 0.0;

    // 统计各种数据
    int phiCount = 0;
    int fcCount = 0;
    int ezCount = 0;
    int hdCount = 0;
    int inCount = 0;
    int atCount = 0;

    for (final record in records) {
      if (record.score >= 1000000) phiCount++;
      if (record.fc) fcCount++;

      switch (record.level) {
        case 'EZ':
          ezCount++;
          break;
        case 'HD':
          hdCount++;
          break;
        case 'IN':
          inCount++;
          break;
        case 'AT':
          atCount++;
          break;
      }
    }

    return _PlayerStats(
      totalRks: b19Average,
      phiCount: phiCount,
      fcCount: fcCount,
      ezCount: ezCount,
      hdCount: hdCount,
      inCount: inCount,
      atCount: atCount,
    );
  }

  Color _getChallengeColor(int level) {
    switch (level) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.red;
      case 4:
        return Colors.amber;
      case 5:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }
}

/// 玩家统计数据辅助类
class _PlayerStats {
  final double totalRks;
  final int phiCount;
  final int fcCount;
  final int ezCount;
  final int hdCount;
  final int inCount;
  final int atCount;

  _PlayerStats({
    required this.totalRks,
    required this.phiCount,
    required this.fcCount,
    required this.ezCount,
    required this.hdCount,
    required this.inCount,
    required this.atCount,
  });
}
