# 平台-游戏多对多关系使用指南

## 概述

重构后的架构采用**平台-游戏多对多关系**设计，通过 `PlatformGameRegistry` 管理关联，解耦了游戏和平台的直接依赖。

### 核心组件

1. **GameRegistryProvider**: 仅管理游戏实例
2. **PlatformRegistryProvider**: 仅管理平台实例
3. **PlatformGameRegistry**: 管理平台和游戏之间的多对多关联关系
4. **CoreProvider**: 提供统一的访问接口

## 设计原则

### 之前的问题 ❌
```dart
// 游戏注册时必须指定平台
gameRegistry.registerGame(maimaiGame, lxnsPlatformId);

// 一个游戏只能属于一个平台
// 如果 MaimaiDX 既能通过 LXNS 也能通过 DivingFish 访问？
// 需要创建两个游戏实例或使用复杂的继承
```

### 现在的设计 ✅
```dart
// 1. 单独注册游戏 (不关心平台)
gameRegistry.registerGame(maimaiGame);

// 2. 单独注册平台
platformRegistry.registerPlatform(lxnsPlatform);
platformRegistry.registerPlatform(divingfishPlatform);

// 3. 建立关联 (多对多)
platformGameRegistry.associate(lxnsPlatform.id, maimaiGame.id);
platformGameRegistry.associate(divingfishPlatform.id, maimaiGame.id);

// 现在 MaimaiDX 可以通过两个平台访问！
```

## 使用示例

### 1. 基础注册流程

```dart
// 在模块初始化时
class LXNSModule {
  void initialize(CoreProvider core) {
    // 注册游戏
    final maimaiGame = MaimaiDXGame();
    final chunithmGame = ChunithmGame();
    
    core.gameRegistry.registerGames([maimaiGame, chunithmGame]);
    
    // 注册平台
    final lxnsPlatform = LXNSPlatform();
    core.platformRegistry.registerPlatform(lxnsPlatform);
    
    // 建立关联 - LXNS 支持这两个游戏
    core.platformGameRegistry.associate(lxnsPlatform.id, maimaiGame.id);
    core.platformGameRegistry.associate(lxnsPlatform.id, chunithmGame.id);
  }
}

class DivingFishModule {
  void initialize(CoreProvider core) {
    // 只需要注册平台，游戏已经注册过了
    final divingfishPlatform = DivingFishPlatform();
    core.platformRegistry.registerPlatform(divingfishPlatform);
    
    // 建立关联 - DivingFish 也支持 MaimaiDX
    final maimaiGame = core.gameRegistry.findByIdString('maimai-dx-intl-cn');
    if (maimaiGame != null) {
      core.platformGameRegistry.associate(
        divingfishPlatform.id,
        maimaiGame.id,
      );
    }
  }
}
```

### 2. 查询关联关系

```dart
// 获取平台支持的所有游戏
final lxnsGames = core.getGamesByPlatform('lxns');
// 返回: [MaimaiDXGame, ChunithmGame]

// 获取支持某个游戏的所有平台
final maimaiPlatforms = core.getPlatformsForGame('maimai-dx-intl-cn');
// 返回: [LXNSPlatform, DivingFishPlatform]

// 检查平台是否支持游戏
final isSupported = core.isPlatformSupportGame('lxns', 'maimai-dx-intl-cn');
// 返回: true
```

### 3. 批量关联

```dart
// 批量关联多个游戏到一个平台
final arcaeaPlatform = ArcaeaPlatform();
core.platformRegistry.registerPlatform(arcaeaPlatform);

final games = [arcaeaGame, arcaeaCNGame, arcaeaNSGame];
core.gameRegistry.registerGames(games);

core.platformGameRegistry.associateMultiple(
  arcaeaPlatform.id,
  games.map((g) => g.id).toList(),
);
```

### 4. 动态管理关联

```dart
// 取消关联
core.platformGameRegistry.disassociate(
  lxnsPlatform.id,
  oldGame.id,
);

// 移除平台的所有关联
core.platformGameRegistry.removePlatformAssociations(lxnsPlatform.id);

// 移除游戏的所有关联
core.platformGameRegistry.removeGameAssociations(maimaiGame.id);
```

## 多对多关系示例

### 场景 1: 多个平台支持同一游戏

