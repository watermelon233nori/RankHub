import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

// 全局音频播放管理器，确保同一时间只有一个播放
class BeatmapPreviewManager {
  static final AudioPlayer _player = AudioPlayer();
  static int? _currentPlayingSid;
  static Function(int)? _onStopCallback;

  static Future<void> play(int sid, String url, VoidCallback onStop) async {
    if (_currentPlayingSid != null && _currentPlayingSid != sid) {
      await stop();
    }

    _currentPlayingSid = sid;
    _onStopCallback = (stoppedSid) {
      if (stoppedSid == sid) onStop();
    };

    // 设置播放完成回调
    _player.onPlayerComplete.listen((_) {
      if (_currentPlayingSid == sid) {
        stop();
      }
    });

    await _player.play(UrlSource(url));
  }

  static Future<void> stop() async {
    await _player.stop();
    if (_currentPlayingSid != null && _onStopCallback != null) {
      _onStopCallback!(_currentPlayingSid!);
    }
    _currentPlayingSid = null;
    _onStopCallback = null;
  }

  static bool isPlaying(int sid) => _currentPlayingSid == sid;
}
