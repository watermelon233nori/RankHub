import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_list_provider.g.dart';

@riverpod
class PlayerList extends _$PlayerList {
  @override
  Future<List<Widget>> build() async {
    return <Widget>[];
  }
}