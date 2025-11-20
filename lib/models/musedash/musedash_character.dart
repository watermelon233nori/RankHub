import 'package:isar_community/isar.dart';

part 'musedash_character.g.dart';

/// MuseDash 角色模型
@collection
class MuseDashCharacter {
  Id id = Isar.autoIncrement;

  /// 角色 ID (数组索引)
  @Index(unique: true)
  late int characterId;

  /// 角色名称
  late String characterName;

  /// 服装名称
  late String cosName;

  /// 所有服装名称列表
  late List<String> cosNames;

  /// 角色描述
  late String description;

  /// 技能描述
  late String skill;

  /// 所有技能描述列表
  late List<String> skills;

  /// 芯片名称
  late String chipName;

  /// 芯片描述
  late String chipDescription;

  /// 配音演员
  late String cv;

  /// 所有配音演员列表
  late List<String> cvs;

  /// 皮肤名称列表
  late List<String> skinNames;

  /// 表情文本 (JSON 字符串存储)
  String? expressions;

  /// 审查表情文本 (JSON 字符串存储)
  String? reviewExpressions;

  /// 猫形态表情文本 (JSON 字符串存储)
  String? catExpressions;

  /// 愚人节表情文本 (JSON 字符串存储)
  String? foolishExpressions;

  /// 自动表情文本 (JSON 字符串存储)
  String? autoExpressions;

  /// 列表索引
  late int listIndex;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashCharacter();

  factory MuseDashCharacter.fromJson(int index, Map<String, dynamic> json) {
    final character = MuseDashCharacter()
      ..characterId = index
      ..characterName = json['characterName'] as String? ?? ''
      ..cosName = json['cosName'] as String? ?? ''
      ..description = json['description'] as String? ?? ''
      ..skill = json['skill'] as String? ?? ''
      ..chipName = json['chipName'] as String? ?? ''
      ..chipDescription = json['chipDescription'] as String? ?? ''
      ..cv = json['cv'] as String? ?? ''
      ..listIndex = json['listIndex'] as int? ?? 0
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    // 服装名称列表
    if (json['cosNames'] != null) {
      final list = json['cosNames'] as List;
      character.cosNames = list.map((e) => e.toString()).toList();
    } else {
      character.cosNames = [];
    }

    // 技能列表
    if (json['skills'] != null) {
      final list = json['skills'] as List;
      character.skills = list.map((e) => e.toString()).toList();
    } else {
      character.skills = [];
    }

    // 配音演员列表
    if (json['cvs'] != null) {
      final list = json['cvs'] as List;
      character.cvs = list.map((e) => e.toString()).toList();
    } else {
      character.cvs = [];
    }

    // 皮肤名称列表
    if (json['skinNames'] != null) {
      final list = json['skinNames'] as List;
      character.skinNames = list.map((e) => e.toString()).toList();
    } else {
      character.skinNames = [];
    }

    // 表情文本 (JSON 字符串)
    if (json['expressions'] != null) {
      character.expressions = _encodeJson(json['expressions']);
    }
    if (json['reviewExpressions'] != null) {
      character.reviewExpressions = _encodeJson(json['reviewExpressions']);
    }
    if (json['catExpressions'] != null) {
      character.catExpressions = _encodeJson(json['catExpressions']);
    }
    if (json['foolishExpressions'] != null) {
      character.foolishExpressions = _encodeJson(json['foolishExpressions']);
    }
    if (json['autoExpressions'] != null) {
      character.autoExpressions = _encodeJson(json['autoExpressions']);
    }

    return character;
  }

  Map<String, dynamic> toJson() {
    return {
      'characterId': characterId,
      'characterName': characterName,
      'cosName': cosName,
      'cosNames': cosNames,
      'description': description,
      'skill': skill,
      'skills': skills,
      'chipName': chipName,
      'chipDescription': chipDescription,
      'cv': cv,
      'cvs': cvs,
      'skinNames': skinNames,
      'listIndex': listIndex,
    };
  }

  static String _encodeJson(dynamic data) {
    return data.toString();
  }
}
