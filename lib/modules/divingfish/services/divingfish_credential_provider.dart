import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/credential_provider.dart';
import 'package:rank_hub/services/account_isar_service.dart';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

/// 水鱼查分器凭据提供者
/// 使用用户名密码登录获取 JWT token
/// JWT token 通过 cookie 自动管理
class DivingFishCredentialProvider extends UserPasswordCredentialProvider {
  static const String baseUrl = 'https://www.diving-fish.com/api';
  final Dio _dio = Dio();
  final CookieJar _cookieJar = CookieJar();

  DivingFishCredentialProvider() {
    _dio.interceptors.add(CookieManager(_cookieJar));
  }

  @override
  Platform get platform => Platform.divingFish;

  Future<void> saveAccount(Account account) async {
    await AccountIsarService.instance.saveAccount(account);
  }

  @override
  Future<bool> validateCredential(Account account) async {
    if (account.username == null ||
        account.username!.isEmpty ||
        account.password == null ||
        account.password!.isEmpty) {
      return false;
    }

    try {
      // 尝试登录获取 JWT token
      await _performLogin(account);
      return true;
    } catch (e) {
      print('❌ 验证水鱼凭据失败: $e');
      return false;
    }
  }

  @override
  Future<Account> getCredential(Account account) async {
    if (account.username == null ||
        account.username!.isEmpty ||
        account.password == null ||
        account.password!.isEmpty) {
      throw CredentialExpiredException(account, '未设置用户名或密码');
    }

    // 如果没有 JWT token 或 token 已过期，重新登录
    if (account.accessToken == null ||
        account.accessToken!.isEmpty ||
        account.isTokenExpired) {
      await _performLogin(account);
      await saveAccount(account);
    }

    return account;
  }

  /// 执行登录获取 JWT token
  Future<void> _performLogin(Account account) async {
    try {
      final body = {'username': account.username, 'password': account.password};

      final response = await _dio.post(
        '$baseUrl/maimaidxprober/login',
        options: Options(
          headers: {'Content-Type': 'application/json'},
          validateStatus: (status) => status != null && status < 500,
        ),
        data: body,
      );

      if (response.statusCode != 200) {
        throw Exception('登录失败: 用户名或密码错误');
      }

      print('✅ 登录成功');

      // 从 cookies 中提取 jwt_token
      final cookies = await _cookieJar.loadForRequest(
        Uri.parse('$baseUrl/maimaidxprober/login'),
      );

      final jwtCookie = cookies.firstWhere(
        (cookie) => cookie.name == 'jwt_token',
        orElse: () => throw Exception('未获取到 JWT token'),
      );

      // 保存 JWT token 到 account.accessToken
      account.accessToken = jwtCookie.value;
      account.tokenExpiry = jwtCookie.expires;
      account.credentialUpdatedAt = DateTime.now();

      print('🔑 JWT Token 已保存');
    } catch (e) {
      print('❌ 登录失败: $e');
      rethrow;
    }
  }

  @override
  Future<void> createCredential(
    Account account,
    Map<String, dynamic> credentialData,
  ) async {
    // 设置 Account 对象中的凭据字段
    account.credentialType = CredentialType.userPassword;
    account.username = credentialData['username'] as String;
    account.password = credentialData['password'] as String;
    account.credentialCreatedAt = DateTime.now();
    account.credentialUpdatedAt = DateTime.now();

    // 立即执行登录获取 JWT token
    await _performLogin(account);
  }

  @override
  Future<void> revokeCredential(Account account) async {
    // 清空账号中的凭据字段
    account.username = null;
    account.password = null;
    account.accessToken = null;
    account.tokenExpiry = null;
    account.metadata = null;

    // 清除 cookie jar
    await _cookieJar.deleteAll();
  }

  /// 获取 Dio 实例（已配置 CookieManager）
  Dio getDioWithCookies(Account account) {
    // 如果有 JWT token，设置到 cookie jar
    if (account.accessToken != null && account.accessToken!.isNotEmpty) {
      final cookie = Cookie('jwt_token', account.accessToken!);
      if (account.tokenExpiry != null) {
        cookie.expires = account.tokenExpiry;
      }
      _cookieJar.saveFromResponse(Uri.parse(baseUrl), [cookie]);
    }
    return _dio;
  }
}
