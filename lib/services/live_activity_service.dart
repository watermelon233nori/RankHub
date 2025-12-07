import 'dart:io';
import 'package:live_activities/live_activities.dart';
import 'package:rank_hub/services/queue_status_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Live Activity 服务
/// 用于管理 iOS 灵动岛显示排队状态
class LiveActivityService {
  static final LiveActivityService _instance = LiveActivityService._();
  static LiveActivityService get instance => _instance;

  LiveActivityService._();

  // App Group ID，用于主应用和 Widget Extension 间共享数据
  static const String appGroupId = 'group.space.fukakai.rankhub';

  // 存储实时活动开关的键
  static const String _enabledKey = 'live_activity_enabled';
  // 存储是否首次加入队列的键
  static const String _firstTimeJoinKey = 'first_time_join_queue';

  final _liveActivitiesPlugin = LiveActivities();
  String? _activityId;

  /// 初始化 Live Activities
  Future<void> init() async {
    if (!Platform.isIOS) return;

    await _liveActivitiesPlugin.init(
      appGroupId: appGroupId,
      requireNotificationPermission: false,
    );

    try {
      // 检查是否支持 Live Activities
      final areActivitiesEnabled = await _liveActivitiesPlugin
          .areActivitiesEnabled();
      print('📱 Live Activities 支持: $areActivitiesEnabled');
    } catch (e) {
      print('❌ Live Activities 初始化失败: $e');
    }
  }

  /// 获取实时活动开关状态
  Future<bool> isEnabled() async {
    if (!Platform.isIOS) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      // 默认关闭
      return prefs.getBool(_enabledKey) ?? false;
    } catch (e) {
      print('❌ 获取实时活动开关状态失败: $e');
      return false;
    }
  }

  /// 设置实时活动开关状态
  Future<void> setEnabled(bool enabled) async {
    if (!Platform.isIOS) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_enabledKey, enabled);
      print('✅ 设置实时活动开关: $enabled');

      // 如果关闭开关，同时结束所有活动
      if (!enabled) {
        await endAllActivities();
      }
    } catch (e) {
      print('❌ 设置实时活动开关失败: $e');
    }
  }

  /// 检查是否首次加入队列
  Future<bool> isFirstTimeJoin() async {
    if (!Platform.isIOS) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_firstTimeJoinKey) ?? true;
    } catch (e) {
      print('❌ 检查首次加入队列失败: $e');
      return false;
    }
  }

  /// 标记已经不是首次加入队列
  Future<void> markNotFirstTime() async {
    if (!Platform.isIOS) return;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_firstTimeJoinKey, false);
    } catch (e) {
      print('❌ 标记首次加入队列失败: $e');
    }
  }

  /// 创建或更新排队状态的 Live Activity
  Future<void> updateQueueActivity(QueueStatus status) async {
    if (!Platform.isIOS) return;

    // 检查是否开启了实时活动
    final enabled = await isEnabled();
    if (!enabled) {
      print('ℹ️ 实时活动已关闭，跳过更新');
      return;
    }

    try {
      // 数据需要先保存到 SharedPreferences，Widget 通过 UserDefaults 读取
      // live_activities 插件会自动将数据同步到 App Group 的 UserDefaults
      final activityData = {
        'partyName': status.partyName,
        'playerName': status.playerName,
        'position': status.position,
        'totalPeople': status.totalPeople,
        'estimatedWait': status.estimatedWaitMinutes,
        'isPlaying': status.isPlaying,
      };

      if (_activityId == null) {
        // 创建新的 Activity
        // 第一个参数是 activity ID，第二个参数是数据
        _activityId = await _liveActivitiesPlugin.createActivity(
          'queue_${DateTime.now().millisecondsSinceEpoch}', // 生成唯一 ID
          activityData,
        );
        print('✅ 创建 Live Activity: $_activityId');
      } else {
        // 更新现有 Activity
        await _liveActivitiesPlugin.updateActivity(_activityId!, activityData);
        print('🔄 更新 Live Activity: $_activityId');
      }
    } catch (e) {
      print('❌ 更新 Live Activity 失败: $e');
      _activityId = null; // 重置以便下次重新创建
    }
  }

  /// 结束 Live Activity
  Future<void> endActivity() async {
    if (!Platform.isIOS) return;

    try {
      if (_activityId != null) {
        // 如果有活动 ID，尝试结束特定的活动
        await _liveActivitiesPlugin.endActivity(_activityId!);
        print('🛑 结束 Live Activity: $_activityId');
        _activityId = null;
      } else {
        // 如果没有活动 ID（例如应用重启后），结束所有活动
        await _liveActivitiesPlugin.endAllActivities();
        print('🛑 结束所有 Live Activities（无活动ID）');
      }
    } catch (e) {
      print('❌ 结束 Live Activity 失败: $e');
      _activityId = null;
    }
  }

  /// 获取所有活动的 Activities
  Future<Map<String, dynamic>> getAllActivities() async {
    if (!Platform.isIOS) return {};

    try {
      final activities = await _liveActivitiesPlugin.getAllActivities();
      return activities;
    } catch (e) {
      print('❌ 获取 Activities 失败: $e');
      return {};
    }
  }

  /// 结束所有 Activities
  Future<void> endAllActivities() async {
    if (!Platform.isIOS) return;

    try {
      await _liveActivitiesPlugin.endAllActivities();
      print('🛑 结束所有 Live Activities');
      _activityId = null;
    } catch (e) {
      print('❌ 结束所有 Activities 失败: $e');
    }
  }
}
