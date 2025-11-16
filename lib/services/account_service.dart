import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/account_isar_service.dart';
import 'package:rank_hub/services/credential_provider.dart';

/// 账号管理服务
/// 提供账号绑定、凭据管理、自动刷新等功能
class AccountService extends GetxService {
  static AccountService? _instance;

  final AccountIsarService _accountDb = AccountIsarService.instance;
  final Map<Platform, CredentialProvider> _providers = {};

  AccountService._();

  /// 获取单例实例
  static AccountService get instance {
    _instance ??= AccountService._();
    return _instance!;
  }

  /// 注册凭据提供者
  void registerProvider(CredentialProvider provider) {
    _providers[provider.platform] = provider;
  }

  /// 获取凭据提供者
  CredentialProvider? getProvider(Platform platform) {
    return _providers[platform];
  }

  // ==================== 账号管理 ====================

  /// 绑定新账号
  ///
  /// [platform] 平台类型
  /// [externalId] 平台唯一标识
  /// [credentialData] 凭据数据
  /// [displayName] 显示名称
  /// [avatarUrl] 头像 URL
  ///
  /// 返回绑定后的账号
  Future<Account> bindAccount({
    required Platform platform,
    required String externalId,
    required Map<String, dynamic> credentialData,
    String? displayName,
    String? avatarUrl,
  }) async {
    // 检查是否已绑定
    final existing = await _accountDb.getAccountByPlatformAndExternalId(
      platform,
      externalId,
    );
    if (existing != null) {
      throw Exception('该账号已绑定');
    }

    // 创建账号
    final account = Account(
      platform: platform,
      externalId: externalId,
      displayName: displayName,
      avatarUrl: avatarUrl,
      bindTime: DateTime.now(),
      isActive: true,
      credentialType: CredentialType.custom, // 临时值，provider 会更新
    );

    // 使用 provider 填充凭据数据
    final provider = getProvider(platform);
    if (provider == null) {
      throw Exception('平台 ${platform.name} 暂不支持');
    }

    await provider.createCredential(account, credentialData);

    // 保存账号（包含凭据）
    await _accountDb.saveAccount(account);

    return account;
  }

  /// 解绑账号
  Future<void> unbindAccount(int accountId) async {
    final account = await _accountDb.getAccountById(accountId);
    if (account == null) {
      throw Exception('账号不存在');
    }

    // 撤销凭据
    final provider = getProvider(account.platform);
    if (provider != null) {
      try {
        await provider.revokeCredential(account);
      } catch (e) {
        // 撤销失败不影响解绑
        print('撤销凭据失败: $e');
      }
    }

    // 删除账号
    await _accountDb.deleteAccount(accountId);
  }

  /// 获取所有账号
  Future<List<Account>> getAllAccounts() async {
    return await _accountDb.getAllAccounts();
  }

  /// 获取激活的账号
  Future<List<Account>> getActiveAccounts() async {
    return await _accountDb.getActiveAccounts();
  }

  /// 获取指定平台的账号
  Future<List<Account>> getAccountsByPlatform(Platform platform) async {
    return await _accountDb.getAccountsByPlatform(platform);
  }

  /// 更新账号激活状态
  Future<void> setAccountActive(int accountId, bool isActive) async {
    await _accountDb.updateAccountActiveStatus(accountId, isActive);
  }

  /// 更新账号信息
  Future<void> updateAccount(Account account) async {
    await _accountDb.saveAccount(account);
  }

  // ==================== 凭据管理 ====================

  /// 获取账号的有效凭据（自动处理凭据刷新）
  Future<Account> getCredential(Account account) async {
    final provider = getProvider(account.platform);
    if (provider == null) {
      throw Exception('平台 ${account.platform.name} 暂不支持');
    }

    return await provider.getCredential(account);
  }

  /// 验证凭据是否有效
  Future<bool> validateCredential(Account account) async {
    final provider = getProvider(account.platform);
    if (provider == null) {
      return false;
    }

    return await provider.validateCredential(account);
  }

  /// 刷新所有即将过期的凭据
  Future<void> refreshExpiringCredentials() async {
    final accounts = await _accountDb.getExpiringSoonOAuth2Accounts();

    for (final account in accounts) {
      try {
        final provider = getProvider(account.platform);
        if (provider == null) continue;

        await provider.refreshCredential(account);
      } catch (e) {
        print('刷新凭据失败 (Account ID: ${account.id}): $e');
      }
    }
  }

  // ==================== 便捷方法 ====================

  /// 获取指定平台的第一个激活账号
  Future<Account?> getFirstActiveAccount(Platform platform) async {
    final accounts = await getAccountsByPlatform(platform);
    return accounts.firstWhereOrNull((acc) => acc.isActive);
  }

  /// 检查平台是否已绑定账号
  Future<bool> hasPlatformAccount(Platform platform) async {
    final accounts = await getAccountsByPlatform(platform);
    return accounts.isNotEmpty;
  }

  /// 获取平台账号数量
  Future<int> getPlatformAccountCount(Platform platform) async {
    final accounts = await getAccountsByPlatform(platform);
    return accounts.length;
  }

  /// 更新账号最后同步时间
  Future<void> updateAccountSyncTime(int accountId) async {
    await _accountDb.updateAccountSyncTime(accountId);
  }
}
