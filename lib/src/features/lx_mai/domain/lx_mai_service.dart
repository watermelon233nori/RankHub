import 'package:flutter/material.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_song_filter_data.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_types.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_difficulty.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_alias.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_version.dart';

class LxMaiService {
  List<SongScore> filterRecords(List<SongInfo> songs, List<SongScore> records,
      MaiSongFilterData filterData) {
    // Return early if no filters are applied
    if (filterData.areAllValuesNull) {
      return records;
    }

    // Convert filter data into efficient lookup sets/maps
    final levelIndexSet = filterData.levelIndex?.map((e) => e.value).toSet();
    final genreSet = filterData.genre?.map((e) => e.genre).toSet();
    final versionSet = filterData.version?.map((e) => e.version).toSet();
    final fcTypeSet = filterData.fcType?.map((e) => e.value).toSet();
    final fsTypeSet = filterData.fsType?.map((e) => e.value).toSet();
    final levelValueStart = filterData.levelValueRange?.start;
    final levelValueEnd = filterData.levelValueRange?.end;
    final uploadTimeStart = filterData.uploadTimeRange?.start;
    final uploadTimeEnd = filterData.uploadTimeRange?.end;

    // Pre-filter songs based on genre and version
    final preFilteredSongIds = songs
        .where((song) =>
            (genreSet == null || genreSet.contains(song.genre)) &&
            (versionSet == null || versionSet.contains(song.version)))
        .map((song) => song.id)
        .toSet();

    // Filter records based on song and record-specific criteria
    return records.where((record) {
      // Check if the song ID matches pre-filtered IDs
      if (!preFilteredSongIds.contains(record.id)) {
        return false;
      }

      // Check level index
      if (levelIndexSet != null && !levelIndexSet.contains(record.levelIndex)) {
        return false;
      }

      // Retrieve the corresponding song and difficulties
      final song = songs.firstWhere((song) => song.id == record.id);
      final difficulties = song.difficulties;
      final recordType = record.type;

      // Helper function for level value filtering
      bool isLevelValueOutOfRange(List<SongDifficulty>? diffs) {
        if (diffs == null) return false;
        return diffs.any((diff) =>
            diff.difficulty == record.levelIndex &&
            ((levelValueStart != null && diff.levelValue < levelValueStart) ||
                (levelValueEnd != null && diff.levelValue > levelValueEnd)));
      }

      // Check level value range based on record type
      if (recordType == SongType.dx.value &&
              isLevelValueOutOfRange(difficulties.dx) ||
          recordType == SongType.standard.value &&
              isLevelValueOutOfRange(difficulties.standard) ||
          recordType == SongType.utage.value &&
              isLevelValueOutOfRange(difficulties.utage)) {
        return false;
      }

      // Check upload time
      if (uploadTimeStart != null && uploadTimeEnd != null) {
        final uploadTime = record.uploadTime != null
            ? DateTime.tryParse(record.uploadTime!)
            : null;
        if (uploadTime == null ||
            uploadTime.isBefore(uploadTimeStart) ||
            uploadTime.isAfter(uploadTimeEnd)) {
          return false;
        }
      }

      // Check FC type and FS type
      if ((fcTypeSet != null && !fcTypeSet.contains(record.fc)) ||
          (fsTypeSet != null && !fsTypeSet.contains(record.fs))) {
        return false;
      }

      return true;
    }).toList();
  }

  List<SongInfo> searchSongs(
      List<SongInfo> songs, List<SongAlias> aliases, String query) {
    // Convert query to lowercase for case-insensitive search
    final lowerQuery = query.toLowerCase();

    // Create a map of song ID to alias list for fast lookup
    final aliasMap = <int, List<String>>{};
    for (var alias in aliases) {
      aliasMap[alias.songId] =
          alias.aliases.map((e) => e.toLowerCase()).toList();
    }

    // Filter the songs based on query matching
    return songs.where((song) {
      final songTitle = song.title.toLowerCase();
      final songArtist = song.artist.toLowerCase();
      final songIdString = song.id.toString();

      // Check if the song matches by id, title, or artist
      bool matches = songTitle.contains(lowerQuery) ||
          songArtist.contains(lowerQuery) ||
          songIdString.contains(lowerQuery);

      // Check if the song matches by alias
      final songAliases = aliasMap[song.id] ?? [];
      bool aliasMatches =
          songAliases.any((alias) => alias.contains(lowerQuery));

      return matches || aliasMatches;
    }).toList();
  }

