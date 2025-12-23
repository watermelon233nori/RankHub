import 'package:rank_hub/core/game.dart';
import 'package:rank_hub/core/game_id.dart';

/// 游戏注册表
/// 管理所有游戏实例
///
/// 注意: 游戏与平台的关联关系由 PlatformGameRegistry 管理
class GameRegistryProvider {
  final Map<String, Game> _games = {};

  /// 注册游戏
  ///
  /// [game] 游戏实例
  void registerGame(Game game) {
    final gameKey = game.id.value;

    if (_games.containsKey(gameKey)) {
      throw Exception('Game already registered: $gameKey');
    }

    _games[gameKey] = game;
  }

  /// 批量注册游戏
  ///
  /// [games] 游戏列表
  void registerGames(List<Game> games) {
    for (final game in games) {
      registerGame(game);
    }
  }

  /// 根据ID查找游戏
  ///
  /// [id] 游戏ID
  Game? findById(GameId id) {
    return _games[id.value];
  }

  /// 根据ID字符串查找游戏
  ///
  /// [id] 游戏ID字符串
  Game? findByIdString(String id) {
    return _games[id];
  }

  /// 检查游戏是否已注册
  ///
  /// [id] 游戏ID
  bool hasGame(GameId id) {
    return _games.containsKey(id.value);
  }

  /// 获取所有游戏
  List<Game> getAllGames() {
    return _games.values.toList();
  }

  /// 获取所有游戏ID字符串
  List<String> getAllGameIdStrings() {
    return _games.keys.toList();
  }

  /// 根据游戏ID字符串列表获取游戏
  ///
  /// [idStrings] 游戏ID字符串列表
  List<Game> getGamesByIdStrings(List<String> idStrings) {
    return idStrings.map((id) => _games[id]).whereType<Game>().toList();
  }

  /// 移除游戏
  ///
  /// [id] 游戏ID
  void unregisterGame(GameId id) {
    _games.remove(id.value);
  }

  /// 清空所有游戏
  void clear() {
    _games.clear();
  }

  /// 获取游戏数量
  int get gameCount => _games.length;

  /// 检查是否为空
  bool get isEmpty => _games.isEmpty;

  /// 检查是否非空
  bool get isNotEmpty => _games.isNotEmpty;

  /// 获取游戏名称映射
  Map<String, String> getGameNames() {
    return Map.fromEntries(
      _games.entries.map((e) => MapEntry(e.key, e.value.name)),
    );
  }
}
