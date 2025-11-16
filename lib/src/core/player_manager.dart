import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/player.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';
import 'package:rank_hub/src/core/abstract/data_source_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'player_manager.g.dart';

@riverpod
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}

@riverpod
Future<Box<Player>> playerBox(Ref ref) async {
  return Hive.openBox<Player>("playerBox");
}

@riverpod
class PlayerManager extends _$PlayerManager {
  @override
  Future<({List<Player> players, String? activePlayerId})> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final playerBox = await ref.watch(playerBoxProvider.future);

    var activePlayerId = prefs.getString('currentPlayer');

    if (activePlayerId != null && !playerBox.containsKey(activePlayerId)) {
      await prefs.remove('currentPlayer');
    }
    if (activePlayerId == null && playerBox.isNotEmpty) {
      activePlayerId = playerBox.keys.first as String;
      await prefs.setString('currentPlayer', activePlayerId);
    }

    print('Active Player ID: $activePlayerId');

    return (
      players: playerBox.values.toList(),
      activePlayerId: activePlayerId,
    );
  }

  Future<void> addPlayer(
    String playerId,
    String playerName,
    String dataSourceName, {
    String? avatarUrl,
    String? backgroundUrl,
  }) async {
    final playerBox = await ref.read(playerBoxProvider.future);
    if (playerBox.containsKey(playerId)) return;

    playerBox.put(
      playerId,
      Player(
        name: playerName,
        provider: dataSourceName,
        uuid: playerId,
        avatarUrl: avatarUrl,
        backgroundUrl: backgroundUrl,
      ),
    );

    final activePlayerId = state.value?.activePlayerId ?? playerId;
    await _updateState(playerBox, activePlayerId);
  }

  Future<void> removePlayer(String playerId) async {
    final playerBox = await ref.read(playerBoxProvider.future);
    if (!playerBox.containsKey(playerId)) return;

    playerBox.delete(playerId);

    final prefs = await ref.read(sharedPreferencesProvider.future);
    String? newActivePlayerId = state.value?.activePlayerId == playerId
        ? null
        : state.value?.activePlayerId;

    if (newActivePlayerId == null && playerBox.isNotEmpty) {
      newActivePlayerId = playerBox.keys.first as String;
    }

    await prefs.setString('currentPlayer', newActivePlayerId ?? '');
    await _updateState(playerBox, newActivePlayerId);
  }

  Future<void> switchActivePlayer(String playerId) async {
    final playerBox = await ref.read(playerBoxProvider.future);
    if (!playerBox.containsKey(playerId)) return;

    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString('currentPlayer', playerId);

    await _updateState(playerBox, playerId);
  }

  String? getDataSourceName({String? playerId}) {
    final playerBox = ref.read(playerBoxProvider).value;
    return playerBox?.get(playerId ?? state.value?.activePlayerId)?.provider;
  }

  Future<DataSourceProvider?> getDataSource({String? playerId}) async {
    final dataSource = await ref.watch(dataSourceManagerProvider.future);
    return dataSource.sources[getDataSourceName(playerId: playerId)];
  }

  String? getPlayerName({String? playerId}) {
    final playerBox = ref.read(playerBoxProvider).value;
    return playerBox?.get(playerId ?? state.value?.activePlayerId)?.name;
  }

  Future<Player?> getPlayerById(String playerId) async {
    final playerBox = await ref.read(playerBoxProvider.future);
    return playerBox.get(playerId);
  }

  List<Player> getAllPlayers() {
    final playerBox = ref.read(playerBoxProvider).value;
    return playerBox?.values.toList() ?? [];
  }

  List<String> getAllPlayersId() {
    final playerBox = ref.read(playerBoxProvider).value;
    return playerBox?.keys.map((e) => e as String).toList() ?? [];
  }

  String? getCurrentPlayerId() {
    return state.value?.activePlayerId;
  }

  Future<void> _updateState(Box<Player> playerBox, String? activePlayerId) async {
    state = AsyncData((
      players: playerBox.values.toList(),
      activePlayerId: activePlayerId,
    ));
  }
}
