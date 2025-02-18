import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/model/maimai/song_score.dart';
import 'package:rank_hub/src/services/lx_api_services.dart';

class LxMaiPlayHeatMap extends StatefulWidget {
  final PlayerData playerData;

  const LxMaiPlayHeatMap({super.key, required this.playerData});

  @override
  _LxMaiPlayHeatMapState createState() => _LxMaiPlayHeatMapState();
}

class _LxMaiPlayHeatMapState extends State<LxMaiPlayHeatMap> {
  late Box<Map<dynamic, dynamic>> heatmapBox;
  late Box<DateTime> lastUpdateBox;

  int totalPlayCount = 0;

  @override
  void initState() {
    super.initState();
    _initHive().then((_) {
      _updateTotalPlayCount();
    });
  }

  Future<void> _initHive() async {
    heatmapBox = await Hive.openBox<Map<dynamic, dynamic>>('playStatsData');
    lastUpdateBox = await Hive.openBox<DateTime>('lastUpdate');
    setState(() {}); // 触发 UI 更新
  }

  Future<void> _updateTotalPlayCount() async {
    Map<DateTime, int> processedData = await _loadAndProcessData();

    int newTotalPlayCount =
        processedData.values.fold(0, (sum, count) => sum + count);

    setState(() {
      totalPlayCount = newTotalPlayCount;
    });
  }

  Future<Map<DateTime, int>> _loadAndProcessData() async {
    Map<DateTime, List<DateTime>> existingData = {};
    if (heatmapBox.isNotEmpty) {
      existingData = (heatmapBox.get(widget.playerData.uuid))?.map(
              (key, value) =>
                  MapEntry(DateTime.parse(key), List<DateTime>.from(value))) ??
          {};
    }

    DateTime? lastUpdate =
        lastUpdateBox.get('HeatMapLastUpdate_${widget.playerData.uuid}');
    if (lastUpdate != null && lastUpdate.day == DateTime.now().day) {
      return _convertToDailyCount(existingData);
    }

    List<SongScore> records = await LxApiService.getRecentRecords(
        widget.playerData.friendCode.toString());
    if (records.isEmpty) return _convertToDailyCount(existingData);

    DateTime? latestDate;
    if (existingData.isNotEmpty) {
      latestDate = existingData.keys.reduce((a, b) => a.isAfter(b) ? a : b);
    }

    Map<DateTime, List<DateTime>> newData = {};
    for (var record in records) {
      if (record.playTime == null) continue;

      DateTime dateTime = DateTime.parse(record.playTime!).toLocal();
      DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);

      if (latestDate == null ||
          date.isAfter(latestDate) ||
          date == latestDate) {
        newData.update(date, (list) => list..add(dateTime),
            ifAbsent: () => [dateTime]);
      }
    }

    // 合并数据
    newData.forEach((date, times) {
      existingData.update(date, (list) => list..addAll(times),
          ifAbsent: () => times);
    });

    await heatmapBox.put(
      widget.playerData.uuid,
      existingData.map((key, value) => MapEntry(key.toIso8601String(), value)),
    );

    await lastUpdateBox.put(
        'HeatMapLastUpdate_${widget.playerData.uuid}', DateTime.now());

    return _convertToDailyCount(existingData);
  }

  Map<DateTime, int> _convertToDailyCount(Map<DateTime, List<DateTime>> data) {
    return data.map((date, times) => MapEntry(date, times.length));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '游玩统计',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$totalPlayCount 首曲目',
                        style: TextStyle(fontSize: 24),
                      ),
                      SizedBox(height: 8),
                      Text(
                          '截至 ${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: FutureBuilder<Map<DateTime, int>>(
              future: _loadAndProcessData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text("加载中...", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error, size: 48),
                        const SizedBox(height: 8),
                        const Text("加载失败，请重试", style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(snapshot.error.toString(),
                            style: const TextStyle(
                                fontSize: 12, color: Colors.red),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text("暂无记录", style: TextStyle(fontSize: 16)),
                  );
                }

                return HeatMap(
                  defaultColor: Theme.of(context).highlightColor
                    ..withValues(alpha: 0.1),
                  datasets: snapshot.data!,
                  colorMode: ColorMode.opacity,
                  scrollable: true,
                  colorsets: const {1: Colors.indigo},
                  onClick: (value) {
                    if (snapshot.data![value] == null) return;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          "日期: ${value.year}-${value.month}-${value.day} \n游玩次数: ${snapshot.data![value]}"),
                      duration: const Duration(seconds: 2),
                    ));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
