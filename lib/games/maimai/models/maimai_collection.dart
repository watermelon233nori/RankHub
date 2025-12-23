import 'package:isar_community/isar.dart';
import 'enums/level_index.dart';
import 'enums/rate_type.dart';
import 'enums/fc_type.dart';
import 'enums/fs_type.dart';
import 'enums/song_type.dart';

part 'maimai_collection.g.dart';

/// 收藏品要求曲目
@embedded
class MaimaiCollectionRequiredSong {
  MaimaiCollectionRequiredSong({
    this.id = 0,
    this.title = '',
    this.type = SongType.standard,
    this.completed = false,
    this.completedDifficulties = const [],
  });

  /// 曲目 ID
  late int id;

  /// 曲名
  late String title;

  /// 谱面类型
  @Enumerated(EnumType.name)
  late SongType type;

  /// 要求的曲目是否完成
  late bool completed;

  /// 已完成的难度
  @Enumerated(EnumType.name)
  late List<LevelIndex> completedDifficulties;

  factory MaimaiCollectionRequiredSong.fromJson(Map<String, dynamic> json) {
    return MaimaiCollectionRequiredSong(
      id: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      type: json['type'] != null
          ? SongType.fromValue(json['type'])
          : SongType.standard,
      completed: json['completed'] as bool? ?? false,
      completedDifficulties:
          (json['completed_difficulties'] as List?)
              ?.map((e) => LevelIndex.fromValue(e as int))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type.value,
      'completed': completed,
      'completed_difficulties': completedDifficulties
          .map((e) => e.value)
          .toList(),
    };
  }
}

/// 收藏品要求
@embedded
class MaimaiCollectionRequired {
  MaimaiCollectionRequired({
    this.difficulties = const [],
    this.rate,
    this.fc,
    this.fs,
    this.songs = const [],
    this.completed = false,
  });

  /// 要求的谱面难度
  @Enumerated(EnumType.name)
  late List<LevelIndex> difficulties;

  /// 要求的评级类型
  @Enumerated(EnumType.name)
  RateType? rate;

  /// 要求的 FULL COMBO 类型
  @Enumerated(EnumType.name)
  FCType? fc;

  /// 要求的 FULL SYNC 类型
  @Enumerated(EnumType.name)
  FSType? fs;

  /// 要求的曲目列表
  late List<MaimaiCollectionRequiredSong> songs;

  /// 要求是否全部完成
  late bool completed;

  factory MaimaiCollectionRequired.fromJson(Map<String, dynamic> json) {
    return MaimaiCollectionRequired(
      difficulties:
          (json['difficulties'] as List?)
              ?.map((e) => LevelIndex.fromValue(e as int))
              .toList() ??
          [],
      rate: json['rate'] != null ? RateType.fromValue(json['rate']) : null,
      fc: json['fc'] != null ? FCType.fromValue(json['fc']) : null,
      fs: json['fs'] != null ? FSType.fromValue(json['fs']) : null,
      songs:
          (json['songs'] as List?)
              ?.map((e) => MaimaiCollectionRequiredSong.fromJson(e))
              .toList() ??
          [],
      completed: json['completed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'difficulties': difficulties.map((e) => e.value).toList(),
      'rate': rate?.value,
      'fc': fc?.value,
      'fs': fs?.value,
      'songs': songs.map((e) => e.toJson()).toList(),
      'completed': completed,
    };
  }
}

/// 收藏品
@collection
class MaimaiCollection {
  MaimaiCollection({
    this.id = Isar.autoIncrement,
    this.collectionId = 0,
    this.collectionType = 'trophy',
    this.name = '',
    String? color,
    this.description,
    this.genre,
    this.required = const [],
  });

  /// Isar 自增 ID
  Id id;

  /// 收藏品 ID
  late int collectionId;

  /// 收藏品类型 (trophy, icon, plate, frame)
  late String collectionType;

  /// 收藏品名称
  late String name;

  /// 称号颜色（仅玩家称号）
  String? color;

  /// 收藏品说明
  String? description;

  /// 收藏品分类（日文）
  String? genre;

  /// 收藏品要求
  late List<MaimaiCollectionRequired> required;

  /// 复合索引：collectionType + collectionId 唯一
  @Index(composite: [CompositeIndex('collectionId')], unique: true)
  String get typeIdKey => '$collectionType-$collectionId';

  factory MaimaiCollection.fromJson(Map<String, dynamic> json) {
    return MaimaiCollection(
      collectionId: json['id'] as int? ?? 0,
      collectionType: json['type'] as String? ?? 'trophy',
      name: json['name'] as String? ?? '',
      color: json['color'] as String?,
      description: json['description'] as String?,
      genre: json['genre'] as String?,
      required:
          (json['required'] as List?)
              ?.map((e) => MaimaiCollectionRequired.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': collectionId,
      'type': collectionType,
      'name': name,
      'color': color,
      'description': description,
      'genre': genre,
      'required': required.map((e) => e.toJson()).toList(),
    };
  }
}

/// 收藏品分类
@collection
class MaimaiCollectionGenre {
  MaimaiCollectionGenre({
    this.id = Isar.autoIncrement,
    this.genreId = 0,
    this.title = '',
    this.genre = '',
  });

  /// Isar 自增 ID
  Id id;

  /// 收藏品分类 ID
  @Index()
  late int genreId;

  /// 分类标题
  late String title;

  /// 分类标题（日文）
  late String genre;

  factory MaimaiCollectionGenre.fromJson(Map<String, dynamic> json) {
    return MaimaiCollectionGenre(
      genreId: json['id'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': genreId, 'title': title, 'genre': genre};
  }
}
