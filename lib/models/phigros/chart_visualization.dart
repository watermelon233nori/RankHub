import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/models/phigros/chart.dart';

/// Phigros 谱面可视化组件
class PhigrosChartVisualization extends StatelessWidget {
  final PhigrosChart chart;
  final double height;
  final bool showLegend;

  const PhigrosChartVisualization({
    super.key,
    required this.chart,
    this.height = 300,
    this.showLegend = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLegend) _buildLegend(),
        if (showLegend) const SizedBox(height: 16),
        SizedBox(height: height, child: _buildChart()),
      ],
    );
  }

  Widget _buildLegend() {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _LegendItem(color: Colors.blue, label: 'Tap', count: chart.tapCount),
        _LegendItem(
          color: Colors.yellow,
          label: 'Drag',
          count: chart.dragCount,
        ),
        _LegendItem(color: Colors.green, label: 'Hold', count: chart.holdCount),
        _LegendItem(
          color: Colors.pink,
          label: 'Flick',
          count: chart.flickCount,
        ),
      ],
    );
  }

  Widget _buildChart() {
    final timeDistribution = _calculateTimeDistribution();

    if (timeDistribution.isEmpty) {
      return const Center(child: Text('暂无数据'));
    }

    // 计算最大 note 数量
    final maxNoteCount = timeDistribution.values
        .map((data) {
          return data['tap']! + data['drag']! + data['hold']! + data['flick']!;
        })
        .reduce((a, b) => a > b ? a : b);

    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxNoteCount * 1.2,
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Colors.black87,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final time = timeDistribution.keys.elementAt(groupIndex);
                final data = timeDistribution[time]!;
                return BarTooltipItem(
                  '时间: ${time.toStringAsFixed(1)}s\n',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Tap: ${data['tap']}\n',
                      style: const TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                    TextSpan(
                      text: 'Drag: ${data['drag']}\n',
                      style: const TextStyle(
                        color: Colors.yellow,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: 'Hold: ${data['hold']}\n',
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                    TextSpan(
                      text: 'Flick: ${data['flick']}',
                      style: const TextStyle(color: Colors.pink, fontSize: 12),
                    ),
                  ],
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  // 只显示 0 和最大值
                  final maxTime = timeDistribution.keys.isEmpty
                      ? 0
                      : timeDistribution.keys.reduce((a, b) => a > b ? a : b);

                  if (value == 0 || value == maxTime.toInt()) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '${value.toInt()}s',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  );
                },
              ),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 10,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
              left: BorderSide(color: Colors.grey.withOpacity(0.3)),
            ),
          ),
          barGroups: _buildBarGroups(timeDistribution),
        ),
      ),
    );
  }

  /// 计算时间分布（按秒分组）
  Map<double, Map<String, int>> _calculateTimeDistribution() {
    final distribution = <double, Map<String, int>>{};

    for (final judgeLine in chart.judgeLineList) {
      final bpm = judgeLine.bpm;

      // 处理上方音符
      for (final note in judgeLine.notesAbove) {
        // time 是 1/32 拍为单位，转换为秒: (time / 32) * (60 / bpm)
        final realTime = (note.time / 32) * (60 / bpm);
        final timeSlot = realTime.floorToDouble(); // 转换为秒并向下取整
        distribution.putIfAbsent(
          timeSlot,
          () => {'tap': 0, 'drag': 0, 'hold': 0, 'flick': 0},
        );

        final noteType = NoteType.fromValue(note.type);
        switch (noteType) {
          case NoteType.tap:
            distribution[timeSlot]!['tap'] =
                (distribution[timeSlot]!['tap'] ?? 0) + 1;
            break;
          case NoteType.drag:
            distribution[timeSlot]!['drag'] =
                (distribution[timeSlot]!['drag'] ?? 0) + 1;
            break;
          case NoteType.hold:
            distribution[timeSlot]!['hold'] =
                (distribution[timeSlot]!['hold'] ?? 0) + 1;
            break;
          case NoteType.flick:
            distribution[timeSlot]!['flick'] =
                (distribution[timeSlot]!['flick'] ?? 0) + 1;
            break;
        }
      }

      // 处理下方音符
      for (final note in judgeLine.notesBelow) {
        // time 是 1/32 拍为单位，转换为秒: (time / 32) * (60 / bpm)
        final realTime = (note.time / 32) * (60 / bpm);
        final timeSlot = realTime.floorToDouble();
        distribution.putIfAbsent(
          timeSlot,
          () => {'tap': 0, 'drag': 0, 'hold': 0, 'flick': 0},
        );

        final noteType = NoteType.fromValue(note.type);
        switch (noteType) {
          case NoteType.tap:
            distribution[timeSlot]!['tap'] =
                (distribution[timeSlot]!['tap'] ?? 0) + 1;
            break;
          case NoteType.drag:
            distribution[timeSlot]!['drag'] =
                (distribution[timeSlot]!['drag'] ?? 0) + 1;
            break;
          case NoteType.hold:
            distribution[timeSlot]!['hold'] =
                (distribution[timeSlot]!['hold'] ?? 0) + 1;
            break;
          case NoteType.flick:
            distribution[timeSlot]!['flick'] =
                (distribution[timeSlot]!['flick'] ?? 0) + 1;
            break;
        }
      }
    }

    // 填充空白时间段，确保显示完整时长
    if (distribution.isNotEmpty) {
      final maxTime = distribution.keys.reduce((a, b) => a > b ? a : b);
      for (double i = 0; i <= maxTime; i++) {
        distribution.putIfAbsent(
          i,
          () => {'tap': 0, 'drag': 0, 'hold': 0, 'flick': 0},
        );
      }
    }

    return Map.fromEntries(
      distribution.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
  }

  /// 构建柱状图数据组
  List<BarChartGroupData> _buildBarGroups(
    Map<double, Map<String, int>> distribution,
  ) {
    return distribution.entries.map((entry) {
      final time = entry.key;
      final data = entry.value;

      return BarChartGroupData(
        x: time.toInt(),
        barRods: [
          BarChartRodData(
            toY: (data['tap']! + data['drag']! + data['hold']! + data['flick']!)
                .toDouble(),
            rodStackItems: [
              BarChartRodStackItem(0, data['tap']!.toDouble(), Colors.blue),
              BarChartRodStackItem(
                data['tap']!.toDouble(),
                (data['tap']! + data['drag']!).toDouble(),
                Colors.yellow,
              ),
              BarChartRodStackItem(
                (data['tap']! + data['drag']!).toDouble(),
                (data['tap']! + data['drag']! + data['hold']!).toDouble(),
                Colors.green,
              ),
              BarChartRodStackItem(
                (data['tap']! + data['drag']! + data['hold']!).toDouble(),
                (data['tap']! + data['drag']! + data['hold']! + data['flick']!)
                    .toDouble(),
                Colors.pink,
              ),
            ],
            width: 4,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ],
      );
    }).toList();
  }
}

/// 图例项组件
class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final int count;

  const _LegendItem({
    required this.color,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$label: $count',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
