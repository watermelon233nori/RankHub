import 'package:isar_community/isar.dart';

part 'maimai_notes.g.dart';

/// 谱面物量
@embedded
class MaimaiNotes {
  const MaimaiNotes({
    this.total = 0,
    this.tap = 0,
    this.hold = 0,
    this.slide = 0,
    this.touch = 0,
    this.breakNote = 0,
  });

  /// 总物量
  final int total;

  /// TAP 物量
  final int tap;

  /// HOLD 物量
  final int hold;

  /// SLIDE 物量
  final int slide;

  /// TOUCH 物量
  final int touch;

  /// BREAK 物量
  @Name('break_note')
  final int breakNote;

  factory MaimaiNotes.fromJson(Map<String, dynamic> json) {
    return MaimaiNotes(
      total: json['total'] as int? ?? 0,
      tap: json['tap'] as int? ?? 0,
      hold: json['hold'] as int? ?? 0,
      slide: json['slide'] as int? ?? 0,
      touch: json['touch'] as int? ?? 0,
      breakNote: json['break'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'tap': tap,
      'hold': hold,
      'slide': slide,
      'touch': touch,
      'break': breakNote,
    };
  }
}
