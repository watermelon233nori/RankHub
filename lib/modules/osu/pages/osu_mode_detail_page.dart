import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

/// osu! 模式详细数据页面
class OsuModeDetailPage extends StatelessWidget {
  final String modeName;
  final String modeId;
  final Map<String, dynamic> stats;
  final String username;
  final String? avatarUrl;

  const OsuModeDetailPage({
    super.key,
    required this.modeName,
    required this.modeId,
    required this.stats,
    required this.username,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final modeColor = _getModeColor(modeId);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('$modeName Stats'),
        backgroundColor: modeColor.withOpacity(0.1),
        foregroundColor: modeColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 头部概览
            _buildHeader(context, modeColor),
            const SizedBox(height: 24),

            // 核心数据网格
            _buildCoreStatsGrid(context, modeColor),
            const SizedBox(height: 24),

            // 等级进度
            _buildLevelProgress(context, modeColor),
            const SizedBox(height: 24),

            // 评价统计 (Grade Counts)
            _buildGradeCounts(context, modeColor),
            const SizedBox(height: 24),

            // 命中统计 (Hit Counts)
            _buildHitCounts(context, modeColor),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Color modeColor) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: modeColor, width: 2),
            image: avatarUrl != null
                ? DecorationImage(
                    image: NetworkImage(avatarUrl!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: avatarUrl == null
              ? Icon(Icons.person, size: 40, color: modeColor)
              : null,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: modeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  modeName.toUpperCase(),
                  style: TextStyle(
                    color: modeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCoreStatsGrid(BuildContext context, Color modeColor) {
    final pp = (stats['pp'] as num?)?.toDouble() ?? 0;
    final accuracy = (stats['hit_accuracy'] as num?)?.toDouble() ?? 0;
    final playCount = stats['play_count'] as int? ?? 0;
    final maxCombo = stats['maximum_combo'] as int? ?? 0;
    final rank = stats['global_rank'] as int?;
    final totalScore = stats['total_score'] as int? ?? 0;

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: [
        _buildStatCard(context, 'PP', pp.toStringAsFixed(0), Icons.emoji_events, modeColor),
        _buildStatCard(context, 'Global Rank', rank != null ? '#$rank' : '-', Icons.public, modeColor),
        _buildStatCard(context, 'Accuracy', '${accuracy.toStringAsFixed(2)}%', Icons.show_chart, modeColor),
        _buildStatCard(context, 'Play Count', NumberFormat.compact().format(playCount), Icons.play_arrow, modeColor),
        _buildStatCard(context, 'Max Combo', '$maxCombo x', Icons.numbers, modeColor),
        _buildStatCard(context, 'Total Score', NumberFormat.compact().format(totalScore), Icons.score, modeColor),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color.withOpacity(0.8)),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildLevelProgress(BuildContext context, Color modeColor) {
    final level = stats['level'] as Map<String, dynamic>?;
    final currentLevel = level?['current'] as int? ?? 0;
    final progress = level?['progress'] as int? ?? 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [modeColor.withOpacity(0.8), modeColor.withOpacity(0.6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: modeColor.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level $currentLevel',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$progress%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.black12,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradeCounts(BuildContext context, Color modeColor) {
    final grades = stats['grade_counts'] as Map<String, dynamic>? ?? {};
    final ss = grades['ss'] as int? ?? 0;
    final ssh = grades['ssh'] as int? ?? 0;
    final s = grades['s'] as int? ?? 0;
    final sh = grades['sh'] as int? ?? 0;
    final a = grades['a'] as int? ?? 0;

    final totalSS = ss + ssh;
    final totalS = s + sh;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Grades',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildGradeItem(context, 'SS', totalSS, Colors.grey, Colors.amber), // Silver/Gold merged visual
            _buildGradeItem(context, 'S', totalS, Colors.orange, Colors.amber),
            _buildGradeItem(context, 'A', a, Colors.green, Colors.greenAccent),
          ],
        ),
      ],
    );
  }

  Widget _buildGradeItem(BuildContext context, String label, int count, Color color1, Color color2) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white, 
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          count.toString(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildHitCounts(BuildContext context, Color modeColor) {
    final count300 = stats['count_300'] as int? ?? 0;
    final count100 = stats['count_100'] as int? ?? 0;
    final count50 = stats['count_50'] as int? ?? 0;
    final countMiss = stats['count_miss'] as int? ?? 0;
    final totalHits = stats['total_hits'] as int? ?? 1; // Avoid division by zero

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hit Distribution',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.5,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 40,
              sections: [
                if (count300 > 0)
                  PieChartSectionData(
                    color: Colors.blueAccent,
                    value: count300.toDouble(),
                    title: '300',
                    radius: 50,
                    titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                if (count100 > 0)
                  PieChartSectionData(
                    color: Colors.greenAccent,
                    value: count100.toDouble(),
                    title: '100',
                    radius: 45,
                    titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                if (count50 > 0)
                  PieChartSectionData(
                    color: Colors.orangeAccent,
                    value: count50.toDouble(),
                    title: '50',
                    radius: 40,
                    titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                if (countMiss > 0)
                  PieChartSectionData(
                    color: Colors.redAccent,
                    value: countMiss.toDouble(),
                    title: 'Miss',
                    radius: 35,
                    titleStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildHitLegend(context, '300', count300, Colors.blueAccent),
        _buildHitLegend(context, '100', count100, Colors.greenAccent),
        _buildHitLegend(context, '50', count50, Colors.orangeAccent),
        _buildHitLegend(context, 'Miss', countMiss, Colors.redAccent),
      ],
    );
  }

  Widget _buildHitLegend(BuildContext context, String label, int value, Color color) {
    if (value == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 8),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          Text(NumberFormat.compact().format(value), style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Color _getModeColor(String mode) {
    switch (mode) {
      case 'osu':
        return Colors.pinkAccent;
      case 'taiko':
        return Colors.teal;
      case 'fruits':
        return Colors.orange; // catch
      case 'mania':
        return Colors.purpleAccent;
      default:
        return Colors.pinkAccent;
    }
  }
}
