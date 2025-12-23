import 'package:rank_hub/core/account.dart';
import 'package:rank_hub/core/platform_id.dart';

/// 账号管理提供者
/// 负责账号的创建、验证、存储等操作
abstract class AccountProvider {
  /// 创建新账号
  Future<Account> createAccount({
    required PlatformId platformId,
    required Map<String, dynamic> credentials,
  });

  /// 保存账号
  Future<void> saveAccount(Account account);

  /// 根据平台ID和外部ID获取账号
  Future<Account?> getAccount(PlatformId platformId, String externalId);

  /// 获取指定平台的所有账号
  Future<List<Account>> getAccountsByPlatform(PlatformId platformId);

  /// 获取所有账号
  Future<List<Account>> getAllAccounts();

  /// 删除账号
  Future<void> deleteAccount(PlatformId platformId, String externalId);

  /// 验证账号凭据是否有效
  Future<bool> validateAccount(Account account);

  /// 更新账号凭据
  Future<Account> updateCredentials(
    Account account,
    Map<String, dynamic> newCredentials,
  );
}
