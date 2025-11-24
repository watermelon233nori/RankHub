import 'package:isar_community/isar.dart';

part 'collection.g.dart';

/// Phigros 收藏品
@collection
class PhigrosCollection {
  Id id = Isar.autoIncrement;

  /// 收藏品ID
  @Index(unique: true)
  late String collectionId;

  /// 收藏品名称
  late String name;

  /// 数量
  late int count;

  PhigrosCollection();

  factory PhigrosCollection.fromTsvLine(String line) {
    final parts = line.split('\t');
    if (parts.length < 3) {
      throw Exception('Invalid collection data: $line');
    }

    return PhigrosCollection()
      ..collectionId = parts[0].trim()
      ..name = parts[1].trim()
      ..count = int.tryParse(parts[2].trim()) ?? 0;
  }
}
