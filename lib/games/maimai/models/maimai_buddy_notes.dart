import 'package:isar_community/isar.dart';
import 'maimai_notes.dart';

part 'maimai_buddy_notes.g.dart';

/// BUDDY 谱面物量（仅宴会场曲目）
@embedded
class MaimaiBuddyNotes {
  MaimaiBuddyNotes({
    this.left = const MaimaiNotes(),
    this.right = const MaimaiNotes(),
  });

  /// 1P 谱面物量
  final MaimaiNotes left;

  /// 2P 谱面物量
  final MaimaiNotes right;

  factory MaimaiBuddyNotes.fromJson(Map<String, dynamic> json) {
    return MaimaiBuddyNotes(
      left: json['left'] != null
          ? MaimaiNotes.fromJson(json['left'])
          : const MaimaiNotes(),
      right: json['right'] != null
          ? MaimaiNotes.fromJson(json['right'])
          : const MaimaiNotes(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'left': left.toJson(), 'right': right.toJson()};
  }
}
