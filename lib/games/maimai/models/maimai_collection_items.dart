import 'package:isar_community/isar.dart';

part 'maimai_collection_items.g.dart';

/// 头像（Icon）
@embedded
class MaimaiIconData {
  MaimaiIconData({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory MaimaiIconData.fromJson(Map<String, dynamic> json) {
    return MaimaiIconData(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

/// 姓名框（NamePlate）
@embedded
class MaimaiNamePlate {
  MaimaiNamePlate({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory MaimaiNamePlate.fromJson(Map<String, dynamic> json) {
    return MaimaiNamePlate(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}

/// 背景（Frame）
@embedded
class MaimaiFrame {
  MaimaiFrame({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory MaimaiFrame.fromJson(Map<String, dynamic> json) {
    return MaimaiFrame(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
