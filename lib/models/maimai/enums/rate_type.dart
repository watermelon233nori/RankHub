/// 评级类型
enum RateType {
  sssPlus('sssp', 'SSS+'),
  sss('sss', 'SSS'),
  ssPlus('ssp', 'SS+'),
  ss('ss', 'SS'),
  sPlus('sp', 'S+'),
  s('s', 'S'),
  aaa('aaa', 'AAA'),
  aa('aa', 'AA'),
  a('a', 'A'),
  bbb('bbb', 'BBB'),
  bb('bb', 'BB'),
  b('b', 'B'),
  c('c', 'C'),
  d('d', 'D');

  const RateType(this.value, this.label);

  final String value;
  final String label;

  static RateType? fromValue(String? value) {
    if (value == null) return null;
    return RateType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => RateType.d,
    );
  }
}
