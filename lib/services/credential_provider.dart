import 'dart:async';

import 'package:rank_hub/models/account/account.dart';

/// 凭据失效异常
/// 当凭据完全失效且无法自动刷新时抛出
class CredentialExpiredException implements Exception {
  final String message;
  final Account account;

  CredentialExpiredException(this.account, [this.message = '凭据已失效，请重新登录']);

  @override
  String toString() => message;
}

/// 凭据提供者抽象接口
/// 负责管理不同平台的凭据获取、刷新等操作
abstract class CredentialProvider {
  /// 平台类型
  Platform get platform;

  /// 获取有效的凭据（如果凭据过期或即将过期，会自动刷新）
  /// 返回更新后的 Account 对象
  Future<Account> getCredential(Account account);

  /// 刷新凭据
  /// 直接修改 Account 对象中的凭据字段，返回更新后的 Account
  Future<Account> refreshCredential(Account account);

  /// 验证凭据是否有效
  Future<bool> validateCredential(Account account);

  /// 创建新凭据
  /// 直接修改 Account 对象中的凭据字段
  Future<void> createCredential(Account account, Map<String, dynamic> data);

  /// 撤销凭据
  Future<void> revokeCredential(Account account);
}

/// API Key 凭据提供者
abstract class ApiKeyCredentialProvider extends CredentialProvider {
  @override
  Future<Account> getCredential(Account account) async {
    // API Key 类型的凭据通常不需要刷新，直接返回
    if (account.apiKey == null || account.apiKey!.isEmpty) {
      throw Exception('账号 ${account.externalId} 缺少 API Key');
    }
    return account;
  }

  @override
  Future<Account> refreshCredential(Account account) async {
    // API Key 通常不支持刷新，直接返回原账号
    return account;
  }
}

/// OAuth2 凭据提供者
abstract class OAuth2CredentialProvider extends CredentialProvider {
  static Future<void> _globalRefreshLock = Future.value();

  @override
  Future<Account> getCredential(Account account) async {
    if (account.accessToken == null || account.accessToken!.isEmpty) {
      throw Exception('账号 ${account.externalId} 缺少访问令牌');
    }

    // 如果令牌过期或即将过期，自动刷新
    if (account.isTokenExpired || account.isTokenExpiringSoon) {
      return await refreshCredential(account);
    }

    return account;
  }

  @override
  Future<Account> refreshCredential(Account account) async {
    if (account.refreshToken == null || account.refreshToken!.isEmpty) {
      throw CredentialExpiredException(account, '缺少刷新令牌，请重新登录');
    }
    
    // 确保同一时间只有一个刷新操作在进行
    await _globalRefreshLock.catchError((_) {});
    final lockCompleter = Completer<void>();
    _globalRefreshLock = lockCompleter.future;

    try {
      // 调用具体平台的刷新逻辑
      final newTokenData = await requestTokenRefresh(account.refreshToken!);

      // 更新账号中的凭据字段
      account.accessToken = newTokenData['access_token'] as String;
      account.tokenExpiry = DateTime.now().add(
        Duration(seconds: newTokenData['expires_in'] as int),
      );
      account.credentialUpdatedAt = DateTime.now();

      if (newTokenData.containsKey('refresh_token')) {
        account.refreshToken = newTokenData['refresh_token'] as String;
      }

      // 保存更新后的账号
      await saveAccount(account);

      return account;
    } catch (e) {
      // 刷新失败，凭据已完全失效
      throw CredentialExpiredException(account, '刷新凭据失败: $e');
    } finally {
      lockCompleter.complete();
    }
  }

  /// 请求刷新令牌 (子类需实现)
  Future<Map<String, dynamic>> requestTokenRefresh(String refreshToken);

  /// 保存账号到存储 (子类需实现)
  Future<void> saveAccount(Account account);
}

/// 用户名密码凭据提供者
abstract class UserPasswordCredentialProvider extends CredentialProvider {
  @override
  Future<Account> getCredential(Account account) async {
    if (account.username == null || account.password == null) {
      throw CredentialExpiredException(
        account,
        '账号 ${account.externalId} 缺少用户名或密码',
      );
    }

    // 验证凭据是否仍然有效
    final isValid = await validateCredential(account);
    if (!isValid) {
      throw CredentialExpiredException(account, '凭据已失效，请重新登录');
    }

    return account;
  }

  @override
  Future<Account> refreshCredential(Account account) async {
    // 用户名密码类型通常需要重新登录
    throw UnimplementedError('用户名密码凭据不支持自动刷新，请重新登录');
  }
}
