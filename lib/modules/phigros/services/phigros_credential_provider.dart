import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'phigros_api_service.dart';

class PhigrosCredentialProvider extends ApiKeyCredentialProvider {
  final PhigrosApiService _apiService = PhigrosApiService.instance;

  @override
  Platform get platform => Platform.phigros;

  @override
  Future<bool> validateCredential(Account account) async {
    if (account.apiKey == null) {
      return false;
    }

    try {
      // 通过请求用户信息来验证 Session Token 是否有效
      await _apiService.getUserInfo(account.apiKey!);
      return true;
    } catch (e) {
      print('验证凭据失败: $e');
      return false;
    }
  }

  @override
  Future<void> createCredential(
    Account account,
    Map<String, dynamic> credentialData,
  ) async {
    // 直接设置 Account 对象中的凭据字段
    account.credentialType = CredentialType.apiKey;
    account.apiKey = credentialData['api_key'] as String?;
    account.credentialCreatedAt = DateTime.now();
    account.credentialUpdatedAt = DateTime.now();
  }

  @override
  Future<void> revokeCredential(Account account) async {
    account.apiKey = null;
  }
}
