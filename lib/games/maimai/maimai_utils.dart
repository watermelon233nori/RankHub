import 'package:rank_hub/games/maimai/models/maimai_song.dart';

MaimaiVersion? getVersionBySongVersion(
  int songVersion,
  List<MaimaiVersion> versions,
) {
  if (versions.isEmpty) return null;

  // 如果 songVersion >= 最新版本,返回最新版本
  if (songVersion >= versions.first.version) {
    return versions.first;
  }

  // 如果 songVersion < 最后一个版本(最旧版本),返回最后一个版本
  if (songVersion < versions.last.version) {
    return versions.last;
  }

  // versions 已按降序排列,查找合适的版本区间
  for (int i = 0; i < versions.length - 1; i++) {
    final currentVersion = versions[i];
    final nextVersion = versions[i + 1];

    // songVersion 在 nextVersion 和 currentVersion 之间
    if (songVersion >= nextVersion.version &&
        songVersion < currentVersion.version) {
      return nextVersion;
    }
  }

  return null;
}
