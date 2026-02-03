import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KaleidxscopeProgressController extends GetxController {
  static const String _storageKeyPrefix = 'kaleidxscope_progress_v2_';

  // 使用 RxMap 存储进度，Key 为 title (天际线名称)
  // Value 为已完成的 songId 集合
  final RxMap<String, Set<int>> _progress = <String, Set<int>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProgress();
  }

  /// 加载所有进度
  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((key) => key.startsWith(_storageKeyPrefix));

    for (final key in keys) {
      final String title = key.substring(_storageKeyPrefix.length);
      final List<String>? completedIds = prefs.getStringList(key);
      if (completedIds != null) {
        _progress[title] = completedIds.map((e) => int.parse(e)).toSet();
      }
    }
  }

  /// 检查歌曲是否已完成
  bool isCompleted(String title, int songId) {
    return _progress[title]?.contains(songId) ?? false;
  }

  /// 切换完成状态
  Future<void> toggleCompletion(String title, int songId) async {
    final currentSet = _progress[title] ?? <int>{};
    
    if (currentSet.contains(songId)) {
      currentSet.remove(songId);
    } else {
      currentSet.add(songId);
    }
    
    // 触发响应式更新
    _progress[title] = Set.from(currentSet);
    
    // 持久化
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      '$_storageKeyPrefix$title',
      currentSet.map((e) => e.toString()).toList(),
    );
  }

  /// 获取已完成数量
  int getCompletedCount(String title) {
    return _progress[title]?.length ?? 0;
  }

  /// 获取总进度
  double getProgress(String title, List<int> totalSongIds) {
    if (totalSongIds.isEmpty) return 0;
    final completed = _progress[title]?.where((id) => totalSongIds.contains(id)).length ?? 0;
    return completed / totalSongIds.length;
  }
}
