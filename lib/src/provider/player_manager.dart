import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:rank_hub/src/model/player.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';
import 'package:rank_hub/src/provider/data_source_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'player_manager.g.dart';

@riverpod
class PlayerManager extends _$PlayerManager {
  String? _activePlayerId;

  late Box<Player> _playerBox;

  static const _currentPlayerKey = 'currentPlayer';

  @override
  Future<(List<Player> players, String? activePlayerId)> build() async {
    final prefs = await SharedPreferences.getInstance();
    _playerBox = await Hive.openBox<Player>("playerBox");
    _activePlayerId = prefs.getString(_currentPlayerKey);

    return (_playerBox.values.toList(), _activePlayerId);
  }

  // 添加玩家并绑定数据源
  Future<void> addPlayer(String playerId, String playerName, String dataSourceName) async {
    if (_playerBox.containsKey(playerId)) {
      return; // 避免重复添加
    }
    _playerBox.put(playerId, Player(name: playerName, provider: dataSourceName, uuid: playerId));

    // 如果是第一个玩家，设置为活动玩家
    if (_activePlayerId == null) {
      await switchActivePlayer(playerId);
    }

    state = AsyncData((_playerBox.values.toList(), _activePlayerId)); // 触发 UI 更新
  }

  // 删除玩家
  Future<void> removePlayer(String playerId) async {
    if (!_playerBox.containsKey(playerId)) {
      return;
    }

    _playerBox.delete(playerId);

    if (_activePlayerId == playerId) {
      _activePlayerId = null;
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_currentPlayerKey);

      if (_playerBox.isNotEmpty) {
        await switchActivePlayer(_playerBox.keys.first);
      }
    }

    state = AsyncData((_playerBox.values.toList(), _activePlayerId));
  }

  // 切换活动玩家
  Future<void> switchActivePlayer(String playerId) async {
    if (_activePlayerId == playerId || !_playerBox.containsKey(playerId)) {
      return;
    }
    _activePlayerId = playerId;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentPlayerKey, playerId);

    state = AsyncData((_playerBox.values.toList(), _activePlayerId));
  }

  String? getDataSourceName({String? playerId}) {
    return _playerBox.get(playerId ?? _activePlayerId)?.provider;
  }

  Future<DataSourceProvider?> getDataSource({String? playerId}) async {
    final dataSource = await ref.watch(dataSourceManagerProvider.future);

    return dataSource.sources[getDataSourceName(playerId: playerId)];
  }

  String? getPlayerName({String? playerId}) {
    return _playerBox.get(playerId ?? _activePlayerId)?.name;
  }

  List<Player> getAllPlayers() {
    return _playerBox.values.toList();
  }

  List<String> getAllPlayersId() {
    return _playerBox.keys.toList() as List<String>;
  }

  String? getCurrentPlayerId() {
    return _activePlayerId;
  }
}
