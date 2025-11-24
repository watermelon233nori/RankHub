import 'package:isar_community/isar.dart';

part 'avatar.g.dart';

/// Phigros 头像
@collection
class PhigrosAvatar {
  Id id = Isar.autoIncrement;

  /// 头像名称（用于构建URL）
  @Index(unique: true)
  late String avatarName;

  /// 头像URL
  String get avatarUrl =>
      'https://ghfast.top/https://raw.githubusercontent.com/7aGiven/Phigros_Resource/refs/heads/avatar/$avatarName.png';

  PhigrosAvatar();

  factory PhigrosAvatar.fromName(String name) {
    return PhigrosAvatar()..avatarName = name.trim();
  }
}
