import 'dart:collection';

import 'package:flutter/material.dart';

abstract class DataSourceProvider<R, P, S, F> {
  bool isActive = false;

  Widget buildOverviewCard();

  Widget buildRecordCard(R recordData);

  Widget buildRecordList();

  Widget buildSongCard(S songData);
  
  Widget buildSongList();

  Widget buildRankedRecordList();

  Widget buildSongDetailScreen(S songData);

  Widget buildPlayerDetailScreen(P playerData);

  Widget buildAddPlayerScreen();
  
  Widget buildProviderIcon();

  Widget buildPlayerListCard(BuildContext context, P playerData);

  String getProviderName();

  String getRankedRecordsTitle();

  String getProviderLoacation();

  String getProviderGameName();

  Future<List<S>> getAllSongs({bool forceRefresh = false});

  Future<List<S>> searchSongs(String query);

  Future<P?> getPlayerDetail(String id);

  Future<S> getSongDetail();

  Future<List<R>> getRecords({bool forceRefresh = false});

  Future<Map<String,List<R>>> getRankedRecords();

  Future<P> addPlayer(String? token);

  Future<void> deletePlayer();

  Future<List<R>> filterRecords(F filterData);

  Future<dynamic>? updateRecord() {
    return null;
  }

  Future<LinkedHashMap<DateTime, num>>? getRankTrend(Duration? duration) {
    return null;
  }

  Future<LinkedHashMap<DateTime, num>>? getRecordTrend(Duration? duration) {
    return null;
  }

  List<Widget> buildRecordPageAppBarActions(BuildContext context) {
    return [];
  }

  String getDefaultRecordTitle() {
    return '所有成绩';
  }
}