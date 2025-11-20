import 'package:isar_community/isar.dart';

part 'musedash_music.g.dart';

/// MuseDash 音乐模型
@collection
class MuseDashMusic {
  Id id = Isar.autoIncrement;

  /// 音乐 UID (如 "0-48")
  @Index(unique: true)
  late String uid;

  /// 音乐名称
  late String name;

  /// 作者
  late String author;

  /// 封面图片名称
  late String cover;

  /// BPM (节拍)
  late String bpm;

  /// 所属专辑 UID
  @Index()
  late String albumUid;

  /// 难度等级 (最多5个难度)
  late List<String> difficulty;

  /// 谱师列表
  late List<String> levelDesigner;

  /// 多语言名称 (JSON 字符串)
  String? localizedNames;

  /// 多语言作者 (JSON 字符串)
  String? localizedAuthors;

  /// 创建时间
  late DateTime createdAt;

  /// 更新时间
  late DateTime updatedAt;

  MuseDashMusic();

  factory MuseDashMusic.fromJson(
    String uid,
    String albumUid,
    Map<String, dynamic> json,
  ) {
    final music = MuseDashMusic()
      ..uid = uid
      ..albumUid = albumUid
      ..name = json['name'] as String? ?? ''
      ..author = json['author'] as String? ?? ''
      ..cover = json['cover'] as String? ?? ''
      ..bpm = json['bpm'] as String? ?? '0'
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();

    // 难度列表
    if (json['difficulty'] != null) {
      final diffList = json['difficulty'] as List;
      music.difficulty = diffList.map((e) => e.toString()).toList();
    } else {
      music.difficulty = [];
    }

    // 谱师列表
    if (json['levelDesigner'] != null) {
      final designerList = json['levelDesigner'] as List;
      music.levelDesigner = designerList.map((e) => e.toString()).toList();
    } else {
      music.levelDesigner = [];
    }

    // 保存多语言名称和作者
    final localizedNamesMap = <String, String>{};
    final localizedAuthorsMap = <String, String>{};

    for (final lang in [
      'ChineseS',
      'ChineseT',
      'English',
      'Japanese',
      'Korean',
    ]) {
      if (json[lang] != null) {
        if (json[lang]['name'] != null) {
          localizedNamesMap[lang] = json[lang]['name'] as String;
        }
        if (json[lang]['author'] != null) {
          localizedAuthorsMap[lang] = json[lang]['author'] as String;
        }
      }
    }

    if (localizedNamesMap.isNotEmpty) {
      music.localizedNames = _encodeJson(localizedNamesMap);
    }
    if (localizedAuthorsMap.isNotEmpty) {
      music.localizedAuthors = _encodeJson(localizedAuthorsMap);
    }

    return music;
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'author': author,
      'cover': cover,
      'bpm': bpm,
      'albumUid': albumUid,
      'difficulty': difficulty,
      'levelDesigner': levelDesigner,
      'localizedNames': localizedNames != null
          ? _decodeJson(localizedNames!)
          : null,
      'localizedAuthors': localizedAuthors != null
          ? _decodeJson(localizedAuthors!)
          : null,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// 获取本地化名称
  String getLocalizedName(String language) {
    if (localizedNames == null) return name;
    final map = _decodeJson(localizedNames!);
    return map[language] as String? ?? name;
  }

  /// 获取本地化作者
  String getLocalizedAuthor(String language) {
    if (localizedAuthors == null) return author;
    final map = _decodeJson(localizedAuthors!);
    return map[language] as String? ?? author;
  }

  /// 获取最高难度
  int getMaxDifficulty() {
    return difficulty
        .map((d) => int.tryParse(d) ?? 0)
        .reduce((a, b) => a > b ? a : b);
  }

  /// 获取难度数量
  int getDifficultyCount() {
    return difficulty.where((d) => d != '0').length;
  }

  /// 获取完整的封面图片 URL
  String get coverUrl {
    if (cover.startsWith('http')) {
      return cover;
    }
    return 'https://musedash.moe/covers/$cover.webp';
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