  Color getLevelChipColor(int levelIndex) {
    switch (levelIndex) {
      case 0:
        return Colors.green; // BASIC
      case 1:
        return const Color.fromARGB(255, 215, 160, 0); // ADVANCED
      case 2:
        return Colors.red; // EXPERT
      case 3:
        return Colors.purple; // MASTER
      case 4:
        return const Color.fromARGB(255, 235, 130, 255); // Re:MASTER
      default:
        return Colors.grey; // Default color
    }
  }

  // Method to get the type chip color (Standard = Blue, DX = Orange)
  Color getTypeChipColor(String type) {
    if (type == 'standard') {
      return Colors.blue; // Standard - Blue
    } else if (type == 'dx') {
      return Colors.orange; // DX - Orange
    } else {
      return Colors.grey; // Default color
    }
  }

  Color getFsChipColor(String? fs) {
    if (fs == 'sync') {
      return Colors.blueAccent;
    } else if (fs == 'fs' || fs == 'fsp') {
      return Colors.blue;
    } else if (fs == 'fsd' || fs == 'fsdp') {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  Color getFcChipColor(String? fc) {
    if (fc == 'fc' || fc == 'fcp') {
      return Colors.green;
    } else if (fc == 'ap' || fc == 'app') {
      return Colors.orange;
    } else {
      return Colors.grey;
    }
  }

  bool isCurrentVersionSong(List<SongVersion> versions, int version) {
    versions.sort((a, b) => a.version.compareTo(b.version));

    for (int i = 0; i < versions.length - 1; i++) {
      if (versions[i].version <= version && versions[i + 1].version > version) {
        return false;
      }
    }

    return true;
  }

  ShaderMask getShaderMaskByRating(int rating, Widget child) {
    final gradients = {
      -1: const LinearGradient(colors: [Colors.grey, Colors.grey]),
      999: const LinearGradient(colors: [Colors.white, Colors.white]),
      1999: const LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
      3999: const LinearGradient(colors: [Colors.green, Colors.lightGreen]),
      6999: const LinearGradient(colors: [Colors.yellow, Colors.orange]),
      9999: const LinearGradient(colors: [Colors.red, Colors.redAccent]),
      11999: const LinearGradient(colors: [Colors.purple, Colors.deepPurple]),
      12999: const LinearGradient(
          colors: [Color(0xFFCD7F32), Color(0xFFB87333)]), // 铜色
      13999: const LinearGradient(colors: [Colors.grey, Colors.blueGrey]), // 银色
      14499: const LinearGradient(
          colors: [Colors.amber, Colors.orangeAccent]), // 金色
      14999: const LinearGradient(colors: [
        Color.fromARGB(255, 252, 208, 122),
        Color.fromARGB(255, 252, 255, 160)
      ]), // 白金色
      double.infinity.toInt(): const LinearGradient(colors: [
        Color.fromARGB(255, 56, 255, 219),
        Color.fromARGB(255, 76, 124, 255),
        Color.fromARGB(255, 244, 92, 255)
      ]) // 彩虹色
    };

    final gradient = gradients.entries
        .firstWhere(
          (entry) => rating <= entry.key,
          orElse: () => gradients.entries.last,
        )
        .value;

    return ShaderMask(
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      blendMode: BlendMode.srcIn,
      child: child,
    );
  }

  int calcTotalDXRating(List<SongScore> records) {
    return records
        .where((record) => record.dxRating != null)
        .fold<int>(0, (prev, record) => prev + record.dxRating!.truncate());
  }
}
