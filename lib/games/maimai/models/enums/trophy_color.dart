/// 称号颜色
enum TrophyColor {
  normal('Normal', '普通'),
  bronze('Bronze', '铜'),
  silver('Silver', '银'),
  gold('Gold', '金'),
  rainbow('Rainbow', '虹');

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
