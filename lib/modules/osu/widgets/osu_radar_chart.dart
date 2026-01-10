import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OsuRadarChart extends StatelessWidget {
  final double hp;
  final double od;
  final double cs;
  final double ar;
  final double length;
  final Color color;
  final bool showLength;

  const OsuRadarChart({
    super.key,
    required this.hp,
    required this.od,
    required this.cs,
    required this.ar,
    required this.length,
    required this.color,
    this.showLength = true,
  });

  @override
  Widget build(BuildContext context) {
    // Normalize values to be visible on chart (assuming max ~10-12)
    // CS, AR, OD, HP are 0-10.
    // Length: 0-5 minutes (300 seconds) mapped to 0-10.
    // We'll use a max of 10 for the chart grid.

    const double maxVal = 10.0;

    // Map length (seconds) to 0-10 scale. 300s (5min) -> 10.
    final double normalizedLength = (length / 300.0) * 10.0;

    final List<RadarEntry> entries = [
      RadarEntry(value: hp.clamp(0, maxVal)),
      RadarEntry(value: od.clamp(0, maxVal)),
      RadarEntry(value: cs.clamp(0, maxVal)),
      RadarEntry(value: ar.clamp(0, maxVal)),
    ];

    if (showLength) {
      entries.add(RadarEntry(value: normalizedLength.clamp(0, maxVal)));
    }

    // Add a placeholder dataset to force the scale to 0-10
    final List<RadarEntry> maxEntries = List.generate(
      entries.length,
      (index) => const RadarEntry(value: maxVal),
    );

    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(enabled: false),
        dataSets: [
          // Invisible max value dataset to fix scale
          RadarDataSet(
            fillColor: Colors.transparent,
            borderColor: Colors.transparent,
            entryRadius: 0,
            dataEntries: maxEntries,
            borderWidth: 0,
          ),
          // Actual data
          RadarDataSet(
            fillColor: color.withOpacity(0.2),
            borderColor: color,
            entryRadius: 3,
            dataEntries: entries,
            borderWidth: 2,
          ),
        ],
        radarBackgroundColor: Colors.transparent,
        borderData: FlBorderData(show: false),
        radarBorderData: const BorderSide(color: Colors.transparent),
        titlePositionPercentageOffset: 0.1,
        titleTextStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        getTitle: (index, angle) {
          switch (index) {
            case 0:
              return const RadarChartTitle(text: '血量(HP)');
            case 1:
              return const RadarChartTitle(text: '准度(OD)');
            case 2:
              return const RadarChartTitle(text: '大小(CS)');
            case 3:
              return const RadarChartTitle(text: '速度(AR)');
            case 4:
              return const RadarChartTitle(text: '时长');
            default:
              return const RadarChartTitle(text: '');
          }
        },
        tickCount: 1,
        ticksTextStyle: const TextStyle(
          color: Colors.transparent,
          fontSize: 10,
        ),
        tickBorderData: const BorderSide(color: Colors.transparent),
        gridBorderData: BorderSide(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }
}
