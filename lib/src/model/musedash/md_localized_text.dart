import 'package:hive/hive.dart';

part 'md_localized_text.g.dart';

@HiveType(typeId: 36)
class MdLocalizedText {
  @HiveField(0)
  final String chineseS;
  
  @HiveField(1)
  final String chineseT;
  
  @HiveField(2)
  final String english;
  
  @HiveField(3)
  final String japanese;
  
  @HiveField(4)
  final String korean;
  
  MdLocalizedText({
    required this.chineseS,
    required this.chineseT,
    required this.english,
    required this.japanese,
    required this.korean,
  });

  factory MdLocalizedText.fromJson(Map<String, dynamic> json) {
    return MdLocalizedText(
      chineseS: json['ChineseS']['title'] ?? '',
      chineseT: json['ChineseT']['title'] ?? '',
      english: json['English']['title'] ?? '',
      japanese: json['Japanese']['title'] ?? '',
      korean: json['Korean']['title'] ?? '',
    );
  }
}