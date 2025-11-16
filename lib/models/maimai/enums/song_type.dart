/// 谱面类型
enum SongType {
  standard('standard', '标准谱面'),
  dx('dx', 'DX谱面'),
  utage('utage', '宴会场谱面');

  const SongType(this.value, this.label);

  final String value;
  final String label;

  static SongType fromValue(String value) {
    return SongType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SongType.standard,
    );
  }
}
