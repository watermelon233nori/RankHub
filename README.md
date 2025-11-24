# RankHub - 音游数据管理平台

> 2025.11.25
>
> 初步添加了对 Phigros 的支持（坑越挖越大了）
>
> 如果能找到公开的 Assets 引用的话，有打算添加对 Arcaea 的支持，但前提是你得有 Arcaea Online 订阅（我没有精力去和 GUY 斗智斗勇，或者哪个第三方查分平台能漏我接口）
> 
> 2025.11.20
> 
> 初步添加了对 MuseDash.moe 的支持
> 
> Best 成绩图暂时不会添加了，等我把平台支持完善了再说
>
> maimai的曲绘识别我感觉好像又能做了，我到时候试试TFLite

RankHub 是一个基于 Flutter 开发的跨平台音游数据管理应用，支持多平台账号管理、数据同步、成绩查询和其他功能。

幻想打造一个聚合音游平台。

## 项目概述

### 应用截图

<div align="center">
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.38.29-portrait.png" width="120" />
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.39.00-portrait.png" width="120" />
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.39.54-portrait.png" width="120" />
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.40.24-portrait.png" width="120" />
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.40.42-portrait.png" width="120" />
  <img src="screenshots/Simulator Screenshot - iPhone 17 Pro - 2025-11-20 at 18.41.12-portrait.png" width="120" />
</div>

### 核心功能
- **多平台支持**：支持落雪咖啡屋（LXNS）、MuseDash.moe等多个音游数据平台
- **多游戏支持**：支持舞萌DX、喵斯快跑等多款音游
- **账号管理**：多账号绑定、OAuth2/API Key 认证
- **数据同步**：智能数据同步，支持全量和增量同步
- **数据展示**：Wiki、Rank、个人页面等多维度数据展示
- **本地存储**：基于 Isar 的高性能本地数据库

### 技术栈
- **框架**：Flutter 3.10+ / Dart 3.10+
- **状态管理**：GetX
- **本地数据库**：Isar Community 3.3.0
- **网络请求**：Dio 5.7.0
- **缓存**：dio_cache_interceptor + cached_network_image
- **认证**：flutter_inappwebview (OAuth2), PKCE


## 架构设计

### 整体架构

RankHub 采用**模块化分层架构**，核心设计理念：
- **平台-游戏二级抽象**：每个平台可包含多个游戏
- **插件化扩展**：通过实现接口快速接入新平台和游戏
- **统一管理**：集中式账号、凭据、同步管理


## 核心概念

### 1. 平台（Platform）

**定义**：平台是数据来源，负责账号认证、凭据管理和游戏管理。

**接口**：`IPlatform`（位于 `lib/models/platform.dart`）

**核心职责**：
- 账号登录和凭据管理（通过 `LoginHandler` 和 `CredentialProvider`）
- 管理该平台下的多个游戏
- 创建数据同步任务

**实现示例**：
```dart
class LxnsPlatform extends BasePlatform {
  @override
  String get id => 'lxns';
  
  @override
  Platform get platform => Platform.lxns;
  
  @override
  PlatformLoginHandler get loginHandler => LxnsLoginHandler();
  
  @override
  CredentialProvider get credentialProvider => LxnsCredentialProvider();
  
  @override
  List<IGame> getGames() => [MaimaiDXGame(), ChunithmGame()];
  
  @override
  SyncTaskGroup createFullSyncTasks(Account account) {
    // 创建该平台的全量同步任务
  }
}
```

**平台注册**：所有平台在 `lib/data/platforms_data.dart` 的 `PlatformRegistry` 中注册。


### 2. 游戏（Game）

**定义**：游戏是具体的内容提供者，负责数据展示和用户交互。

**接口**：`IGame`（位于 `lib/models/game.dart`）

**核心职责**：
- 构建 Wiki、Rank 等页面的视图内容
- 管理游戏特定的数据和逻辑
- 提供游戏相关的 UI 组件

