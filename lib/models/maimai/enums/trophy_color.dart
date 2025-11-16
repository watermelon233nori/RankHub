/// 称号颜色
enum TrophyColor {
  normal('normal', '普通'),
  bronze('bronze', '铜'),
  silver('silver', '银'),
  gold('gold', '金'),
  rainbow('rainbow', '虹');

  const TrophyColor(this.value, this.label);

  final String value;
  final String label;

  static TrophyColor? fromValue(String? value) {
    if (value == null) return null;
    return TrophyColor.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TrophyColor.normal,
    );
  }
}
