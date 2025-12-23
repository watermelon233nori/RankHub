# RankHub Core 框架使用文档

## 目录

1. [框架概述](#框架概述)
2. [核心概念](#核心概念)
3. [快速开始](#快速开始)
4. [详细使用指南](#详细使用指南)
5. [示例代码](#示例代码)
6. [最佳实践](#最佳实践)

---

## 框架概述

RankHub Core 是一个模块化的架构框架，用于管理多平台、多游戏的数据和资源。它提供了统一的抽象层，使得添加新平台和游戏变得简单且可维护。

### 主要特性

- **平台-游戏两级抽象**：清晰分离平台（数据源）和游戏（内容提供者）
- **资源管理系统**：支持依赖管理、缓存、TTL 的资源加载器
- **凭据管理**：统一的凭据提供者，支持 API Key、OAuth2、用户名密码
- **插件式扩展**：通过注册表轻松添加新平台、游戏和资源

---

## 核心概念

### 1. 基础类型

#### PlatformId
```dart
// 平台唯一标识符
const lxnsId = PlatformId('lxns');
```

#### GameId
```dart
// 游戏唯一标识符（包含名称、版本、平台、区域）
const maimaiId = GameId(
  name: 'maimaidx',
  version: '1.51-I',
  platform: 'arcade',
  region: 'cn',
);
```

#### ResourceKey
```dart
// 资源键（命名空间、名称、作用域）
const songListKey = ResourceKey(
  namespace: 'maimai',
  name: 'song_list',
  scope: 'wiki',
);
```

#### Account
```dart
// 账号信息
final account = Account(
  platformId: 'lxns',
  credentials: {
    'access_token': 'xxx',
    'refresh_token': 'yyy',
    'external_id': '1234',
  },
);
```

### 2. 平台 (Platform)

平台是数据源的抽象，负责：
- 处理用户登录/认证
- 管理凭据（access token, refresh token 等）
- 提供一个或多个游戏的访问

```dart
abstract class Platform {
  PlatformId get id;
  String get name;
  ImageProvider get icon;

  Widget buildLoginPage();
  Future<Account> login();
  Future<Account> refresh(Account account);
  Future<bool> validate(Account account);
}
```

### 3. 游戏 (Game)

游戏是内容提供者，负责：
- 定义游戏的页面结构（曲库、成绩、工具箱等）
- 注册游戏特定的资源和工具
- 提供游戏描述信息

```dart
abstract class Game {
  GameId get id;
  String get name;
  GameDescriptor get descriptor;
}
```

### 4. 资源系统

#### GameResourceDefinition

资源定义描述如何获取、缓存和持久化数据：

```dart
abstract class GameResourceDefinition<T> {
  ResourceKey get key;
  Duration? get ttl;  // 缓存有效期
  List<ResourceKey> get dependencies;  // 依赖的其他资源

  Future<T> fetch(GameContext context);  // 从远端获取
  T? loadCache();  // 从本地加载缓存
  Future<void> persist(T data);  // 持久化到本地
}
```

#### ResourceLoader

资源加载器负责：
- 自动解析和加载依赖
- 管理缓存和过期时间
- 检测循环依赖
- 支持强制刷新

```dart
final loader = ResourceLoader(
  registry: resourceRegistry,
  context: gameContext,
);

// 加载资源（自动处理依赖和缓存）
final songs = await loader.load<List<Song>>(songListKey);

// 强制刷新
final freshSongs = await loader.forceRefresh<List<Song>>(songListKey);

// 尝试读取（不触发网络请求）
final cached = loader.tryLoad<List<Song>>(songListKey);
```

### 5. 凭据管理

#### CredentialProvider

凭据提供者负责获取、刷新和验证凭据：

```dart
// API Key 类型
class MyApiKeyProvider extends ApiKeyCredentialProvider {
  @override
  PlatformId get platformId => PlatformId('myplatform');
  
  @override
  Future<bool> validateCredential(Account account) async {
    // 验证逻辑
  }
}

// OAuth2 类型
class MyOAuth2Provider extends OAuth2CredentialProvider {
  @override
  PlatformId get platformId => PlatformId('myplatform');
  
  @override
  Future<Map<String, dynamic>> requestTokenRefresh(String refreshToken) async {
    // 刷新 token 逻辑
  }
}

// 用户名密码类型
class MyUserPassProvider extends UserPasswordCredentialProvider {
  @override
  PlatformId get platformId => PlatformId('myplatform');
  
  @override
  Future<bool> validateCredential(Account account) async {
    // 验证逻辑
  }
}
```

### 6. 平台适配器 (PlatformAdapter)

平台适配器将平台的数据源与游戏的资源系统连接：

```dart
class MyPlatformAdapter extends BasePlatformAdapter {
  MyPlatformAdapter() : super(
    id: PlatformId('myplatform'),
    supportedGames: [
      GameId(name: 'game1', version: 'v1', platform: 'mobile', region: 'cn'),
    ],
  );

  @override
  Future<T?> fetchResourceImpl<T>(ResourceKey key, Account account) async {
    // 根据 key 获取对应的资源
    if (key.namespace == 'game1' && key.name == 'song_list') {
      return await _api.getSongs(account) as T;
    }
    return null;
  }
}
```

---

## 快速开始

### 1. 初始化服务提供者

```dart
void main() {
  final service = ServiceProvider.instance;
  
  // 注册平台
  service.platformRegistry.registerPlatform(MyPlatform());
  
  // 注册游戏
  service.gameRegistry.registerGame(MyGame(), PlatformId('myplatform'));
  
  // 注册凭据提供者
  service.registerCredentialProvider(MyCredentialProvider());
  
  // 注册登录处理器
  service.registerLoginHandler(MyLoginHandler());
  
  // 注册平台适配器
  service.adapterRegistry.registerAdapter(MyPlatformAdapter());
  
  runApp(MyApp());
}
```

### 2. 用户登录

```dart
// 获取登录处理器
final loginHandler = ServiceProvider.instance.getLoginHandler(platformId);

// 显示登录页面
final result = await loginHandler.showLoginPage(context);

if (result != null) {
  // 创建账号
  final account = await ServiceProvider.instance.accountProvider.createAccount(
    platformId: platformId,
    credentials: result.credentialData,
  );
  
  print('登录成功: ${result.displayName}');
}
```

### 3. 加载游戏资源

```dart
// 创建游戏上下文
final gameContext = GameContext(
  game: myGame,
  account: account,
  adapters: [myAdapter],
  resourceLoader: loader,
);

// 定义资源
class SongListResource extends GameResourceDefinition<List<Song>> {
  @override
  ResourceKey get key => ResourceKey(
    namespace: 'maimai',
    name: 'song_list',
  );

  @override
  Duration? get ttl => Duration(hours: 24);

  @override
  List<ResourceKey> get dependencies => [];

  @override
  Future<List<Song>> fetch(GameContext context) async {
    // 通过适配器获取数据
    final adapter = context.adapters.firstWhere(
      (a) => a.supports(context.game.id),
    );
    return await adapter.fetchResource(key, context.account!);
  }

  @override
  List<Song>? loadCache() {
    // 从数据库读取
    return IsarService.instance.getSongs();
  }

  @override
  Future<void> persist(List<Song> data) async {
    // 保存到数据库
    await IsarService.instance.saveSongs(data);
  }
}

// 注册资源
ServiceProvider.instance.resourceRegistry.registerResource(
  SongListResource(),
);

// 加载资源
final loader = ResourceLoader(
  registry: ServiceProvider.instance.resourceRegistry,
  context: gameContext,
);

final songs = await loader.load<List<Song>>(songListKey);
```

---

## 详细使用指南

### 创建新平台

#### 1. 定义平台类

```dart
class MyPlatform implements Platform {
  @override
  PlatformId get id => PlatformId('myplatform');

  @override
  String get name => 'My Platform';

  @override
  ImageProvider get icon => AssetImage('assets/myplatform.png');

  @override
  Widget buildLoginPage() {
    return MyLoginPage();
  }

  @override
  Future<Account> login() async {
    // 登录逻辑
  }

  @override
  Future<Account> refresh(Account account) async {
    // 刷新凭据
  }

  @override
  Future<bool> validate(Account account) async {
    // 验证凭据
  }
}
```

#### 2. 创建凭据提供者

```dart
class MyCredentialProvider extends OAuth2CredentialProvider {
  @override
  PlatformId get platformId => PlatformId('myplatform');

  @override
  Future<Map<String, dynamic>> requestTokenRefresh(String refreshToken) async {
    final response = await dio.post('/oauth/refresh', data: {
      'refresh_token': refreshToken,
    });
    
    return {
      'access_token': response.data['access_token'],
      'refresh_token': response.data['refresh_token'],
      'expires_in': response.data['expires_in'],
    };
  }

  @override
  Future<bool> validateCredential(Account account) async {
    try {
      final token = account.credentials['access_token'];
      await dio.get('/api/validate', options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> createCredential(Account account, Map<String, dynamic> data) async {
    // 无需额外处理，OAuth2 父类已处理
  }

  @override
  Future<void> revokeCredential(Account account) async {
    final token = account.credentials['access_token'];
    await dio.post('/oauth/revoke', data: {'token': token});
  }
}
```

#### 3. 创建登录处理器

```dart
class MyLoginHandler extends PlatformLoginHandler {
  @override
  PlatformId get platformId => PlatformId('myplatform');

  @override
  String get platformName => 'My Platform';

  @override
  IconData get platformIcon => Icons.gamepad;

  @override
  String get platformDescription => '使用 My Platform 账号登录';

  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (_) => MyLoginPage()),
    );

    if (result == null) return null;

    return PlatformLoginResult(
      externalId: result['user_id']!,
      credentialData: {
        'access_token': result['access_token']!,
        'refresh_token': result['refresh_token']!,
        'external_id': result['user_id']!,
        'token_expiry': DateTime.now()
            .add(Duration(seconds: int.parse(result['expires_in']!)))
            .toIso8601String(),
      },
      displayName: result['username'],
      avatarUrl: result['avatar'],
    );
  }

  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentialData) async {
    // 验证逻辑
    return true;
  }

  @override
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentialData,
  ) async {
    final token = credentialData['access_token'];
    final response = await dio.get('/api/user', options: Options(
      headers: {'Authorization': 'Bearer $token'},
    ));

    return PlatformAccountInfo(
      externalId: response.data['id'].toString(),
      displayName: response.data['username'],
      avatarUrl: response.data['avatar'],
    );
  }
}
```

#### 4. 创建平台适配器

```dart
class MyPlatformAdapter extends BasePlatformAdapter {
  final Dio _dio = Dio();

  MyPlatformAdapter() : super(
    id: PlatformId('myplatform'),
    supportedGames: [
      GameId(name: 'game1', version: 'v1', platform: 'mobile', region: 'cn'),
    ],
  );

  @override
  Future<T?> fetchResourceImpl<T>(ResourceKey key, Account account) async {
    // 获取有效凭据
    final provider = ServiceProvider.instance.getCredentialProvider(id);
    final validAccount = await provider?.getCredential(account);
    final token = validAccount?.credentials['access_token'];

    // 根据资源键获取数据
    if (key.namespace == 'game1') {
      switch (key.name) {
        case 'song_list':
          final response = await _dio.get('/api/songs',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          );
          return response.data as T;
        
        case 'player_scores':
          final response = await _dio.get('/api/scores',
            options: Options(headers: {'Authorization': 'Bearer $token'}),
          );
          return response.data as T;
      }
    }

    return null;
  }
}
```

#### 5. 注册平台

```dart
void initializeMyPlatform() {
  final service = ServiceProvider.instance;

  // 注册平台
  service.platformRegistry.registerPlatform(MyPlatform());

  // 注册凭据提供者
  service.registerCredentialProvider(MyCredentialProvider());

  // 注册登录处理器
  service.registerLoginHandler(MyLoginHandler());

  // 注册适配器
  service.adapterRegistry.registerAdapter(MyPlatformAdapter());

  // 将凭据提供者注入到账号提供者
  if (service.accountProvider is MemoryAccountProvider) {
    (service.accountProvider as MemoryAccountProvider)
        .registerCredentialProvider(MyCredentialProvider());
  }
}
```

### 创建新游戏

#### 1. 定义游戏类

```dart
class MyGame implements Game {
  @override
  GameId get id => GameId(
    name: 'mygame',
    version: 'v1',
    platform: 'mobile',
    region: 'cn',
  );

  @override
  String get name => 'My Game';

  @override
  GameDescriptor get descriptor => GameDescriptor(
    libraryPages: [
      PageDescriptor(
        title: '歌曲列表',
        icon: Icons.library_music,
        builder: (context) => SongListPage(),
      ),
    ],
    scorePages: [
      PageDescriptor(
        title: '成绩',
        icon: Icons.assessment,
        builder: (context) => ScorePage(),
      ),
    ],
    toolboxPages: [],
    profilePages: [],
    resources: [
      SongListResource(),
      PlayerScoreResource(),
    ],
    tools: [],
  );
}
```

#### 2. 定义游戏资源

```dart
class SongListResource extends GameResourceDefinition<List<Song>> {
  @override
  ResourceKey get key => ResourceKey(
    namespace: 'mygame',
    name: 'song_list',
  );

  @override
  Duration? get ttl => Duration(days: 1);

  @override
  List<ResourceKey> get dependencies => [];

  @override
  Future<List<Song>> fetch(GameContext context) async {
    final adapter = context.adapters.firstWhere(
      (a) => a.supports(context.game.id),
    );
    final data = await adapter.fetchResource<dynamic>(key, context.account!);
    
    // 转换为 Song 对象
    return (data as List).map((json) => Song.fromJson(json)).toList();
  }

  @override
  List<Song>? loadCache() {
    return MyIsarService.instance.getAllSongs();
  }

  @override
  Future<void> persist(List<Song> data) async {
    await MyIsarService.instance.saveSongs(data);
  }
}

class PlayerScoreResource extends GameResourceDefinition<List<Score>> {
  @override
  ResourceKey get key => ResourceKey(
    namespace: 'mygame',
    name: 'player_scores',
  );

  @override
  Duration? get ttl => Duration(hours: 1);

  @override
  List<ResourceKey> get dependencies => [
    ResourceKey(namespace: 'mygame', name: 'song_list'),
  ];

  @override
  Future<List<Score>> fetch(GameContext context) async {
    // 确保歌曲列表已加载
    final songs = await context.load<List<Song>>(
      ResourceKey(namespace: 'mygame', name: 'song_list'),
    );

    final adapter = context.adapters.firstWhere(
      (a) => a.supports(context.game.id),
    );
    final data = await adapter.fetchResource<dynamic>(key, context.account!);
    
    return (data as List).map((json) => Score.fromJson(json)).toList();
  }

  @override
  List<Score>? loadCache() {
    return MyIsarService.instance.getAllScores();
  }

  @override
  Future<void> persist(List<Score> data) async {
    await MyIsarService.instance.saveScores(data);
  }
}
```

#### 3. 注册游戏

```dart
void initializeMyGame() {
  final service = ServiceProvider.instance;

  // 注册游戏（关联到平台）
  service.gameRegistry.registerGame(
    MyGame(),
    PlatformId('myplatform'),
  );

  // 注册游戏资源
  final game = MyGame();
  for (final resource in game.descriptor.resources) {
    service.resourceRegistry.registerResource(resource);
  }
}
```

---

## 示例代码

### 完整的平台集成示例

```dart
// main.dart
void main() {
  // 初始化服务
  initializeFramework();
  
  runApp(MyApp());
}

void initializeFramework() {
  final service = ServiceProvider.instance;

  // 注册平台
  service.platformRegistry.registerPlatforms([
    LxnsPlatform(),
    DivingFishPlatform(),
    PhigrosPlatform(),
  ]);

  // 注册游戏
  service.gameRegistry.registerGame(
    MaimaiDXGame(),
    PlatformId('lxns'),
  );
  service.gameRegistry.registerGame(
    ChunithmGame(),
    PlatformId('lxns'),
  );

  // 注册凭据提供者
  service.registerCredentialProvider(LxnsCredentialProvider());
  service.registerCredentialProvider(DivingFishCredentialProvider());
  service.registerCredentialProvider(PhigrosCredentialProvider());

  // 注册登录处理器
  service.registerLoginHandler(LxnsLoginHandler());
  service.registerLoginHandler(DivingFishLoginHandler());
  service.registerLoginHandler(PhigrosLoginHandler());

  // 注册适配器
  service.adapterRegistry.registerAdapters([
    LxnsPlatformAdapter(),
    DivingFishPlatformAdapter(),
    PhigrosPlatformAdapter(),
  ]);

  // 将凭据提供者注入账号提供者
  if (service.accountProvider is MemoryAccountProvider) {
    final accountProvider = service.accountProvider as MemoryAccountProvider;
    accountProvider.registerCredentialProvider(LxnsCredentialProvider());
    accountProvider.registerCredentialProvider(DivingFishCredentialProvider());
    accountProvider.registerCredentialProvider(PhigrosCredentialProvider());
  }
}

// 使用示例
class GamePage extends StatefulWidget {
  final GameId gameId;
  final Account account;

  const GamePage({required this.gameId, required this.account});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late ResourceLoader _loader;
  List<Song>? _songs;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initializeLoader();
  }

  void _initializeLoader() async {
    final service = ServiceProvider.instance;
    final game = service.gameRegistry.findById(widget.gameId)!;
    final adapters = service.adapterRegistry.getAllAdapters();

    final context = GameContext(
      game: game,
      account: widget.account,
      adapters: adapters,
      resourceLoader: ResourceLoader(
        registry: service.resourceRegistry,
        context: GameContext(
          game: game,
          account: widget.account,
          adapters: adapters,
          resourceLoader: null as dynamic, // 临时
        ),
      ),
    );

    _loader = ResourceLoader(
      registry: service.resourceRegistry,
      context: context,
    );

    await _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _loading = true);

    try {
      final songs = await _loader.load<List<Song>>(
        ResourceKey(namespace: 'maimai', name: 'song_list'),
      );

      setState(() {
        _songs = songs;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('加载失败: $e')),
      );
    }
  }

  Future<void> _refresh() async {
    try {
      final songs = await _loader.forceRefresh<List<Song>>(
        ResourceKey(namespace: 'maimai', name: 'song_list'),
      );

      setState(() => _songs = songs);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('刷新失败: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: ListView.builder(
        itemCount: _songs?.length ?? 0,
        itemBuilder: (context, index) {
          final song = _songs![index];
          return ListTile(
            title: Text(song.title),
            subtitle: Text(song.artist),
          );
        },
      ),
    );
  }
}
```

---

## 最佳实践

### 1. 资源组织

- **按命名空间组织**：使用游戏名称作为命名空间
- **明确依赖关系**：在 `dependencies` 中声明所有依赖
- **合理设置 TTL**：
  - 静态数据（歌曲列表）：1-7 天
  - 动态数据（成绩）：1-6 小时
  - 实时数据（在线状态）：无缓存或几分钟

### 2. 错误处理

```dart
try {
  final data = await loader.load<List<Song>>(key);
} on CredentialExpiredException catch (e) {
  // 凭据过期，引导用户重新登录
  showLoginDialog(context);
} catch (e) {
  // 其他错误
  showErrorDialog(context, e.toString());
}
```

### 3. 性能优化

- **批量加载**：使用 `loadMultiple` 批量加载多个资源
- **懒加载**：使用 `tryLoad` 优先使用缓存
- **并行加载**：资源系统会自动并行加载无依赖关系的资源

```dart
// 批量加载
final results = await loader.loadMultiple([
  songListKey,
  collectionListKey,
  avatarListKey,
]);

// 懒加载
final cached = loader.tryLoad<List<Song>>(songListKey);
if (cached != null) {
  // 使用缓存数据
  displaySongs(cached);
  
  // 后台刷新
  loader.load<List<Song>>(songListKey).then((fresh) {
    if (fresh != cached) {
      displaySongs(fresh);
    }
  });
}
```

### 4. 测试

```dart
// 创建测试用的服务提供者
class TestServiceProvider extends ServiceProvider {
  // 使用模拟的提供者
}

void main() {
  group('Platform Tests', () {
    late ServiceProvider service;

    setUp(() {
      service = TestServiceProvider();
    });

    test('should register platform', () {
      final platform = MyPlatform();
      service.platformRegistry.registerPlatform(platform);
      
      expect(
        service.platformRegistry.findById(platform.id),
        equals(platform),
      );
    });
  });
}
```

### 5. 生命周期管理

```dart
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeFramework();
  }

  @override
  void dispose() {
    // 清理资源
    final service = ServiceProvider.instance;
    service.resourceRegistry.clear();
    service.platformRegistry.clear();
    service.gameRegistry.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
```

---

## 常见问题

### Q: 如何处理凭据自动刷新？

A: 框架自动处理 OAuth2 凭据刷新：

```dart
// 在 PlatformAdapter 中获取资源时
final provider = ServiceProvider.instance.getCredentialProvider(id);
final validAccount = await provider?.getCredential(account);
// getCredential 会自动检查并刷新过期的 token
```

### Q: 如何添加新的资源类型？

A: 只需定义新的 `GameResourceDefinition` 并注册：

```dart
class NewResource extends GameResourceDefinition<MyData> {
  @override
  ResourceKey get key => ResourceKey(namespace: 'game', name: 'new_resource');
  
  // 实现其他方法...
}

// 注册
ServiceProvider.instance.resourceRegistry.registerResource(NewResource());
```

### Q: 资源加载失败如何处理？

A: 资源加载器会抛出异常，建议在 UI 层捕获并处理：

```dart
try {
  final data = await loader.load<MyData>(key);
} catch (e) {
  // 显示错误信息或使用默认值
}
```

### Q: 如何支持多账号？

A: 每个账号是独立的 `Account` 实例，可以存储多个：

```dart
final accounts = await ServiceProvider.instance.accountProvider.getAllAccounts();
// 切换账号时创建新的 GameContext
```
