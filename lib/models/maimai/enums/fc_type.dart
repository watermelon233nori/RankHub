/// FULL COMBO 类型
enum FCType {
  apPlus('app', 'AP+'),
  ap('ap', 'AP'),
  fcPlus('fcp', 'FC+'),
  fc('fc', 'FC');

  const FCType(this.value, this.label);

  final String value;
  final String label;

  static FCType? fromValue(String? value) {
    if (value == null) return null;
    return FCType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => FCType.fc,
    );
  }
}
