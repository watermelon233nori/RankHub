/// FULL SYNC 类型
enum FSType {
  fsdPlus('fsdp', 'FDX+'),
  fsd('fsd', 'FDX'),
  fsPlus('fsp', 'FS+'),
  fs('fs', 'FS'),
  sync('sync', 'SYNC PLAY');

  const FSType(this.value, this.label);

  final String value;
  final String label;

  static FSType? fromValue(String? value) {
    if (value == null) return null;
    return FSType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => FSType.fs,
    );
  }
}
