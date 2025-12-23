# 账号关联资源使用示例

## 功能说明

当 `GameResourceDefinition` 的 `accountRelated` 字段设置为 `true` 时，该资源会在账号切换时自动失效并重新加载。

## 使用方法

### 1. 定义账号关联的资源

```dart
class UserScoresResource extends GameResourceDefinition<List<Score>> {
  @override
  ResourceKey get key => ResourceKey(
    namespace: 'maimai',
    name: 'user_scores',
  );

  @override
  Duration? get ttl => const Duration(hours: 1);

  @override
  bool get accountRelated => true; // 标记为账号关联

  @override
  Future<List<Score>> fetch(GameContext context) async {
    if (context.account == null) {
      throw Exception('需要登录账号才能获取成绩数据');
    }
    
    // 使用账号信息获取数据
    final api = MaimaiApi(account: context.account!);
    return await api.fetchUserScores();
  }

  @override
  List<Score>? loadCache() {
    // 从本地缓存加载
    return null;
  }

  @override
  Future<void> persist(List<Score> data) async {
    // 持久化到本地
  }
}
```

### 2. 定义非账号关联的资源

```dart
class SongListResource extends GameResourceDefinition<List<Song>> {
  @override
  ResourceKey get key => ResourceKey(
    namespace: 'maimai',
    name: 'song_list',
  );

  @override
  Duration? get ttl => const Duration(days: 7);

  @override
  bool get accountRelated => false; // 不关联账号，账号切换时保持缓存

  @override
  Future<List<Song>> fetch(GameContext context) async {
    // 获取游戏曲目列表，不需要账号
    final api = MaimaiApi();
    return await api.fetchSongList();
  }

  @override
  List<Song>? loadCache() {
    return null;
  }

  @override
  Future<void> persist(List<Song> data) async {
  }
}
```

### 3. 在 UI 中使用

```dart
class UserProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresKey = ResourceKey(
      namespace: 'maimai',
      name: 'user_scores',
    );
    
    final scoresState = ref.watch(resourceProvider(scoresKey));
    
    return scoresState.when(
      data: (scores) {
        // 显示成绩数据
        return ListView.builder(
          itemCount: scores.length,
          itemBuilder: (context, index) {
            return ScoreCard(score: scores[index]);
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (e, st) => ErrorWidget(error: e),
    );
  }
}
```

## 工作原理

### 账号切换流程

1. **用户切换账号**: 调用 `CoreProvider.setCurrentAccount(newAccount, ref)`
2. **检测账号变化**: 比较新旧账号的 `platformId` 和 `accountIdentifier`
3. **失效相关资源**: 如果账号发生变化，调用 `ResourceLoader.invalidateAccountRelatedResources()`
4. **清除缓存**: 遍历所有资源，清除标记为 `accountRelated: true` 的资源缓存和时间戳
5. **自动重新加载**: 由于 `resourceProvider` 监听了 `coreContextProvider`，账号切换会触发 provider 重建，自动重新加载资源

### 日志输出

```
🔄 失效账号关联资源: maimai:user_scores
🔄 失效账号关联资源: maimai:user_profile
⏸️ 取消账号关联资源加载: maimai:user_ranking
✨ 账号切换，已失效账号关联资源
```

## 最佳实践

### 何时使用 `accountRelated: true`

- ✅ 用户个人数据 (成绩、档案、收藏等)
- ✅ 用户特定的统计数据
- ✅ 需要身份验证的 API 请求
- ✅ 用户相关的推荐内容

### 何时使用 `accountRelated: false`

- ✅ 全局的游戏数据 (曲目列表、难度表等)
- ✅ 公共的排行榜数据
- ✅ 游戏元数据和配置
- ✅ 不依赖用户身份的内容

## 性能优化

### 避免过度失效

只将真正依赖账号的资源标记为 `accountRelated: true`。全局数据应该在所有账号间共享，避免重复下载。

### 缓存策略

```dart
// 账号关联资源：较短的 TTL
@override
Duration? get ttl => const Duration(hours: 1);

// 全局资源：较长的 TTL
@override
Duration? get ttl => const Duration(days: 7);
```

### 依赖管理

```dart
class UserRatingResource extends GameResourceDefinition<Rating> {
  @override
  bool get accountRelated => true;
  
  @override
  List<ResourceKey> get dependencies => [
    ResourceKey(namespace: 'maimai', name: 'user_scores'), // 依赖也会自动失效
  ];
}
```

## 注意事项

1. **依赖链失效**: 如果资源 A 依赖资源 B，且 A 标记为 `accountRelated`，当 A 失效时会自动重新加载 B
2. **正在加载的请求**: 账号切换时会取消所有正在进行的账号关联资源加载请求
3. **UI 响应**: `resourceProvider` 使用 `autoDispose`，当页面销毁时会自动清理，避免内存泄漏
4. **错误处理**: 账号切换后重新加载资源可能失败（如新账号未授权），需要在 UI 中妥善处理错误状态