```
[LXNS Platform] ──┐
                   ├──> [Maimai DX Game]
[DivingFish]  ────┘

// 用户可以选择通过 LXNS 或 DivingFish 玩 Maimai DX
```

### 场景 2: 一个平台支持多个游戏

```
                ┌──> [Maimai DX Game]
[LXNS Platform] ├──> [Chunithm Game]
                └──> [ONGEKI Game]

// LXNS 平台提供三个游戏的数据服务
```

### 场景 3: 复杂的多对多关系

```
[LXNS] ─────┬──> [Maimai DX]
            │
[DivingFish]┼──> [Chunithm]
            │
[Arcade]────┴──> [ONGEKI]

// 多个平台，多个游戏，灵活组合
```

## API 参考

### PlatformGameRegistry

```dart
// 关联管理
void associate(PlatformId platformId, GameId gameId)
void associateMultiple(PlatformId platformId, List<GameId> gameIds)
void disassociate(PlatformId platformId, GameId gameId)

// 查询
List<String> getGamesForPlatform(PlatformId platformId)
List<String> getPlatformsForGame(GameId gameId)
bool isPlatformSupportGame(PlatformId platformId, GameId gameId)

// 统计
int getGameCountForPlatform(PlatformId platformId)
int getPlatformCountForGame(GameId gameId)

// 清理
void removePlatformAssociations(PlatformId platformId)
void removeGameAssociations(GameId gameId)
void clear()

// 调试
Map<String, dynamic> getStats()
Map<String, List<String>> getPlatformGameMap()
```

### CoreProvider 便捷方法

```dart
// 通过平台获取游戏
List<Game> getGamesByPlatform(String platformId)

// 通过游戏获取平台
List<Platform> getPlatformsForGame(String gameIdString)

// 检查关联
bool isPlatformSupportGame(String platformId, String gameIdString)
```

## 最佳实践

### 1. 模块化注册

每个模块负责注册自己的游戏和平台，并建立关联：

```dart
// lib/modules/lxns/lxns_module.dart
class LXNSModule {
  static void register(CoreProvider core) {
    // 注册平台
    final platform = LXNSPlatform();
    core.platformRegistry.registerPlatform(platform);
    
    // 注册游戏
    final games = [MaimaiDXGame(), ChunithmGame()];
    core.gameRegistry.registerGames(games);
    
    // 建立关联
    for (final game in games) {
      core.platformGameRegistry.associate(platform.id, game.id);
    }
  }
}
```

### 2. 检查游戏是否已注册

避免重复注册游戏：

```dart
final gameId = 'maimai-dx-intl-cn';
if (!core.gameRegistry.hasGame(GameId.fromString(gameId))) {
  core.gameRegistry.registerGame(MaimaiDXGame());
}
```

### 3. 统计和调试

```dart
// 获取关联统计
final stats = core.platformGameRegistry.getStats();
print('平台数: ${stats['total_platforms']}');
print('游戏数: ${stats['total_games']}');
print('关联数: ${stats['total_associations']}');

// 查看所有关联关系
final map = core.platformGameRegistry.getPlatformGameMap();
map.forEach((platform, games) {
  print('$platform 支持游戏: ${games.join(', ')}');
});
```

## 迁移指南

### 从旧架构迁移

**之前**:
```dart
gameRegistry.registerGame(game, platformId);
final games = gameRegistry.getGamesByPlatform(platformId);
```

**现在**:
```dart
// 分离注册
gameRegistry.registerGame(game);
platformRegistry.registerPlatform(platform);
platformGameRegistry.associate(platformId, gameId);

// 使用便捷方法
final games = core.getGamesByPlatform(platformId.value);
```

## 注意事项

1. **ID 使用字符串**: 内部使用 `.value` 字符串避免 GameId 的复杂构造
2. **关联前确保注册**: 必须先注册游戏和平台，再建立关联
3. **清理顺序**: 删除平台或游戏时，记得清理关联关系
4. **线程安全**: 当前实现非线程安全，建议在主线程进行注册操作

## 总结

新的多对多关系架构带来的优势：

✅ **解耦**: 游戏和平台独立注册，互不依赖  
✅ **灵活**: 支持一个游戏多个平台，一个平台多个游戏  
✅ **可维护**: 关联关系集中管理，便于调试和修改  
✅ **可扩展**: 添加新平台或游戏无需修改现有代码  
✅ **清晰**: 职责分离，每个组件只管理自己的数据
