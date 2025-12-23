# 资源缓存系统

## 概述

Core 框架使用 Isar 数据库记录资源的加载时间和过期状态，实现高性能的资源缓存管理。

## 架构设计

### 内存优先策略

- **启动时加载**：应用启动时，自动将所有缓存记录从数据库加载到内存
- **内存读取**：所有过期检查、时间查询都直接从内存读取，无需访问数据库
- **异步写入**：数据变更时立即更新内存，异步写入数据库，不阻塞主线程
- **退出时同步**：应用关闭前将内存数据同步到数据库，确保数据持久化

### 数据模型

**ResourceCacheEntity** (Isar Collection)
```dart
- id: Id (自增主键)
- resourceKey: String (资源完整 key，唯一索引)
- accountKey: String (账号标识，索引)
- namespace: String (资源命名空间，索引)
- name: String (资源名称)
- scope: String? (资源作用域)
- lastLoadTime: DateTime (最后加载时间)
- expiryTime: DateTime (过期时间)
- ttlSeconds: int (TTL 秒数)
- isAccountRelated: bool (是否与账号相关)
```

## 核心组件

### 1. ResourceCacheService

资源缓存服务，负责数据库和内存缓存的管理。

**主要功能：**
- `initialize()` - 初始化服务，加载所有缓存到内存
- `recordLoad()` - 记录资源加载（立即更新内存，异步写数据库）
- `isExpired()` - 检查资源是否过期（从内存读取）
- `clearCache()` - 清除指定资源缓存
- `clearAccountRelatedCaches()` - 清除账号关联缓存
- `clearExpiredCaches()` - 清除过期缓存
- `syncToDatabase()` - 强制同步内存到数据库

**性能特点：**
- 所有读操作 O(1) 复杂度（HashMap 查找）
- 写操作不阻塞主线程（异步写入）
- 内存占用可控（只存储元数据，不存储资源数据本身）

### 2. ResourceLoader

资源加载器，集成了缓存服务。

**缓存流程：**
1. 检查内存中是否有数据且未过期 → 直接返回
2. 数据过期或不存在 → 加载资源
3. 加载成功后立即更新内存缓存，异步写数据库

**账号切换处理：**
- 调用 `invalidateAccountRelatedResources()` 
- 从内存清除所有 `isAccountRelated=true` 的资源
- 异步从数据库清除对应记录

## 使用方式

### 初始化

在 `CoreStorageService.initialize()` 中自动初始化：

```dart
await ResourceCacheService.instance.initialize();
```

### 自动缓存

ResourceLoader 自动使用缓存服务，无需手动干预：

```dart
// 加载资源时自动检查缓存和过期状态
final data = await loader.load(resourceKey);

// 强制刷新（清除缓存并重新加载）
final freshData = await loader.forceRefresh(resourceKey);
```

### 账号切换

账号切换时自动清除账号关联缓存：

```dart
// 在 CoreProvider.setCurrentAccount() 中
await gameContext.resourceLoader.invalidateAccountRelatedResources();
```

### 应用退出

在应用关闭前自动同步数据：

```dart
// 在 CoreStorageService.close() 中
await ResourceCacheService.instance.syncToDatabase();
```

## 性能优势

1. **读性能优异**：所有缓存检查都从内存 HashMap 读取，O(1) 时间复杂度
2. **写不阻塞**：所有数据库写入都是异步的，不影响主线程性能
3. **启动快速**：虽然启动时加载所有缓存，但缓存记录通常很少（只有元数据）
4. **内存友好**：只存储时间戳和标识信息，不存储实际资源数据

## 数据一致性

- **内存优先**：所有操作都先更新内存，保证读取一致性
- **异步持久化**：数据异步写入数据库，即使写入失败也不影响运行
- **退出时同步**：应用正常退出时强制同步，保证数据持久化
- **启动时加载**：下次启动时从数据库恢复完整状态

## 调试功能

```dart
// 获取统计信息
final stats = await ResourceCacheService.instance.getStats();
print('总缓存: ${stats['total']}');
print('过期: ${stats['expired']}');
print('有效: ${stats['valid']}');
print('内存中: ${stats['inMemory']}');

// 查看指定账号的所有缓存
final caches = await ResourceCacheService.instance.getAllCaches(
  platformId: 'lxns',
  accountIdentifier: 'user123',
);
```

## 注意事项

1. **无外部依赖**：所有代码都在 `lib/core/` 目录下，不依赖其他模块
2. **自动清理**：定期调用 `clearExpiredCaches()` 清理过期记录（可在后台定时执行）
3. **异步写入**：写入失败不会抛出异常，只会打印日志，不影响应用运行
4. **内存安全**：缓存记录数量通常不会太大，即使数千条记录也只占用很少内存
