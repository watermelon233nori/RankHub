import 'package:isar_community/isar.dart';
import 'enums/trophy_color.dart';

part 'maimai_collection_base.g.dart';

/// 称号（Trophy）
@embedded
class MaimaiTrophy {
  MaimaiTrophy({this.id = 0, this.name = '', this.color});

  /// 收藏品 ID
  late int id;

  /// 收藏品名称
  late String name;

  /// 称号颜色
  @Enumerated(EnumType.name)
  TrophyColor? color;

  factory MaimaiTrophy.fromJson(Map<String, dynamic> json) {
    return MaimaiTrophy(
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
