class Kaleidxscope {
  final String title;
  final String color;
  final String banner;
  final String activeDate;
  final String doorUnlockCondition;
  final KaleidxscopeCondition keyUnlockCondition;
  final KaleidxscopeTrack track1;
  final KaleidxscopeTrack track2;
  final KaleidxscopeTrack track3;
  final String? areaRegx;

  Kaleidxscope({
    required this.title,
    required this.color,
    required this.banner,
    required this.activeDate,
    required this.doorUnlockCondition,
    required this.keyUnlockCondition,
    required this.track1,
    required this.track2,
    required this.track3,
    this.areaRegx,
  });

  factory Kaleidxscope.fromJson(Map<String, dynamic> json) {
    return Kaleidxscope(
      title: json['title'] as String,
      color: json['color'] as String,
      banner: json['banner'] as String,
      activeDate: json['active_date'] as String,
      doorUnlockCondition: json['door_unlock_condition'] as String,
      keyUnlockCondition: KaleidxscopeCondition.fromJson(
        json['key_unlock_condition'],
      ),
      track1: KaleidxscopeTrack.fromJson(json['track1']),
      track2: KaleidxscopeTrack.fromJson(json['track2']),
      track3: KaleidxscopeTrack.fromJson(json['track3']),
      areaRegx: json['area_regx'] as String?,
    );
  }

  /// 获取开启倒计时 (当日 07:00 开启)
  Duration? get countdown {
    final start = DateTime.parse(activeDate);
    final now = DateTime.now();

    // 开启时间为当日 07:00
    final activeTime = DateTime(
      start.year,
      start.month,
      start.day,
      7,
      0,
      0,
    );

    if (now.isBefore(activeTime)) {
      return activeTime.difference(now);
    }
    return null;
  }

  /// 是否已开启
  bool get isActive {
    final cd = countdown;
    return cd == null;
  }

  /// 计算自开放以来的天数 (基于凌晨 4:00 切换)
  int get daysSinceActive {
    final start = DateTime.parse(activeDate);
    final now = DateTime.now();

    // 将当前时间调整到北京时间 4:00 切换逻辑
    // 如果当前时间早于 4:00，则算作前一天
    var effectiveNow = now;
    if (now.hour < 4) {
      effectiveNow = now.subtract(const Duration(days: 1));
    }

    // 同样，开始日期也是从当天的 4:00 开始算第 0 天
    // difference.inDays 会计算完整的 24 小时，我们这里只需要比较日期差
    final startDateOnly = DateTime(start.year, start.month, start.day);
    final nowDateOnly = DateTime(
      effectiveNow.year,
      effectiveNow.month,
      effectiveNow.day,
    );

    if (nowDateOnly.isBefore(startDateOnly)) return -1;
    return nowDateOnly.difference(startDateOnly).inDays;
  }

  /// 获取当前血量要求
  int get currentLife {
    final days = daysSinceActive;
    if (days < 0) return 1; // 未开始
    if (days <= 3) return 1;
    if (days <= 6) return 10;
    if (days <= 9) return 30;
    if (days <= 13) return 50;
    if (days <= 20) return 100;
    return 999;
  }

  /// 获取当前难度要求
  String get currentDifficultyRequirement {
    final days = daysSinceActive;
    if (days < 0) return 'MASTER及以上';
    if (days <= 13) return 'MASTER及以上';
    if (days <= 20) return 'EXPERT及以上';
    return 'BASIC及以上';
  }

  /// 获取下一次放宽条件的时间距离
  String? get nextRelaxationInfo {
    final days = daysSinceActive;
    if (days < 0) return null;

    final start = DateTime.parse(activeDate);
    final now = DateTime.now();

    // 放宽节点
    final nodes = [4, 7, 10, 14, 21];
    for (final node in nodes) {
      if (days < node) {
        // 下一次放宽的确切时间是：开始日期 + node天 的凌晨 4:00
        final nextDate = DateTime(
          start.year,
          start.month,
          start.day + node,
          4,
          0,
          0,
        );
        final diff = nextDate.difference(now);

        if (diff.isNegative) {
          continue; // 容错处理
        }

        final daysLeft = diff.inDays;
        final hoursLeft = diff.inHours % 24;
        final minutesLeft = diff.inMinutes % 60;

        String timeStr;
        if (daysLeft > 0) {
          timeStr = '$daysLeft天$hoursLeft小时';
        } else if (hoursLeft > 0) {
          timeStr = '$hoursLeft小时$minutesLeft分';
        } else {
          timeStr = '$minutesLeft分';
        }

        String relaxType = '';
        if (node == 14 || node == 21) {
          relaxType = ' (难度&血量)';
        } else {
          relaxType = ' (血量)';
        }

        return '距离下一次放宽$relaxType还有: $timeStr';
      }
    }
    return null;
  }
}

class KaleidxscopeCondition {
  final String description;
  final List<int> songs;

  KaleidxscopeCondition({required this.description, required this.songs});

  factory KaleidxscopeCondition.fromJson(Map<String, dynamic> json) {
    return KaleidxscopeCondition(
      description: json['description'] as String,
      songs: List<int>.from(json['songs']),
    );
  }
}

class KaleidxscopeTrack {
  final String description;
  final List<int> songs;

  KaleidxscopeTrack({required this.description, required this.songs});

  factory KaleidxscopeTrack.fromJson(Map<String, dynamic> json) {
    return KaleidxscopeTrack(
      description: json['description'] as String,
      songs: List<int>.from(json['songs']),
    );
  }
}
