import 'package:isar_community/isar.dart';
import 'notes.dart';

part 'buddy_notes.g.dart';

/// BUDDY 谱面物量（仅宴会场曲目）
@embedded
class BuddyNotes {
  BuddyNotes({this.left = const Notes(), this.right = const Notes()});

  /// 1P 谱面物量
  final Notes left;

  /// 2P 谱面物量
  final Notes right;

  factory BuddyNotes.fromJson(Map<String, dynamic> json) {
    return BuddyNotes(
      left: json['left'] != null ? Notes.fromJson(json['left']) : const Notes(),
      right: json['right'] != null
          ? Notes.fromJson(json['right'])
          : const Notes(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'left': left.toJson(), 'right': right.toJson()};
  }
}
