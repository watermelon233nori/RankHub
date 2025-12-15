import 'dart:convert';

/// Note 类型枚举
enum NoteType {
  tap(1),
  drag(2),
  hold(3),
  flick(4);

  final int value;
  const NoteType(this.value);

  /// 从数值获取枚举
  static NoteType fromValue(int value) {
    return NoteType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NoteType.tap,
    );
  }

  /// 获取名称
  String get displayName {
    switch (this) {
      case NoteType.tap:
        return 'Tap';
      case NoteType.drag:
        return 'Drag';
      case NoteType.hold:
        return 'Hold';
      case NoteType.flick:
        return 'Flick';
    }
  }
}

/// 判定线上方的 Note
class NotesAboveType {
  final int type;
  final double time;
  final double positionX;
  final double holdTime;
  final double speed;
  final double floorPosition;

  NotesAboveType({
    required this.type,
    required this.time,
    required this.positionX,
    required this.holdTime,
    required this.speed,
    required this.floorPosition,
  });

  factory NotesAboveType.fromJson(Map<String, dynamic> json) {
    try {
      return NotesAboveType(
        type: json['type'] as int,
        time: (json['time'] as num).toDouble(),
        positionX: (json['positionX'] as num).toDouble(),
        holdTime: (json['holdTime'] as num).toDouble(),
        speed: (json['speed'] as num).toDouble(),
        floorPosition: (json['floorPosition'] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ NotesAboveType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'time': time,
      'positionX': positionX,
      'holdTime': holdTime,
      'speed': speed,
      'floorPosition': floorPosition,
    };
  }
}

/// 判定线下方的 Note
class NotesBelowType {
  final int type;
  final double time;
  final double positionX;
  final double holdTime;
  final double speed;
  final double floorPosition;

  NotesBelowType({
    required this.type,
    required this.time,
    required this.positionX,
    required this.holdTime,
    required this.speed,
    required this.floorPosition,
  });

  factory NotesBelowType.fromJson(Map<String, dynamic> json) {
    try {
      return NotesBelowType(
        type: json['type'] as int,
        time: (json['time'] as num).toDouble(),
        positionX: (json['positionX'] as num).toDouble(),
        holdTime: (json['holdTime'] as num).toDouble(),
        speed: (json['speed'] as num).toDouble(),
        floorPosition: (json['floorPosition'] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ NotesBelowType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'time': time,
      'positionX': positionX,
      'holdTime': holdTime,
      'speed': speed,
      'floorPosition': floorPosition,
    };
  }
}

/// 速度事件
class SpeedEventsType {
  final double startTime;
  final double endTime;
  final double value;

  SpeedEventsType({
    required this.startTime,
    required this.endTime,
    required this.value,
  });

  factory SpeedEventsType.fromJson(Map<String, dynamic> json) {
    try {
      return SpeedEventsType(
        startTime: (json['startTime'] as num).toDouble(),
        endTime: (json['endTime'] as num).toDouble(),
        value: (json['value'] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ SpeedEventsType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {'startTime': startTime, 'endTime': endTime, 'value': value};
  }
}

/// 判定线移动事件
class JudgeLineMoveEventsType {
  final double startTime;
  final double endTime;
  final double start;
  final double end;
  final double? start2;
  final double? end2;

  JudgeLineMoveEventsType({
    required this.startTime,
    required this.endTime,
    required this.start,
    required this.end,
    this.start2,
    this.end2,
  });

  factory JudgeLineMoveEventsType.fromJson(Map<String, dynamic> json) {
    try {
      return JudgeLineMoveEventsType(
        startTime: (json['startTime'] as num).toDouble(),
        endTime: (json['endTime'] as num).toDouble(),
        start: (json['start'] as num).toDouble(),
        end: (json['end'] as num).toDouble(),
        start2: (json['start2'] as num?)?.toDouble(),
        end2: (json['end2'] as num?)?.toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ JudgeLineMoveEventsType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'start': start,
      'end': end,
      'start2': start2,
      'end2': end2,
    };
  }
}

/// 判定线旋转事件
class JudgeLineRotateEventsType {
  final double startTime;
  final double endTime;
  final double start;
  final double end;

  JudgeLineRotateEventsType({
    required this.startTime,
    required this.endTime,
    required this.start,
    required this.end,
  });

  factory JudgeLineRotateEventsType.fromJson(Map<String, dynamic> json) {
    try {
      return JudgeLineRotateEventsType(
        startTime: (json['startTime'] as num).toDouble(),
        endTime: (json['endTime'] as num).toDouble(),
        start: (json['start'] as num).toDouble(),
        end: (json['end'] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ JudgeLineRotateEventsType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'start': start,
      'end': end,
    };
  }
}

/// 判定线消失事件
class JudgeLineDisappearEventsType {
  final double startTime;
  final double endTime;
  final double start;
  final double end;

  JudgeLineDisappearEventsType({
    required this.startTime,
    required this.endTime,
    required this.start,
    required this.end,
  });

  factory JudgeLineDisappearEventsType.fromJson(Map<String, dynamic> json) {
    try {
      return JudgeLineDisappearEventsType(
        startTime: (json['startTime'] as num).toDouble(),
        endTime: (json['endTime'] as num).toDouble(),
        start: (json['start'] as num).toDouble(),
        end: (json['end'] as num).toDouble(),
      );
    } catch (e, stackTrace) {
      print('❌ JudgeLineDisappearEventsType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'start': start,
      'end': end,
    };
  }
}

/// 判定线
class JudgeLineListType {
  final double bpm;
  final List<NotesAboveType> notesAbove;
  final List<NotesBelowType> notesBelow;
  final List<SpeedEventsType> speedEvents;
  final List<JudgeLineMoveEventsType> judgeLineMoveEvents;
  final List<JudgeLineRotateEventsType> judgeLineRotateEvents;
  final List<JudgeLineDisappearEventsType> judgeLineDisappearEvents;

  JudgeLineListType({
    required this.bpm,
    required this.notesAbove,
    required this.notesBelow,
    required this.speedEvents,
    required this.judgeLineMoveEvents,
    required this.judgeLineRotateEvents,
    required this.judgeLineDisappearEvents,
  });

  factory JudgeLineListType.fromJson(Map<String, dynamic> json) {
    try {
      return JudgeLineListType(
        bpm: (json['bpm'] as num).toDouble(),
        notesAbove:
            (json['notesAbove'] as List<dynamic>?)
                ?.map(
                  (item) =>
                      NotesAboveType.fromJson(item as Map<String, dynamic>),
                )
                .toList() ??
            [],
        notesBelow:
            (json['notesBelow'] as List<dynamic>?)
                ?.map(
                  (item) =>
                      NotesBelowType.fromJson(item as Map<String, dynamic>),
                )
                .toList() ??
            [],
        speedEvents:
            (json['speedEvents'] as List<dynamic>?)
                ?.map(
                  (item) =>
                      SpeedEventsType.fromJson(item as Map<String, dynamic>),
                )
                .toList() ??
            [],
        judgeLineMoveEvents:
            (json['judgeLineMoveEvents'] as List<dynamic>?)
                ?.map(
                  (item) => JudgeLineMoveEventsType.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
        judgeLineRotateEvents:
            (json['judgeLineRotateEvents'] as List<dynamic>?)
                ?.map(
                  (item) => JudgeLineRotateEventsType.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
        judgeLineDisappearEvents:
            (json['judgeLineDisappearEvents'] as List<dynamic>?)
                ?.map(
                  (item) => JudgeLineDisappearEventsType.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            [],
      );
    } catch (e, stackTrace) {
      print('❌ JudgeLineListType.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'bpm': bpm,
      'notesAbove': notesAbove.map((item) => item.toJson()).toList(),
      'notesBelow': notesBelow.map((item) => item.toJson()).toList(),
      'speedEvents': speedEvents.map((item) => item.toJson()).toList(),
      'judgeLineMoveEvents': judgeLineMoveEvents
          .map((item) => item.toJson())
          .toList(),
      'judgeLineRotateEvents': judgeLineRotateEvents
          .map((item) => item.toJson())
          .toList(),
      'judgeLineDisappearEvents': judgeLineDisappearEvents
          .map((item) => item.toJson())
          .toList(),
    };
  }
}

/// Phigros 谱面根对象
class PhigrosChart {
  final int formatVersion;
  final int offset;
  final List<JudgeLineListType> judgeLineList;

  PhigrosChart({
    required this.formatVersion,
    required this.offset,
    required this.judgeLineList,
  });

  factory PhigrosChart.fromJson(Map<String, dynamic> json) {
    try {
      return PhigrosChart(
        formatVersion: (json['formatVersion'] as num).toInt(),
        offset: (json['offset'] as num).toInt(),
        judgeLineList:
            (json['judgeLineList'] as List<dynamic>?)
                ?.map(
                  (item) =>
                      JudgeLineListType.fromJson(item as Map<String, dynamic>),
                )
                .toList() ??
            [],
      );
    } catch (e, stackTrace) {
      print('❌ PhigrosChart.fromJson 转换失败');
      print('📦 JSON 数据: $json');
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'formatVersion': formatVersion,
      'offset': offset,
      'judgeLineList': judgeLineList.map((item) => item.toJson()).toList(),
    };
  }

  /// 从 JSON 字符串解析
  factory PhigrosChart.fromJsonString(String jsonString) {
    try {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return PhigrosChart.fromJson(json);
    } catch (e, stackTrace) {
      print('❌ PhigrosChart.fromJsonString 转换失败');
      print('📦 JSON 字符串长度: ${jsonString.length}');
      print(
        '📦 JSON 字符串前100字符: ${jsonString.substring(0, jsonString.length > 100 ? 100 : jsonString.length)}',
      );
      print('⚠️  错误: $e');
      print('📍 堆栈跟踪:\n$stackTrace');
      rethrow;
    }
  }

  /// 转换为 JSON 字符串
  String toJsonString() {
    return jsonEncode(toJson());
  }

  /// 计算总 Note 数量
  int get totalNotes {
    int count = 0;
    for (final judgeLine in judgeLineList) {
      count += judgeLine.notesAbove.length;
      count += judgeLine.notesBelow.length;
    }
    return count;
  }

  /// 统计各类型 Note 数量
  Map<NoteType, int> get noteTypeStats {
    final stats = <NoteType, int>{
      NoteType.tap: 0,
      NoteType.drag: 0,
      NoteType.hold: 0,
      NoteType.flick: 0,
    };

    for (final judgeLine in judgeLineList) {
      // 统计上方音符
      for (final note in judgeLine.notesAbove) {
        final noteType = NoteType.fromValue(note.type);
        stats[noteType] = (stats[noteType] ?? 0) + 1;
      }
      // 统计下方音符
      for (final note in judgeLine.notesBelow) {
        final noteType = NoteType.fromValue(note.type);
        stats[noteType] = (stats[noteType] ?? 0) + 1;
      }
    }

    return stats;
  }

  /// 获取 Tap 数量
  int get tapCount => noteTypeStats[NoteType.tap] ?? 0;

  /// 获取 Drag 数量
  int get dragCount => noteTypeStats[NoteType.drag] ?? 0;

  /// 获取 Hold 数量
  int get holdCount => noteTypeStats[NoteType.hold] ?? 0;

  /// 获取 Flick 数量
  int get flickCount => noteTypeStats[NoteType.flick] ?? 0;
}
