import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rank_hub/src/model/musedash/md_music.dart';
import 'package:rank_hub/src/model/musedash/md_player_info.dart';
import 'package:rank_hub/src/model/musedash/md_player_record.dart';
import 'package:rank_hub/src/pages/add_moe_md_screen.dart';
import 'package:rank_hub/src/provider/data_source_provider.dart';

class MoeMdProvider
    extends DataSourceProvider<MdPlayerRecord, MdPlayerInfo, MdMusic, dynamic> {
  @override
  Future<MdPlayerInfo> addPlayer(String? token) {
    // TODO: implement addPlayer
    throw UnimplementedError();
  }

  @override
  Widget buildAddPlayerScreen() {
    return AddMoeMdScreen(provider: this);
  }

  @override
  Widget buildOverviewCard() {
    // TODO: implement buildOverviewCard
    throw UnimplementedError();
  }

  @override
  Widget buildPlayerDetailScreen(MdPlayerInfo playerData) {
    // TODO: implement buildPlayerDetailScreen
    throw UnimplementedError();
  }

  @override
  Widget buildProviderIcon() {
    return CachedNetworkImage(
      imageUrl: 'https://musedash.moe/img/icons/android-chrome-512x512.png',
      width: 36,
      height: 36,
      fit: BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 500),
      placeholder: (context, url) => Transform.scale(
        scale: 0.4,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.image_not_supported,
        size: 16,
      ),
    );
  }

  @override
  Widget buildRankedRecordList() {
    // TODO: implement buildRankedRecordList
    throw UnimplementedError();
  }

  @override
  Widget buildRecordCard(MdPlayerRecord recordData) {
    // TODO: implement buildRecordCard
    throw UnimplementedError();
  }

  @override
  Widget buildRecordList() {
    // TODO: implement buildRecordList
    throw UnimplementedError();
  }

  @override
  Widget buildSongCard(MdMusic songData) {
    // TODO: implement buildSongCard
    throw UnimplementedError();
  }

  @override
  Widget buildSongDetailScreen(MdMusic songData) {
    // TODO: implement buildSongDetailScreen
    throw UnimplementedError();
  }

  @override
  Widget buildSongList() {
    // TODO: implement buildSongList
    throw UnimplementedError();
  }

  @override
  Future<void> deletePlayer() {
    // TODO: implement deletePlayer
    throw UnimplementedError();
  }

  @override
  Future<List<MdPlayerRecord>> filterRecords(filterData) {
    // TODO: implement filterRecords
    throw UnimplementedError();
  }

  @override
  Future<List<MdMusic>> getAllSongs({bool forceRefresh = false}) {
    // TODO: implement getAllSongs
    throw UnimplementedError();
  }

  @override
  Future<MdPlayerInfo> getPlayerDetail() {
    // TODO: implement getPlayerDetail
    throw UnimplementedError();
  }

  @override
  String getProviderGameName() {
    return "Muse Dash";
  }

  @override
  String getProviderLoacation() {
    return "musedash.moe";
  }

  @override
  String getProviderName() {
    return "MuseDash.moe";
  }

  @override
  Future<Map<String, List<MdPlayerRecord>>> getRankedRecords() {
    // TODO: implement getRankedRecords
    throw UnimplementedError();
  }

  @override
  Future<List<MdPlayerRecord>> getRecords({bool forceRefresh = false}) {
    // TODO: implement getRecords
    throw UnimplementedError();
  }

  @override
  Future<MdMusic> getSongDetail() {
    // TODO: implement getSongDetail
    throw UnimplementedError();
  }

  @override
  Future<List<MdMusic>> searchSongs(String query) {
    // TODO: implement searchSongs
    throw UnimplementedError();
  }
  
  @override
  String getRankedRecordsTitle() {
    return 'MOE PTT';
  }
  
  @override
  Widget buildPlayerListCard(BuildContext context, MdPlayerInfo playerData) {
    // TODO: implement buildPlayerListCard
    throw UnimplementedError();
  }
}
