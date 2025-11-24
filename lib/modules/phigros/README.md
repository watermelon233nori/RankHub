# Phigros 平台模块

本模块为 RankHub 提供 Phigros 音游数据平台支持。

## 📁 目录结构

```
phigros/
├── phigros_platform.dart          # 平台实现（继承BasePlatform）
├── phigros_game.dart               # 游戏实现（继承BaseGame）
├── services/                       # 服务层
│   ├── phigros_login_handler.dart      # 登录处理器
│   └── phigros_credential_provider.dart # 凭据提供者
└── widgets/                        # UI组件（待实现）
```

## ✅ 已完成

- ✅ 平台基础架构
- ✅ 游戏基础架构
- ✅ 登录处理器框架（使用 API Key 方式）
- ✅ 凭据提供者（使用 API Key 方式）
- ✅ 在 PlatformRegistry 中注册
- ✅ Platform 枚举添加 `phigros` 值

## 🚧 待实现功能

### 1. 登录功能
在 `services/phigros_login_handler.dart` 中：
- [ ] 实现 `showLoginPage()` - 创建登录UI页面
- [ ] 实现 `validateCredentials()` - 验证凭据有效性
- [ ] 实现 `fetchAccountInfo()` - 获取账号信息

**参考实现：**
- OAuth2 方式：查看 `lib/modules/lxns/services/lxns_login_handler.dart`
- API Key 方式：相对简单，创建输入框即可

### 2. 游戏内容视图
在 `phigros_game.dart` 中：
- [ ] 实现 `buildWikiViews()` - 添加曲目库等Wiki页面
- [ ] 实现 `buildRankViews()` - 添加成绩、排行等Rank页面
- [ ] 实现 `buildPlayerInfoCard()` - 玩家信息卡片

### 3. 数据同步
在 `phigros_platform.dart` 中：
- [ ] 实现 `createFullSyncTasks()` - 全量数据同步任务
  - 参考 `lib/modules/lxns/lxns_platform.dart` 的同步实现
  - 使用 `SyncTask` 创建任务，支持进度回调

### 4. API 服务（可选）
创建 `services/phigros_api_service.dart`：
- [ ] 定义 API 端点
- [ ] 实现网络请求（使用 Dio）
- [ ] 处理错误和重试

### 5. 数据模型（可选）
如需本地存储，在 `lib/models/phigros/` 创建：
- [ ] 曲目模型（songs.dart）
- [ ] 成绩模型（records.dart）
- [ ] 玩家模型（player.dart）
- 使用 Isar `@collection` 注解
- 运行代码生成：`dart run build_runner build --delete-conflicting-outputs`

### 6. Isar 数据库服务（可选）
创建 `services/phigros_isar_service.dart`：
```dart
class PhigrosIsarService extends BaseIsarService {
  @override
  String get databaseName => 'phigros';
  
  @override
  List<CollectionSchema> get schemas => [
    // 添加你的集合 schemas
  ];
}
```

## 🔧 凭据类型切换

当前使用 **API Key** 方式，如需切换：

### 切换到 OAuth2
1. 修改 `PhigrosCredentialProvider` 继承 `OAuth2CredentialProvider`
2. 实现 `requestTokenRefresh()` 和 `saveAccount()` 方法
3. 在 `PhigrosLoginHandler` 中实现 OAuth2 授权流程

### 切换到用户名密码
1. 修改 `PhigrosCredentialProvider` 继承 `UserPasswordCredentialProvider`
2. 创建用户名密码输入表单
3. 实现凭据验证逻辑

## 📝 开发指南

### 添加新的 Tab 页面
```dart
// 在 phigros_game.dart 中
@override
List<GameContentView> buildWikiViews(BuildContext context) {
  return [
    GameContentView(
      label: '曲目',
      icon: Icons.library_music_outlined,
      builder: (context) => const PhigrosSongsTab(),
    ),
  ];
}
```

### 创建同步任务
```dart
tasks.add(
  SyncTask(
    id: 'phigros_sync_songs_${DateTime.now().millisecondsSinceEpoch}',
    name: '同步曲目数据',
    description: '正在获取曲目列表...',
    type: SyncTaskType.metadata,
    platformId: id,
    priority: 10,
    execute: (task) async {
      // 执行同步逻辑
      task.updateProgress(0.5, description: '正在处理曲目数据...');
      // 完成后会自动设置为 100%
    },
  ),
);
```

## 🎨 UI 设计建议

- 主色调：深紫色 (`Colors.deepPurple`)
- 图标：星星 (`Icons.stars_outlined`)
- 保持与其他模块一致的 UI 风格
- 使用 `Card` 包裹主要内容
- 使用 `AnimatedSwitcher` 实现页面切换动画

## 🔗 相关文件

- 平台注册：`lib/data/platforms_data.dart`
- Platform 枚举：`lib/models/account/account.dart`
- 基类定义：
  - `lib/models/platform.dart` - IPlatform 接口
  - `lib/models/game.dart` - IGame 接口
  - `lib/services/platform_login_handler.dart` - 登录处理器基类
  - `lib/services/credential_provider.dart` - 凭据提供者基类

## 📚 参考示例

完整实现参考：
- **LXNS 平台**：`lib/modules/lxns/` - OAuth2 + 完整功能示例
- **MuseDash 平台**：`lib/modules/musedash/` - 另一种实现方式

## 🐛 调试

```bash
# 运行应用
flutter run

# 代码生成（修改模型后）
dart run build_runner build --delete-conflicting-outputs

# 代码分析
flutter analyze
```

## 📌 注意事项

1. 所有模型修改后必须运行 build_runner
2. Platform 枚举已添加，无需重复添加
3. 平台已在 PlatformRegistry 中注册
4. 遵循项目的文件命名规范（snake_case）
5. 使用 GetX 进行状态管理时，创建对应的 Controller