**实现示例**：
```dart
class MaimaiDXGame extends IGame {
  @override
  String get id => 'maimai_dx';
  
  @override
  String get name => '舞萌DX';
  
  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: '曲目',
        builder: (ctx) => SongsTab(),
      ),
      GameContentView(
        label: '收藏品',
        builder: (ctx) => CollectionsTab(),
      ),
    ];
  }
  
  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: 'B50分表',
        builder: (ctx) => B50RankWidget(),
      ),
    ];
  }
}
```


### 3. 账号管理（Account）

**账号模型**：`Account`（位于 `lib/models/account/account.dart`）

**字段设计**：
- **基础信息**：`id`, `platform`, `externalId`, `displayName`, `avatarUrl`
- **凭据字段**：`apiKey`, `accessToken`, `refreshToken`, `tokenExpiry`
- **辅助字段**：`username`, `password`, `metadata`

**账号控制器**：`AccountController` 负责账号的增删改查和切换。

**账号存储**：使用 `AccountIsarService` 将账号持久化到 Isar 数据库。


### 4. 凭据管理（Credential）

**凭据提供者**：`CredentialProvider`（位于 `lib/services/credential_provider.dart`）

**支持的凭据类型**：
- **API Key**：静态密钥，不过期（如落雪查分器的个人API密钥）
- **OAuth2**：动态令牌，支持刷新
- **用户名密码**：传统认证方式（如水鱼查分器）

**凭据刷新流程**：
1. 调用 `getCredential()` 获取凭据
2. 检查 Token 是否过期或即将过期
3. 自动调用 `refreshCredential()` 刷新
4. 更新账号对象并保存


### 5. 登录处理（Login Handler）

**登录处理器**：`PlatformLoginHandler`（位于 `lib/services/platform_login_handler.dart`）

**核心方法**：
- `showLoginPage()`：显示平台特定的登录界面
- `validateCredentials()`：验证用户输入的凭据
- `fetchAccountInfo()`：获取账号信息

**OAuth2 登录流程**（以 LXNS 为例）：
1. 生成 PKCE code_verifier 和 code_challenge
2. 打开 WebView，跳转到平台授权页面
3. 用户授权后，拿到 authorization_code
4. 使用 code 换取 access_token 和 refresh_token
5. 保存凭据到账号对象


### 6. 数据同步（Sync Manager）

**同步管理器**：`SyncManager`（位于 `lib/services/sync_manager.dart`）

**同步任务**：`SyncTask`（位于 `lib/models/sync_task.dart`）

**任务类型**：
- `songs`：曲目数据
- `collections`：收藏品数据
- `scores`：成绩数据
- `players`：玩家数据
- `metadata`：元数据

**同步流程**：
1. 平台创建 `SyncTaskGroup`（任务组）
2. 提交到 `SyncManager`
3. 任务按优先级排队
4. 并发执行（最多 3 个任务）
5. 执行结果反馈到 UI

**任务状态**：`pending` → `running` → `completed/failed/cancelled`


### 7. 本地数据库（Isar）

**数据库服务**：`BaseIsarService`（位于 `lib/services/base_isar_service.dart`）

**多数据库架构**：
- 每个游戏使用独立的 Isar 数据库
- 账号管理使用单独的数据库
- 通过 `IsarService` 统一访问

**使用示例**：
```dart
// 访问 Maimai 数据库
final songs = await IsarService.instance.maimai.getAllSongs();

// 访问账号数据库
final accounts = await IsarService.instance.account.getAllAccounts();
```

**数据库命名规范**：`{game_name}_data.isar`（如 `maimai_data.isar`）


## 目录结构

