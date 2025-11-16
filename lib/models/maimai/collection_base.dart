import 'package:isar_community/isar.dart';
import 'enums/trophy_color.dart';

part 'collection_base.g.dart';

/// 称号（Trophy）
@embedded
class Trophy {
  Trophy({this.id = 0, this.name = '', this.color});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  /// 称号颜色
  @Enumerated(EnumType.name)
  TrophyColor? color;

  factory Trophy.fromJson(Map<String, dynamic> json) {
    return Trophy(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      color: json['color'] != null
          ? TrophyColor.fromValue(json['color'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'color': color?.value};
  }
}
