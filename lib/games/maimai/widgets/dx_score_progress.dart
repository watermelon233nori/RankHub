import 'package:flutter/material.dart';

/// DX Score 进度条组件
class DxScoreProgress extends StatelessWidget {
  final int currentDxScore; // 当前 DX 分数
  final int totalNotes; // 总物量

  const DxScoreProgress({
    super.key,
    required this.currentDxScore,
    required this.totalNotes,
  });

  @override
  Widget build(BuildContext context) {
    // 计算最大 DX 分数（总物量 × 3）
    final maxDxScore = totalNotes * 3;

    // 计算百分比
    final percentage = maxDxScore > 0
        ? (currentDxScore / maxDxScore) * 100
        : 0.0;

    // 计算星级
    final stars = _calculateStars(percentage);

    // 根据星级获取颜色
    final color = _getColorByStars(stars);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'DX Score',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              '$currentDxScore / $maxDxScore',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${percentage.toStringAsFixed(2)}%',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            if (stars > 0) ...[
              const SizedBox(width: 4),
              Text("✦", style: TextStyle(fontSize: 14, color: color)),
              Text(
                '$stars',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Theme.of(
              context,
            ).colorScheme.surfaceContainerHighest,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

  /// 计算星级
  int _calculateStars(double percentage) {
    if (percentage >= 97.0) return 5;
    if (percentage >= 95.0) return 4;
    if (percentage >= 93.0) return 3;
    if (percentage >= 90.0) return 2;
    if (percentage >= 85.0) return 1;
    return 0;
  }

  /// 根据星级获取颜色
  Color _getColorByStars(int stars) {
    switch (stars) {
      case 5:
        return Colors.amber; // 黄色 ✦5
      case 4:
      case 3:
        return Colors.orange; // 橙色 ✦3-4
      case 2:
      case 1:
        return Colors.green; // 绿色 ✦1-2
      default:
        return Colors.grey; // 灰色 无星
    }
  }
}
