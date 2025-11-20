import 'package:isar_community/isar.dart';

part 'musedash_album.g.dart';

/// MuseDash 专辑模型
@collection
class MuseDashAlbum {
  Id id = Isar.autoIncrement;

  /// 专辑 UID (如 "ALBUM1")
  @Index(unique: true)
  late String uid;

  /// 专辑标题
  late String title;

  /// JSON 标识符
  late String jsonId;

  /// 专辑标签
  String? tag;

  /// 多语言标题 (JSON 字符串)
  String? localizedTitles;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashAlbum();

  factory MuseDashAlbum.fromJson(String uid, Map<String, dynamic> json) {
    final album = MuseDashAlbum()
      ..uid = uid
      ..title = json['title'] as String? ?? ''
      ..jsonId = json['json'] as String? ?? uid
      ..tag = json['tag'] as String?
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    // 保存多语言标题
    final localizedMap = <String, String>{};
    for (final lang in [
      'ChineseS',
      'ChineseT',
      'English',
      'Japanese',
      'Korean',
    ]) {
      if (json[lang] != null && json[lang]['title'] != null) {
        localizedMap[lang] = json[lang]['title'] as String;
      }
    }
    if (localizedMap.isNotEmpty) {
      album.localizedTitles = _encodeJson(localizedMap);
    }

    return album;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'title': title,
      'json': jsonId,
      'tag': tag,
      'localizedTitles': localizedTitles != null
          ? _decodeJson(localizedTitles!)
          : null,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 获取本地化标题
  String getLocalizedTitle(String language) {
    if (localizedTitles == null) return title;
    final map = _decodeJson(localizedTitles!);
    return map[language] as String? ?? title;
  }

  static String _encodeJson(Map<String, dynamic> map) {
    return map.entries.map((e) => '${e.key}:${e.value}').join('|');
  }

  static Map<String, dynamic> _decodeJson(String str) {
    final map = <String, dynamic>{};
    for (final pair in str.split('|')) {
      final parts = pair.split(':');
      if (parts.length == 2) {
        map[parts[0]] = parts[1];
      }
    }
    return map;
  }
}
