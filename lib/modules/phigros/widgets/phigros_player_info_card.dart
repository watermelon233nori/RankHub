import 'package:flutter/material.dart';
import 'package:rank_hub/models/phigros/player_summary.dart';

/// Phigros 玩家信息卡片
class PhigrosPlayerInfoCard extends StatelessWidget {
  final PhigrosPlayerSummary summary;

  const PhigrosPlayerInfoCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // RKS 信息
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
                      summary.totalRks.toStringAsFixed(2),
                      style: textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'B19 平均',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      summary.b19AverageRks.toStringAsFixed(2),
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            // 挑战模式信息
            if (summary.challengeModeRank > 0) ...[
              Row(
                children: [
                  Icon(
                    Icons.military_tech,
                    color: _getChallengeColor(summary.challengeRankLevel),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '挑战模式',
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
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
                      summary.challengeRankDescription,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getChallengeColor(summary.challengeRankLevel),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),
            ],
            // 统计信息
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  context,
                  'Phi',
                  summary.phiCount.toString(),
                  Colors.amber,
                ),
                _buildStatItem(
                  context,
                  'FC',
                  summary.fcCount.toString(),
                  Colors.green,
                ),
                _buildStatItem(
                  context,
                  '游玩',
                  summary.totalSongsPlayed.toString(),
                  Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 16),
            // 难度统计
            Row(
              children: [
                Expanded(
                  child: _buildDifficultyBar(
                    context,
                    'EZ',
                    summary.ezCount,
                    Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyBar(
                    context,
                    'HD',
                    summary.hdCount,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyBar(
                    context,
                    'IN',
                    summary.inCount,
                    Colors.red,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildDifficultyBar(
                    context,
                    'AT',
                    summary.atCount,
                    Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    Color color,
  ) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          value,
          style: textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildDifficultyBar(
    BuildContext context,
    String label,
    int count,
    Color color,
  ) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
