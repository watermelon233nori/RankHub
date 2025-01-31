import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rank_hub/src/model/maimai/player_data.dart';
import 'package:rank_hub/src/model/maimai/song_score.dart';
import 'package:rank_hub/src/services/lx_api_services.dart';

class LxMaiPlayHeatMap extends StatefulWidget {
  final PlayerData playerData;

  const LxMaiPlayHeatMap({Key? key, required this.playerData}) : super(key: key);

  @override
  _LxMaiPlayHeatMapState createState() => _LxMaiPlayHeatMapState();
}

class _LxMaiPlayHeatMapState extends State<LxMaiPlayHeatMap> {
  late Box<Map<dynamic, dynamic>> heatmapBox;
  late Box<DateTime> lastUpdateBox;

  @override
  void initState() {
    super.initState();
    _initHive();
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
    heatmapBox = await Hive.openBox<Map<dynamic, dynamic>>('playStatsData');
    setState(() {}); // 触发 UI 更新
  }

  Future<Map<DateTime, int>> _loadAndProcessData() async {
    // 读取 Hive 现有数据
    Map<DateTime, int> existingData = {};
    if (heatmapBox.isNotEmpty) {
      existingData = heatmapBox.get(widget.playerData.uuid)?.map(
            (key, value) => MapEntry(DateTime.parse(key), value),
          ) ?? {};
    }

    DateTime? lastUpdate = lastUpdateBox.get('HeatMapLastUpdate_${widget.playerData.uuid}');
    if (lastUpdate != null && lastUpdate.day == DateTime.now().day) {
      return existingData;
    }


    // 获取数据
    List<SongScore> records = await LxApiService.getRecentRecords(widget.playerData.friendCode.toString());
    if (records.isEmpty) return existingData;

    // 计算最晚日期（如果有数据）
    DateTime? latestDate;
    if (existingData.isNotEmpty) {
      latestDate = existingData.keys.reduce((a, b) => a.isAfter(b) ? a : b);
      existingData.remove(latestDate); // 先删除该日期的数据
    }

    // 统计新数据
    Map<DateTime, int> newData = {};
    for (var record in records) {
      if (record.playTime == null) continue;
      DateTime date = DateTime.parse(record.playTime!).toLocal();
      DateTime key = DateTime(date.year, date.month, date.day); // 仅保留日期

      // 只统计比 latestDate 更新的数据
      if (latestDate == null || key.isAfter(latestDate) || key == latestDate) {
        newData.update(key, (count) => count + 1, ifAbsent: () => 1);
      }
    }

    // 合并数据并存入 Hive
    existingData.addAll(newData);
    await heatmapBox.put(
      widget.playerData.uuid,
      existingData.map((key, value) => MapEntry(key.toIso8601String(), value)),
    );

    return existingData;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<DateTime, int>>(
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
          Icon(Icons.error, size: 48),
          SizedBox(height: 8),
          Text("加载失败，请重试", style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Text(snapshot.error.toString(), style: TextStyle(fontSize: 12, color: Colors.red), textAlign: TextAlign.center),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text("暂无记录", style: TextStyle(fontSize: 16)),
          );
        }

        return HeatMap(
          defaultColor: Theme.of(context).highlightColor.withOpacity(0.1),
          startDate: DateTime(2025),
          endDate: DateTime(2026),
          datasets: snapshot.data!,
          colorMode: ColorMode.opacity,
          showText: false,
          scrollable: true,
          colorsets: {1: Colors.indigo},
        );
      },
    );
  }
}
