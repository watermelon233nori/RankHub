import 'package:get/get.dart';
import 'package:rank_hub/services/mai_party_api_service.dart';
import 'package:rank_hub/services/live_activity_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';

/// 排队状态信息
class QueueStatus {
  final String partyName;
  final String playerName;
  final int position;
  final int totalPeople;
  final DateTime lastUpdate;

  QueueStatus({
    required this.partyName,
    required this.playerName,
    required this.position,
    required this.totalPeople,
    required this.lastUpdate,
  });

  /// 是否在上机位置（前两位）
  bool get isPlaying => position <= 2;

  /// 预计等待时间（分钟）
  int get estimatedWaitMinutes {
    if (isPlaying) return 0;

    // 假设双人上机（前2位是一组）
    // 等待人数 = position - 2（减去正在上机的2人）
    final waitingPeople = position - 2;

    // 每组（2人）平均游玩时间 12-15 分钟，取中间值 13.5
    // 如果是奇数位置，还需要加上单人时间 10-12 分钟，取中间值 11
    final fullGroups = waitingPeople ~/ 2;
    final hasRemainder = waitingPeople % 2 == 1;

    double estimatedMinutes = fullGroups * 13.5;
    if (hasRemainder) {
      estimatedMinutes += 11.0;
    }

    return estimatedMinutes.ceil();
  }

  Map<String, dynamic> toJson() => {
    'partyName': partyName,
    'playerName': playerName,
    'position': position,
    'totalPeople': totalPeople,
    'lastUpdate': lastUpdate.toIso8601String(),
  };

  factory QueueStatus.fromJson(Map<String, dynamic> json) => QueueStatus(
    partyName: json['partyName'],
    playerName: json['playerName'],
    position: json['position'],
    totalPeople: json['totalPeople'],
    lastUpdate: DateTime.parse(json['lastUpdate']),
  );
}

/// 排队状态管理器
class QueueStatusManager extends GetxController {
  static QueueStatusManager get instance => Get.find<QueueStatusManager>();

  final _apiService = MaiPartyApiService();
  final queueStatus = Rx<QueueStatus?>(null);
  Timer? _refreshTimer;

  static const String _storageKey = 'queue_status';

  @override
  void onInit() {
    super.onInit();
    _loadSavedStatus();
    _startAutoRefresh();
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }

  /// 加载保存的排队状态
  Future<void> _loadSavedStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonStr = prefs.getString(_storageKey);
      if (jsonStr != null) {
        final json = jsonDecode(jsonStr);
        queueStatus.value = QueueStatus.fromJson(json);
        // 加载后立即刷新一次
        await refreshStatus();
      }
    } catch (e) {
      print('加载排队状态失败: $e');
    }
  }

  /// 保存排队状态
  Future<void> _saveStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (queueStatus.value != null) {
        final jsonStr = jsonEncode(queueStatus.value!.toJson());
        await prefs.setString(_storageKey, jsonStr);

        // 更新 Live Activity
        await LiveActivityService.instance.updateQueueActivity(
          queueStatus.value!,
        );
      } else {
        await prefs.remove(_storageKey);

        // 结束 Live Activity
        await LiveActivityService.instance.endActivity();
      }
    } catch (e) {
      print('保存排队状态失败: $e');
    }
  }

  /// 设置排队状态
  Future<void> setQueueStatus(String partyName, String playerName) async {
    try {
      final queue = await _apiService.getQueue(partyName);
      final position = queue.indexOf(playerName);

      if (position == -1) {
        // 不在队列中
        queueStatus.value = null;
      } else {
        queueStatus.value = QueueStatus(
          partyName: partyName,
          playerName: playerName,
          position: position + 1, // 转换为从1开始
          totalPeople: queue.length,
          lastUpdate: DateTime.now(),
        );
      }

      await _saveStatus();
    } catch (e) {
      print('设置排队状态失败: $e');
      rethrow;
    }
  }

  /// 刷新排队状态
  Future<void> refreshStatus() async {
    final current = queueStatus.value;
    if (current == null) return;

    try {
      await setQueueStatus(current.partyName, current.playerName);
    } catch (e) {
      print('刷新排队状态失败: $e');
    }
  }

  /// 清除排队状态
  Future<void> clearStatus() async {
    queueStatus.value = null;
    await _saveStatus();
  }

  /// 启动自动刷新（每30秒）
  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (queueStatus.value != null) {
        refreshStatus();
      }
    });
  }
}
