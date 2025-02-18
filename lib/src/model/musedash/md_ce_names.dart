import 'package:hive/hive.dart';

part 'md_ce_names.g.dart';

@HiveType(typeId: 34)
class MdCENames {
  @HiveField(0)
  final List<String> chineseS;

  @HiveField(1)
  final List<String> chineseT;

  @HiveField(2)
  final List<String> english;

  @HiveField(3)
  final List<String> japanese;

  @HiveField(4)
  final List<String> korean;

  MdCENames({
    required this.chineseS,
    required this.chineseT,
    required this.english,
    required this.japanese,
    required this.korean,
  });

  factory MdCENames.fromJson(Map<String, dynamic> json) {
    return MdCENames(
      chineseS: List<String>.from(json['ChineseS'] ?? []),
      chineseT: List<String>.from(json['ChineseT'] ?? []),
      english: List<String>.from(json['English'] ?? []),
      japanese: List<String>.from(json['Japanese'] ?? []),
      korean: List<String>.from(json['Korean'] ?? []),
    );
  }
}
