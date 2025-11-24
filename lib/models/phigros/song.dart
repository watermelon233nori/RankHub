import 'package:isar_community/isar.dart';

part 'song.g.dart';

/// Phigros 歌曲信息
@collection
class PhigrosSong {
  Id id = Isar.autoIncrement;

  /// 曲目ID（用于获取曲绘等资源）
  @Index(unique: true)
  late String songId;

  /// 曲名
  late String name;

  /// 曲师
  late String composer;

  /// 曲绘画师
  String? illustrator;

  /// EZ谱师
  String? chartDesignerEZ;

  /// HD谱师
  String? chartDesignerHD;

  /// IN谱师
  String? chartDesignerIN;

  /// AT谱师（如有）
  String? chartDesignerAT;

  /// 所属收藏品
  String? collection;

  /// EZ定数
  double? difficultyEZ;

  /// HD定数
  double? difficultyHD;

  /// IN定数
  double? difficultyIN;

  /// AT定数（如有）
  double? difficultyAT;

  /// 是否有AT难度
  bool get hasAT => difficultyAT != null && difficultyAT! > 0;

  /// 曲绘URL
  String get illustrationUrl =>
      'https://ghfast.top/https://raw.githubusercontent.com/7aGiven/Phigros_Resource/refs/heads/illustration/$songId.png';

  /// 模糊曲绘URL
  String get illustrationBlurUrl =>
      'https://ghfast.top/https://raw.githubusercontent.com/7aGiven/Phigros_Resource/refs/heads/illustrationBlur/$songId.png';

  /// 低质量曲绘URL
  String get illustrationLowResUrl =>
      'https://ghfast.top/https://raw.githubusercontent.com/7aGiven/Phigros_Resource/refs/heads/illustrationLowRes/$songId.png';

  PhigrosSong();

  /// 从info.tsv和difficulty.tsv的数据创建
  factory PhigrosSong.fromTsvData({
    required String songId,
    required String name,
    required String composer,
    String? illustrator,
    String? chartDesignerEZ,
    String? chartDesignerHD,
    String? chartDesignerIN,
    String? chartDesignerAT,
    String? collection,
    double? difficultyEZ,
    double? difficultyHD,
    double? difficultyIN,
    double? difficultyAT,
  }) {
    return PhigrosSong()
      ..songId = songId
      ..name = name
      ..composer = composer
      ..illustrator = illustrator
      ..chartDesignerEZ = chartDesignerEZ
      ..chartDesignerHD = chartDesignerHD
      ..chartDesignerIN = chartDesignerIN
      ..chartDesignerAT = chartDesignerAT
      ..collection = collection
      ..difficultyEZ = difficultyEZ
      ..difficultyHD = difficultyHD
      ..difficultyIN = difficultyIN
      ..difficultyAT = difficultyAT;
  }
}
