import 'package:rank_hub/core/game_id.dart';
import 'package:rank_hub/core/platform_id.dart';

/// 平台-游戏关联注册表
/// 管理平台和游戏之间的多对多关系
///
/// 使用场景:
/// - 一个平台可以支持多个游戏 (如 LXNS 支持 MaimaiDX 和 Chunithm)
/// - 一个游戏可以被多个平台支持 (如 MaimaiDX 可以通过 LXNS、DivingFish 等平台访问)
///
/// 注意: 内部使用字符串存储ID,避免GameId的复杂构造
class PlatformGameRegistry {
  /// 平台 -> 游戏列表的映射
  final Map<String, Set<String>> _platformToGames = {};

  /// 游戏 -> 平台列表的映射
  final Map<String, Set<String>> _gameToPlatforms = {};

  /// 关联平台和游戏
  ///
  /// [platformId] 平台ID
  /// [gameId] 游戏ID
  void associate(PlatformId platformId, GameId gameId) {
    final platformKey = platformId.value;
    final gameKey = gameId.value;

    // 添加到平台->游戏映射
    _platformToGames.putIfAbsent(platformKey, () => {}).add(gameKey);

    // 添加到游戏->平台映射
    _gameToPlatforms.putIfAbsent(gameKey, () => {}).add(platformKey);
  }

  /// 批量关联平台和游戏
  ///
  /// [platformId] 平台ID
  /// [gameIds] 游戏ID列表
  void associateMultiple(PlatformId platformId, List<GameId> gameIds) {
    for (final gameId in gameIds) {
      associate(platformId, gameId);
    }
  }

  /// 取消平台和游戏的关联
  ///
  /// [platformId] 平台ID
  /// [gameId] 游戏ID
  void disassociate(PlatformId platformId, GameId gameId) {
    final platformKey = platformId.value;
    final gameKey = gameId.value;

    // 从平台->游戏映射中移除
    _platformToGames[platformKey]?.remove(gameKey);
    if (_platformToGames[platformKey]?.isEmpty ?? false) {
      _platformToGames.remove(platformKey);
    }

    // 从游戏->平台映射中移除
    _gameToPlatforms[gameKey]?.remove(platformKey);
    if (_gameToPlatforms[gameKey]?.isEmpty ?? false) {
      _gameToPlatforms.remove(gameKey);
    }
  }

  /// 获取平台支持的所有游戏ID字符串
  ///
  /// [platformId] 平台ID
  /// 返回游戏ID字符串列表，如果平台不存在则返回空列表
  List<String> getGamesForPlatform(PlatformId platformId) {
    final gameKeys = _platformToGames[platformId.value] ?? {};
    return gameKeys.toList();
  }

  /// 获取支持某个游戏的所有平台ID字符串
  ///
  /// [gameId] 游戏ID
  /// 返回平台ID字符串列表，如果游戏不存在则返回空列表
  List<String> getPlatformsForGame(GameId gameId) {
    final platformKeys = _gameToPlatforms[gameId.value] ?? {};
    return platformKeys.toList();
  }

  /// 检查平台是否支持某个游戏
  ///
  /// [platformId] 平台ID
  /// [gameId] 游戏ID
  bool isPlatformSupportGame(PlatformId platformId, GameId gameId) {
    return _platformToGames[platformId.value]?.contains(gameId.value) ?? false;
  }

  /// 检查游戏是否被某个平台支持
  ///
  /// [gameId] 游戏ID
  /// [platformId] 平台ID
  bool isGameSupportedByPlatform(GameId gameId, PlatformId platformId) {
    return _gameToPlatforms[gameId.value]?.contains(platformId.value) ?? false;
  }

  /// 获取平台支持的游戏数量
  ///
  /// [platformId] 平台ID
  int getGameCountForPlatform(PlatformId platformId) {
    return _platformToGames[platformId.value]?.length ?? 0;
  }

  /// 获取游戏被多少个平台支持
  ///
  /// [gameId] 游戏ID
  int getPlatformCountForGame(GameId gameId) {
    return _gameToPlatforms[gameId.value]?.length ?? 0;
  }

  /// 移除平台的所有关联
  ///
  /// [platformId] 平台ID
  void removePlatformAssociations(PlatformId platformId) {
    final platformKey = platformId.value;
    final gameKeys = _platformToGames[platformKey] ?? {};

    // 从所有游戏的平台列表中移除此平台
    for (final gameKey in gameKeys) {
      _gameToPlatforms[gameKey]?.remove(platformKey);
      if (_gameToPlatforms[gameKey]?.isEmpty ?? false) {
        _gameToPlatforms.remove(gameKey);
      }
    }

    // 移除平台的所有游戏关联
    _platformToGames.remove(platformKey);
  }

  /// 移除游戏的所有关联
  ///
  /// [gameId] 游戏ID
  void removeGameAssociations(GameId gameId) {
    final gameKey = gameId.value;
    final platformKeys = _gameToPlatforms[gameKey] ?? {};

    // 从所有平台的游戏列表中移除此游戏
    for (final platformKey in platformKeys) {
      _platformToGames[platformKey]?.remove(gameKey);
      if (_platformToGames[platformKey]?.isEmpty ?? false) {
        _platformToGames.remove(platformKey);
      }
    }

    // 移除游戏的所有平台关联
    _gameToPlatforms.remove(gameKey);
  }

  /// 获取所有平台ID字符串
  List<String> getAllPlatformIds() {
    return _platformToGames.keys.toList();
  }

  /// 获取所有游戏ID字符串
  List<String> getAllGameIds() {
    return _gameToPlatforms.keys.toList();
  }

  /// 清空所有关联
  void clear() {
    _platformToGames.clear();
    _gameToPlatforms.clear();
  }

  /// 获取关联统计信息
  Map<String, dynamic> getStats() {
    return {
      'total_platforms': _platformToGames.length,
      'total_games': _gameToPlatforms.length,
      'total_associations': _platformToGames.values.fold<int>(
        0,
        (sum, games) => sum + games.length,
      ),
    };
  }

  /// 获取所有关联关系 (用于调试)
  Map<String, List<String>> getPlatformGameMap() {
    return _platformToGames.map(
      (platform, games) => MapEntry(platform, games.toList()),
    );
  }

  /// 获取所有关联关系 (游戏视角, 用于调试)
  Map<String, List<String>> getGamePlatformMap() {
    return _gameToPlatforms.map(
      (game, platforms) => MapEntry(game, platforms.toList()),
    );
  }

  /// 检查是否存在任何关联
  bool get isEmpty => _platformToGames.isEmpty && _gameToPlatforms.isEmpty;

  /// 检查是否存在关联
  bool get isNotEmpty => !isEmpty;
}
