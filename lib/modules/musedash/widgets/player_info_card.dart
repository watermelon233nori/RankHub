import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/models/musedash/musedash_player.dart';
import 'package:rank_hub/modules/musedash/services/musedash_player_api_service.dart';

/// 玩家信息卡片
class PlayerInfoCard extends StatefulWidget {
  final MuseDashPlayer player;

  const PlayerInfoCard({super.key, required this.player});

  @override
  State<PlayerInfoCard> createState() => _PlayerInfoCardState();
}

class _PlayerInfoCardState extends State<PlayerInfoCard> {
  final _apiService = MuseDashPlayerApiService.instance;
  List<RlHistoryPoint> _historyData = [];
  bool _isLoading = true;
  String? _error;
  bool _showFilteredData = true; // 默认显示过滤后的数据

  @override
  void initState() {
    super.initState();
    _loadHistoryData();
  }

  Future<void> _loadHistoryData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final data = await _apiService.fetchDiffHistory(
        widget.player.userUuid,
        start: 0,
        length: widget.player.diffHistoryNumber,
      );

      setState(() {
        _historyData = data;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 玩家基本信息
            _buildPlayerInfo(theme),
            const SizedBox(height: 24),

            // RL 趋势图
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'RL 趋势',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // 切换按钮
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _showFilteredData = !_showFilteredData;
                    });
                  },
                  icon: Icon(
                    _showFilteredData ? Icons.filter_alt : Icons.filter_alt_off,
                    size: 18,
                  ),
                  label: Text(
                    _showFilteredData ? '已过滤' : '原始数据',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (_error != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: colorScheme.error,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text('加载失败', style: TextStyle(color: colorScheme.error)),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: _loadHistoryData,
                        child: const Text('重试'),
                      ),
                    ],
                  ),
                ),
              )
            else if (_historyData.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: Text('暂无历史数据'),
                ),
              )
            else
              _buildRlChart(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.player.nickname,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'UUID: ${widget.player.userUuid}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    'RL',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    widget.player.rl.toStringAsFixed(2),
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // 显示排名
                  if (_historyData.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      '#${_historyData.last.rank}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer.withOpacity(
                          0.8,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            _buildStatItem(
              '历史记录',
              widget.player.diffHistoryNumber.toString(),
              theme,
            ),
            _buildStatItem(
              '更新时间',
              _formatDate(widget.player.lastUpdateTime),
              theme,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, ThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$label: ',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} '
        '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  /// 智能过滤异常波动的数据点
  /// 剔除从高位突然大幅下降的异常数据
  List<RlHistoryPoint> _filterAnomalousData(List<RlHistoryPoint> data) {
    if (data.length <= 2) return data;

    // 第一步：找出稳定高位基准
    final checkLength = (data.length * 0.8).toInt();
    double maxValue = 0;
    for (int i = 0; i < checkLength; i++) {
      if (data[i].diff > maxValue) {
        maxValue = data[i].diff;
      }
    }

    final stableValues = <double>[];
    for (int i = 0; i < checkLength; i++) {
      if (data[i].diff >= maxValue * 0.9) {
        stableValues.add(data[i].diff);
      }
    }

    final stableBaseline = stableValues.isEmpty
        ? maxValue
        : stableValues.reduce((a, b) => a + b) / stableValues.length;

    // 第二步：识别并标记"暂时性下降区间"
    final shouldFilter = List<bool>.filled(data.length, false);

    for (int i = 0; i < data.length; i++) {
      final current = data[i];
      final deviationFromBaseline =
          (stableBaseline - current.diff) / stableBaseline;

      // 如果当前点下降超过20%，检查是否为暂时性下降
      if (deviationFromBaseline > 0.2) {
        // 检查后续10天内（或接下来的点）是否恢复到高位
        bool recoversToHigh = false;
        int recoveryIndex = -1;

        // 查找后续数据中的恢复点
        for (int j = i + 1; j < data.length; j++) {
          final futurePoint = data[j];

          // 检查时间间隔（10天 = 864000000毫秒）
          final timeDiff = futurePoint.time - current.time;
          if (timeDiff > 864000000) {
            // 超过10天，停止搜索
            break;
          }

          // 检查是否恢复到高位（距离基准小于10%）
          final futureDeviation =
              (stableBaseline - futurePoint.diff) / stableBaseline;
          if (futureDeviation < 0.1) {
            recoversToHigh = true;
            recoveryIndex = j;
            break;
          }
        }

        if (recoversToHigh && recoveryIndex > 0) {
          // 标记从当前点到恢复点之间的所有低点为需要过滤
          for (int k = i; k < recoveryIndex; k++) {
            final pointDeviation =
                (stableBaseline - data[k].diff) / stableBaseline;
            if (pointDeviation > 0.15) {
              shouldFilter[k] = true;
            }
          }
        }
      }
    }

    // 第三步：构建过滤后的数据
    final filtered = <RlHistoryPoint>[];
    for (int i = 0; i < data.length; i++) {
      if (!shouldFilter[i]) {
        filtered.add(data[i]);
      }
    }

    // 安全检查
    if (filtered.length < data.length * 0.3) {
      print('⚠️ 过滤后数据太少，使用原始数据 (${filtered.length}/${data.length})');
      return data;
    }

    print(
      '✅ 数据过滤完成: ${data.length} → ${filtered.length} (移除 ${data.length - filtered.length} 个异常点)',
    );
    return filtered;
  }

  Widget _buildRlChart(ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final rawData = _historyData;

    print('📊 原始数据点数: ${rawData.length}');

    // 根据开关决定是否过滤数据
    final displayData = _showFilteredData
        ? _filterAnomalousData(rawData)
        : rawData;

    if (_showFilteredData) {
      print('📊 过滤后数据点数: ${displayData.length}');
    }

    // 准备图表数据点
    final spots = <FlSpot>[];
    for (int i = 0; i < displayData.length; i++) {
      spots.add(FlSpot(i.toDouble(), displayData[i].diff));
    }

    // 计算Y轴范围
    final rlValues = displayData.map((e) => e.diff).toList();
    final minRl = rlValues.reduce((a, b) => a < b ? a : b);
    final maxRl = rlValues.reduce((a, b) => a > b ? a : b);
    final rlRange = maxRl - minRl;
    final yMin = (minRl - rlRange * 0.1).floorToDouble();
    final yMax = (maxRl + rlRange * 0.1).ceilToDouble();

    return SizedBox(
      height: 250,
      child: LineChart(
        LineChartData(
          minY: yMin,
          maxY: yMax,
          minX: 0,
          maxX: (displayData.length - 1).toDouble(),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: (yMax - yMin) / 5,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: colorScheme.outlineVariant.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: colorScheme.outlineVariant.withOpacity(0.3),
                strokeWidth: 1,
              );
            },
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                interval: (yMax - yMin) / 5,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toStringAsFixed(0),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  );
                },
              ),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                interval: (displayData.length / 5).ceilToDouble(),
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= 0 &&
                      value.toInt() < displayData.length) {
                    final date = displayData[value.toInt()].dateTime;
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        '${date.month}/${date.day}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: colorScheme.outlineVariant, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: colorScheme.primary,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: displayData.length <= 30, // 数据点少时显示圆点
                getDotPainter: (spot, percent, barData, index) {
                  return FlDotCirclePainter(
                    radius: 4,
                    color: colorScheme.primary,
                    strokeWidth: 2,
                    strokeColor: colorScheme.surface,
                  );
                },
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withOpacity(0.3),
                    colorScheme.primary.withOpacity(0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) =>
                  colorScheme.surfaceContainerHighest,
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final index = spot.x.toInt();
                  if (index >= 0 && index < displayData.length) {
                    final point = displayData[index];
                    return LineTooltipItem(
                      'RL: ${point.diff.toStringAsFixed(2)}\n'
                      '排名: ${point.rank}\n'
                      '${point.dateTime.year}-${point.dateTime.month.toString().padLeft(2, '0')}-${point.dateTime.day.toString().padLeft(2, '0')}',
                      TextStyle(color: colorScheme.onSurface, fontSize: 12),
                    );
                  }
                  return null;
                }).toList();
              },
            ),
            handleBuiltInTouches: true,
          ),
        ),
      ),
    );
  }
}
