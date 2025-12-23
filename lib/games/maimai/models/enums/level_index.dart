/// 难度等级
enum LevelIndex {
  basic(0, 'BASIC'),
  advanced(1, 'ADVANCED'),
  expert(2, 'EXPERT'),
  master(3, 'MASTER'),
  reMaster(4, 'Re:MASTER');

  const LevelIndex(this.value, this.label);

  final int value;
  final String label;

  static LevelIndex fromValue(int value) {
    return LevelIndex.values.firstWhere(
      (e) => e.value == value,
      orElse: () => LevelIndex.basic,
    );
  }
}
