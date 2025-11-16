import 'package:isar_community/isar.dart';

part 'collection_items.g.dart';

/// 头像（Icon）
@embedded
class IconData {
  IconData({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory IconData.fromJson(Map<String, dynamic> json) {
    return IconData(
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
class NamePlate {
  NamePlate({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory NamePlate.fromJson(Map<String, dynamic> json) {
    return NamePlate(
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
class Frame {
  Frame({this.id = 0, this.name = ''});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  factory Frame.fromJson(Map<String, dynamic> json) {
    return Frame(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