```
lib/
├── main.dart                    # 应用入口
├── controllers/                 # GetX 控制器
│   ├── main_controller.dart     # 主页面控制器
│   ├── game_controller.dart     # 游戏选择控制器
│   ├── account_controller.dart  # 账号管理控制器
│   └── data_sync_controller.dart # 数据同步控制器
├── data/                        # 静态数据
│   └── platforms_data.dart      # 平台注册中心
├── models/                      # 数据模型
│   ├── platform.dart            # 平台接口
│   ├── game.dart                # 游戏接口
│   ├── sync_task.dart           # 同步任务模型
│   └── account/                 # 账号模型
│       └── account.dart
├── modules/                     # 游戏模块（插件化）
│   ├── lxns/                    # 落雪查分器平台
│   │   ├── lxns_platform.dart   # LXNS平台实现
│   │   ├── maimai_dx_game.dart  # 舞萌DX游戏实现
│   │   ├── services/            # 模块专属服务
│   │   │   ├── lxns_login_handler.dart
│   │   │   ├── lxns_credential_provider.dart
│   │   │   ├── maimai_api_service.dart
│   │   │   └── maimai_isar_service.dart
│   │   └── widgets/             # 模块专属组件
│   └── diving_fish/             # 水鱼查分器平台
├── pages/                       # 页面
│   ├── main_page.dart           # 主页面（TabBar）
│   ├── wiki.dart                # Wiki 页面
│   ├── rank.dart                # Rank 页面
│   ├── mine.dart                # 个人页面
│   ├── detail.dart              # 详情页面
│   ├── data_sync.dart           # 数据同步页面
│   └── account_manage.dart      # 账号管理页面
├── routes/                      # 路由配置
│   ├── app_routes.dart          # 路由常量
│   └── app_pages.dart           # GetX 路由配置
├── services/                    # 核心服务
│   ├── isar_service.dart        # Isar 服务统一入口
│   ├── base_isar_service.dart   # Isar 基础服务
│   ├── account_isar_service.dart # 账号数据库服务
│   ├── account_service.dart     # 账号业务服务
│   ├── platform_login_manager.dart  # 登录管理器
│   ├── platform_login_handler.dart  # 登录处理器接口
│   ├── credential_provider.dart     # 凭据提供者接口
│   └── sync_manager.dart        # 同步管理器
├── utils/                       # 工具类
│   └── pkce_helper.dart         # PKCE 生成工具
└── widgets/                     # 公共组件
    └── game_selector_sheet.dart # 游戏选择器
```


## 开发指南

### 快速开始

1. **安装依赖**
```bash
flutter pub get
```

2. **生成代码**（Isar 数据库模型）
```bash
dart run build_runner build --delete-conflicting-outputs
```

3. **运行应用**
```bash
flutter run
```

### 添加新平台

1. **创建平台目录**：`lib/modules/{platform_name}/`

2. **实现平台接口**：
```dart
class MyPlatform extends BasePlatform {
  MyPlatform()
    : super(
        id: 'my_platform',
        platform: Platform.myPlatform, // 需要在 Account 枚举中添加
        name: '我的平台',
        description: '平台描述',
        icon: Icons.games,
      );
  
  @override
  PlatformLoginHandler get loginHandler => MyLoginHandler();
  
  @override
  CredentialProvider get credentialProvider => MyCredentialProvider();
  
  @override
  List<IGame> getGames() => [MyGame1(), MyGame2()];
  
  @override
  SyncTaskGroup createFullSyncTasks(Account account) {
    return SyncTaskGroup(
      name: '${name} 全量同步',
      tasks: [
        SyncTask(/* 任务配置 */),
      ],
    );
  }
}
```

3. **实现 LoginHandler**：
```dart
class MyLoginHandler extends PlatformLoginHandler {
  @override
  Platform get platform => Platform.myPlatform;
  
  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    // 实现登录界面和逻辑
  }
  
  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentialData) async {
    // 验证凭据
  }
  
  @override
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentialData,
  ) async {
    // 获取账号信息
  }
}
```

4. **实现 CredentialProvider**：
```dart
class MyCredentialProvider extends ApiKeyCredentialProvider {
  @override
  Platform get platform => Platform.myPlatform;
  
  @override
  Future<bool> validateCredential(Account account) async {
    // 验证凭据有效性
  }
  
  @override
  Future<void> createCredential(Account account, Map<String, dynamic> data) async {
    account.apiKey = data['api_key'];
  }
  
  @override
  Future<void> revokeCredential(Account account) async {
    // 撤销凭据
  }
}
```

5. **注册平台**：在 `lib/data/platforms_data.dart` 中添加
```dart
final List<IPlatform> _platforms = [
  LxnsPlatform(),
  MyPlatform(), // 新增
];
```

