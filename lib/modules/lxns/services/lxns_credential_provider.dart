import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/account_isar_service.dart';
import 'lxns_login_handler.dart';

/// 落雪咖啡屋凭据提供者
/// 使用 OAuth2 + PKCE 授权，支持自动刷新 token
class LxnsCredentialProvider extends OAuth2CredentialProvider {
  final LxnsLoginHandler _loginHandler = LxnsLoginHandler();

  @override
  Platform get platform => Platform.lxns;

  @override
  Future<void> saveAccount(Account account) async {
    await AccountIsarService.instance.saveAccount(account);
  }

  @override
  Future<bool> validateCredential(Account account) async {
    if (account.accessToken == null) {
      return false;
    }

    return await _loginHandler.validateCredentials({
      'access_token': account.accessToken,
    });
  }

  @override
  Future<Map<String, dynamic>> requestTokenRefresh(String refreshToken) async {
    // 使用 refresh_token 获取新的访问令牌
    final newTokenData = await _loginHandler.refreshCredentials({
      'refresh_token': refreshToken,
    });

    if (newTokenData == null) {
      throw Exception('刷新 token 失败');
    }

    // 返回标准格式的 token 数据
    final expiryTime = DateTime.parse(newTokenData['token_expiry'] as String);
    final expiresIn = expiryTime.difference(DateTime.now()).inSeconds;

    return {
      'access_token': newTokenData['access_token'],
      'refresh_token': newTokenData['refresh_token'],
      'expires_in': expiresIn,
    };
  }

  @override
  Future<void> createCredential(
    Account account,
    Map<String, dynamic> credentialData,
  ) async {
    // 直接设置 Account 对象中的凭据字段
    account.credentialType = CredentialType.oauth2;
    account.accessToken = credentialData['access_token'];
    account.refreshToken = credentialData['refresh_token'];
    account.tokenExpiry = DateTime.parse(
      credentialData['token_expiry'] as String,
    );
    account.additionalData = credentialData['scope'] as String?;
    account.credentialCreatedAt = DateTime.now();
    account.credentialUpdatedAt = DateTime.now();
  }

  @override
  Future<void> revokeCredential(Account account) async {
    // TODO: 如果平台支持，调用撤销 API

    // 清空账号中的凭据字段
    account.accessToken = null;
    account.refreshToken = null;
    account.tokenExpiry = null;
    account.additionalData = null;
  }
}
