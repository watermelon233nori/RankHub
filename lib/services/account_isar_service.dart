import 'package:isar_community/isar.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/base_isar_service.dart';
import 'package:rank_hub/services/log_service.dart';

/// 账号管理数据库服务
class AccountIsarService extends BaseIsarService {
  final LogService _logger = LogService.instance;
  static AccountIsarService? _instance;

  AccountIsarService._();

  /// 获取单例实例
  static AccountIsarService get instance {
    _instance ??= AccountIsarService._();
    return _instance!;
  }

  @override
  String get databaseName => 'account_db';

  @override
  List<CollectionSchema> get schemas => [AccountSchema];

  // ==================== 账号相关操作 ====================

  /// 保存或更新账号
  Future<void> saveAccount(Account account) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.accounts.put(account);
    });

    _logger.debug(
      '账号已保存到数据库: ID=${account.id}, 平台=${account.platform.name}, 外部ID=${account.externalId}',
    );
  }

  /// 根据平台和外部 ID 获取账号
  Future<Account?> getAccountByPlatformAndExternalId(
    Platform platform,
    String externalId,
  ) async {
    final isar = await db;
    return await isar.accounts
        .filter()
        .platformEqualTo(platform)
        .externalIdEqualTo(externalId)
        .findFirst();
  }

  /// 根据 ID 获取账号
  Future<Account?> getAccountById(int id) async {
    final isar = await db;
    return await isar.accounts.get(id);
  }

  /// 获取所有账号
  Future<List<Account>> getAllAccounts() async {
    final isar = await db;
    final accounts = await isar.accounts.where().findAll();

    _logger.debug('📖 从数据库读取 ${accounts.length} 个账号');
    for (final account in accounts) {
      _logger.debug('  - ${account.platform.name} (${account.externalId})');
    }

    return accounts;
  }

  /// 获取激活的账号列表
  Future<List<Account>> getActiveAccounts() async {
    final isar = await db;
    return await isar.accounts.filter().isActiveEqualTo(true).findAll();
  }

  /// 获取指定平台的账号列表
  Future<List<Account>> getAccountsByPlatform(Platform platform) async {
    final isar = await db;
    return await isar.accounts.filter().platformEqualTo(platform).findAll();
  }

  /// 删除账号
  Future<void> deleteAccount(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.accounts.delete(id);
    });
  }

  /// 更新账号激活状态
  Future<void> updateAccountActiveStatus(int id, bool isActive) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final account = await isar.accounts.get(id);
      if (account != null) {
        account.isActive = isActive;
        await isar.accounts.put(account);
      }
    });
  }

  /// 更新账号同步时间
  Future<void> updateAccountSyncTime(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      final account = await isar.accounts.get(id);
      if (account != null) {
        account.lastSyncTime = DateTime.now();
        await isar.accounts.put(account);
      }
    });
  }

  /// 获取所有即将过期的 OAuth2 账号 (5分钟内)
  Future<List<Account>> getExpiringSoonOAuth2Accounts() async {
    final isar = await db;
    return await isar.accounts
        .filter()
        .credentialTypeEqualTo(CredentialType.oauth2)
        .findAll()
        .then(
          (accounts) => accounts.where((a) => a.isTokenExpiringSoon).toList(),
        );
  }
}
