import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/credential_provider.dart';

/// MuseDash.moe 凭据提供者
/// 使用 API Key 认证方式
class MuseDashCredentialProvider extends ApiKeyCredentialProvider {
  @override
  Platform get platform => Platform.musedash;

  @override
  Future<bool> validateCredential(Account account) async {
    // TODO: 实现凭据验证逻辑
    // 示例: 检查 API Key 是否存在
    if (account.apiKey == null || account.apiKey!.isEmpty) {
      return false;
    }

    // TODO: 可以调用 API 验证 Key 的有效性
    return true;
  }

  @override
  Future<void> createCredential(
    Account account,
    Map<String, dynamic> data,
  ) async {
    // 从登录结果中提取 API Key 并保存到账号
    if (data.containsKey('api_key')) {
      account.apiKey = data['api_key'] as String;
      account.credentialUpdatedAt = DateTime.now();
    } else {
      throw Exception('缺少 API Key');
    }
  }

  @override
  Future<void> revokeCredential(Account account) async {
    // TODO: 实现撤销凭据逻辑
    // 清除账号中的 API Key
    account.apiKey = null;
    account.credentialUpdatedAt = DateTime.now();
  }
}
