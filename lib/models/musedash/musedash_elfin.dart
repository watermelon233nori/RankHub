import 'package:isar_community/isar.dart';

part 'musedash_elfin.g.dart';

/// MuseDash 精灵模型
@collection
class MuseDashElfin {
  Id id = Isar.autoIncrement;

  /// 精灵 ID (数组索引)
  @Index(unique: true)
  late int elfinId;

  /// 精灵名称
  late String name;

  /// 精灵描述
  late String description;

  /// 技能描述
  late String skill;

  /// 芯片名称
  late String chipName;

  /// 芯片描述
  late String chipDescription;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashElfin();

  factory MuseDashElfin.fromJson(int index, Map<String, dynamic> json) {
    return MuseDashElfin()
      ..elfinId = index
      ..name = json['name'] as String? ?? ''
      ..description = json['description'] as String? ?? ''
      ..skill = json['skill'] as String? ?? ''
      ..chipName = json['chipName'] as String? ?? ''
      ..chipDescription = json['chipDescription'] as String? ?? ''
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }

  Map<String, dynamic> toJson() {
    return {
      'elfinId': elfinId,
      'name': name,
      'description': description,
      'skill': skill,
      'chipName': chipName,
      'chipDescription': chipDescription,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