### 添加新游戏

1. **实现游戏接口**：
```dart
class MyGame extends IGame {
  @override
  String get id => 'my_game';
  
  @override
  String get name => '我的游戏';
  
  @override
  List<GameContentView> buildWikiViews(BuildContext context) {
    return [
      GameContentView(
        label: 'Tab1',
        builder: (ctx) => MyWikiTab(),
      ),
    ];
  }
  
  @override
  List<GameContentView> buildRankViews(BuildContext context) {
    return [
      GameContentView(
        label: '排行',
        builder: (ctx) => MyRankWidget(),
      ),
    ];
  }
  
  @override
  void onSelected() {
    print('游戏被选中');
  }
}
```

2. **创建数据库服务**（如需本地存储）：
```dart
class MyGameIsarService extends BaseIsarService {
  static MyGameIsarService? _instance;
  
  static MyGameIsarService get instance {
    _instance ??= MyGameIsarService._();
    return _instance!;
  }
  
  MyGameIsarService._();
  
  @override
  String get databaseName => 'my_game_data';
  
  @override
  List<CollectionSchema> get schemas => [
    MyDataModelSchema, // 需要用 @collection 注解
  ];
  
  // 实现具体的数据操作方法
  Future<List<MyDataModel>> getAllData() async {
    final isar = await db;
    return await isar.myDataModels.where().findAll();
  }
}
```

3. **将游戏添加到平台**：
```dart
class MyPlatform extends BasePlatform {
  @override
  List<IGame> getGames() => [MyGame()];
}
```

### 数据同步示例

```dart
// 创建同步任务
final syncTask = SyncTask(
  id: 'sync_songs_${DateTime.now().millisecondsSinceEpoch}',
  name: '同步曲目数据',
  description: '从服务器同步最新曲目信息',
  type: SyncTaskType.songs,
  platformId: 'lxns',
  priority: 10,
  execute: (task) async {
    // 1. 从 API 获取数据
    final songs = await apiService.fetchSongs();
    
    // 2. 更新进度
    task.updateProgress(0.5);
    
    // 3. 保存到数据库
    await isarService.saveSongs(songs);
    
    // 4. 完成
    task.updateProgress(1.0);
  },
);

// 提交任务
await SyncManager().submitTask(syncTask);
```


## 状态管理

### GetX 使用规范

1. **控制器注入**：在路由配置中使用 `BindingsBuilder`
```dart
GetPage(
  name: AppRoutes.main,
  page: () => const MainPage(),
  binding: BindingsBuilder(() {
    Get.lazyPut(() => MainController());
  }),
),
```

2. **响应式变量**：使用 `.obs` 和 `Rx`
```dart
var selectedIndex = 0.obs;
final Rx<IGame?> selectedGame = Rx<IGame?>(null);
```

3. **监听变化**：使用 `ever`, `once`, `debounce`
```dart
ever(currentAccountRx, (account) {
  // 账号变化时的回调
});
```

4. **UI 更新**：使用 `Obx` 或 `GetX`
```dart
Obx(() => Text(controller.selectedGame.value?.name ?? '未选择'));
```


## API 设计规范

### RESTful API 调用

使用 Dio 进行网络请求，示例：

```dart
class MaimaiApiService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://maimai.lxns.net/api/v0',
    headers: {'Content-Type': 'application/json'},
  ));
  
  Future<List<Song>> getSongs() async {
    final response = await _dio.get('/song/list');
    return (response.data as List)
        .map((json) => Song.fromJson(json))
        .toList();
  }
  
  Future<PlayerScore> getPlayerScore(String jwt) async {
    final response = await _dio.get(
      '/player/scores',
      options: Options(headers: {'Authorization': 'Bearer $jwt'}),
    );
    return PlayerScore.fromJson(response.data);
  }
}
```


## 贡献指南

1. Fork 本项目
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 提交 Pull Request


## 许可证

本项目采用 MIT 许可证 - 详见 LICENSE 文件


## 联系方式

项目维护者：QianMo SAMA

问题反馈：请在 GitHub Issues 中提交
