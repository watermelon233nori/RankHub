import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/musedash/md_ce_names.dart';

part 'md_ce_category.g.dart';

@HiveType(typeId: 35)
class MdCECategory {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final MdCENames names;

  MdCECategory({
    required this.category,
    required this.names,
  });

  factory MdCECategory.fromJson(String category, Map<String, dynamic> json) {
    return MdCECategory(
      category: category,
      names: MdCENames.fromJson(json),
    );
  }
}