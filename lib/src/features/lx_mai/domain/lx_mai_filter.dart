import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_info.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_provider.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/mai_song_filter_data.dart';

part 'lx_mai_filter.g.dart';

@riverpod
class LxMaiFilter extends _$LxMaiFilter {
  @override
  MaiSongFilterData build() {
    return MaiSongFilterData();
  }

  void setFilter(MaiSongFilterData filterData) {
    state = filterData;
  }

  void resetFilter() {
    state = MaiSongFilterData();
  }
}

@riverpod
class LxMaiRecordSearchKeyword extends _$LxMaiRecordSearchKeyword {
  @override
  String build() {
    return '';
  }

  void setSearchKeyword(String keyword) {
    state = keyword;
  }

  void resetSearchKeyword() {
    state = '';
  }
}

@riverpod
class LxMaiSongSearchKeyword extends _$LxMaiSongSearchKeyword {
  @override
  String build() {
    return '';
  }

  void setSearchKeyword(String keyword) {
    state = keyword;
  }

  void resetSearchKeyword() {
    state = '';
  }
}


@riverpod
Future<List<SongScore>> filteredRecordList(Ref ref, String uuid) async {
  final filterData = ref.watch(lxMaiFilterProvider);
  final searchKeyword = ref.watch(lxMaiRecordSearchKeywordProvider);
  final repository = ref.read(lxMaiRepositoryProvider);

  final records = await repository.getRecordList(uuid);
  final songs = await repository.getSongList();
  final aliases = await repository.getSongAlias();

  final filteredRecords =
      LxMaiService().filterRecords(songs, records, filterData);
  final filteredSongs =
      LxMaiService().searchSongs(songs, aliases, searchKeyword);

  return filteredRecords
      .where((record) => filteredSongs.any((song) => song.id == record.id))
      .toList();
}

@riverpod
Future<List<SongInfo>> filteredSongList(Ref ref) async {
  final searchKeyword = ref.watch(lxMaiSongSearchKeywordProvider);
  final repository = ref.read(lxMaiRepositoryProvider);

  final songs = await repository.getSongList();
  final aliases = await repository.getSongAlias();
  return LxMaiService().searchSongs(songs, aliases, searchKeyword);
}
