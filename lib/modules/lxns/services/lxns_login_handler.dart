import 'package:flutter/material.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/utils/pkce_helper.dart';
import 'lxns_api_response.dart';

/// 落雪咖啡屋平台登录处理器
/// 使用 OAuth2 + PKCE 授权流程
class LxnsLoginHandler extends PlatformLoginHandler {
  // OAuth2 配置
  static const String baseUrl = 'https://maimai.lxns.net';
  static const String iconUrl = 'https://maimai.lxns.net/favicon.webp';
  static const String backgroundUrl =
      'https://maimai.lxns.net/logo_background.webp';
  static const String foregroundUrl =
      'https://maimai.lxns.net/logo_foreground.webp';
  static const String clientId = 'd7a8e3dc-0e08-43b1-ac08-7e4b2b4574bd';
  static const String redirectUri = 'https://rankhub.kamitsubaki.city/callback';
  static const String scope =
      'read_user_profile read_player read_user_token write_player';

  final Dio _dio = Dio();

  @override
  Platform get platform => Platform.lxns;

  @override
  String get platformName => '落雪咖啡屋';

  @override
  IconData get platformIcon => Icons.coffee;

  @override
  String get platformIconUrl => iconUrl;

  @override
  String get platformDescription => '舞萌DX/中二节奏查分器 - 使用 OAuth2 授权登录';

  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    return await Navigator.push<PlatformLoginResult>(
      context,
      MaterialPageRoute(
        builder: (context) => const _LxnsOAuth2LoginPage(),
        fullscreenDialog: true,
      ),
    );
  }

  /// 执行 OAuth2 登录流程
  Future<PlatformLoginResult?> performOAuth2Login() async {
    try {
      // 生成 PKCE 参数
      final pkcePair = PkceHelper.generatePkcePair();
      final codeVerifier = pkcePair['code_verifier']!;
      final codeChallenge = pkcePair['code_challenge']!;

      // 生成随机 state 用于防止 CSRF 攻击
      final state = DateTime.now().millisecondsSinceEpoch.toString();

      // 构建授权 URL
      final authUrl =
          '$baseUrl/oauth/authorize?'
          'response_type=code&'
          'client_id=$clientId&'
          'redirect_uri=${Uri.encodeComponent(redirectUri)}&'
          'scope=${Uri.encodeComponent(scope)}&'
          'code_challenge=$codeChallenge&'
          'code_challenge_method=S256&'
          'state=$state';

      print('🔐 开始 OAuth2 授权...');
      print('📤 授权 URL: $authUrl');
      print('📤 Redirect URI: $redirectUri');

      // 使用 flutter_web_auth 打开授权页面
      final result = await FlutterWebAuth.authenticate(
        url: authUrl,
        callbackUrlScheme: 'rankhub',
      );

      print('📥 收到回调: $result');

      // 解析回调 URL
      final uri = Uri.parse(result);
      final code = uri.queryParameters['code'];
      final returnedState = uri.queryParameters['state'];

      if (code == null) {
        print('❌ 未收到授权码');
        return null;
      }

      // 验证 state
      if (returnedState != state) {
        print('❌ State 验证失败');
        return null;
      }

      print('✅ 授权码获取成功: $code');

      // 使用授权码交换 token
      final tokenData = await exchangeCodeForToken(code, codeVerifier);
      if (tokenData == null) {
        print('❌ 交换 token 失败');
        return null;
      }

      // 获取账号信息
      final accountInfo = await fetchAccountInfo(tokenData);
      if (accountInfo == null) {
        print('❌ 获取账号信息失败');
        return null;
      }

      print('✅ 登录成功: ${accountInfo.displayName}');

      return PlatformLoginResult(
        externalId: accountInfo.externalId,
        credentialData: tokenData,
        displayName: accountInfo.displayName,
        avatarUrl: accountInfo.avatarUrl,
        metadata: accountInfo.metadata,
      );
    } catch (e) {
      print('❌ OAuth2 登录失败: $e');
      return null;
    }
  }

  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentialData) async {
    final accessToken = credentialData['access_token'] as String?;
    if (accessToken == null || accessToken.isEmpty) {
      return false;
    }

    // 验证 token 是否有效 - 使用 profile 接口
    try {
      final response = await _dio.get(
        '$baseUrl/api/v0/user/profile',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (response.statusCode == 200) {
        final apiResponse = LxnsApiResponse.fromJson(response.data);
        return apiResponse.success;
      }
      return false;
    } catch (e) {
      print('验证 token 失败: $e');
      return false;
    }
  }

  @override
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentialData,
  ) async {
    final accessToken = credentialData['access_token'] as String?;
    if (accessToken == null) {
      return null;
    }

    try {
      print('📤 获取用户信息...');
      final profileResponse = await _dio.get(
        '$baseUrl/api/v0/user/profile',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      print('📥 响应: ${profileResponse.data}');

      if (profileResponse.statusCode == 200) {
        final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
          profileResponse.data,
          dataParser: (data) => data as Map<String, dynamic>,
        );

        if (!apiResponse.success) {
          print('❌ API 返回失败: ${apiResponse.message}');
          return null;
        }

        final profileData = apiResponse.data!;
        final userId = profileData['id'];
        final userName = profileData['name'];
        final userEmail = profileData['email'];

        print('✅ 获取用户信息成功: $userName (ID: $userId)');

        return PlatformAccountInfo(
          externalId: userId.toString(),
          displayName: userName ?? 'lxns_user',
          avatarUrl: iconUrl,
          metadata: {'user_id': userId, 'email': userEmail},
        );
      }
    } catch (e) {
      print('❌ 获取账号信息失败: $e');
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> refreshCredentials(
    Map<String, dynamic> oldCredentialData,
  ) async {
    final refreshToken = oldCredentialData['refresh_token'] as String?;
    if (refreshToken == null) {
      print('❌ 刷新 token 失败: refresh_token 为 null');
      return null;
    }

    print('🔄 开始刷新 token...');
    print('📤 请求 URL: $baseUrl/api/v0/oauth/token');
    print('📤 请求方法: POST');
    print('📤 Content-Type: ${Headers.jsonContentType}');
    print('📤 请求数据: {');
    print('     client_id: $clientId');
    print('     grant_type: refresh_token');
    print('     refresh_token: $refreshToken');
    print('   }');

    try {
      final response = await _dio.post(
        '$baseUrl/api/v0/oauth/token',
        data: {
          'client_id': clientId,
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          //'client_secret': 'gD93xzHD8XGrWNmjsyZ131REOd3nQxym',
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      print('📥 响应状态码: ${response.statusCode}');
      print('📥 响应 Headers: ${response.headers}');
      print('📥 响应数据: ${response.data}');

      if (response.statusCode == 200) {
        final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
          response.data,
          dataParser: (data) => data as Map<String, dynamic>,
        );

        if (!apiResponse.success) {
          print('❌ API 返回失败: ${apiResponse.message}');
          return null;
        }

        final data = apiResponse.data!;
        final newTokenData = {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
        };
        print('✅ 刷新 token 成功');
        print(
          '   新 access_token: ${(data['access_token'] as String).substring(0, 10)}...',
        );
        print(
          '   新 refresh_token: ${(data['refresh_token'] as String).substring(0, 10)}...',
        );
        print('   过期时间: ${newTokenData['token_expiry']}');
        return newTokenData;
      }
    } on DioException catch (dioException) {
      print('❌ 刷新 token 失败 (DioException):');
      print('   错误类型: ${dioException.type}');
      print('   错误消息: ${dioException.message}');
      print('   响应状态码: ${dioException.response?.statusCode}');
      print('   响应数据: ${dioException.response?.data}');
      print('   响应 Headers: ${dioException.response?.headers}');
    } catch (e) {
      print('❌ 刷新 token 失败 (未知错误): $e');
      print('   错误类型: ${e.runtimeType}');
    }
    return null;
  }

  /// 使用授权码交换访问令牌
  Future<Map<String, dynamic>?> exchangeCodeForToken(
    String code,
    String codeVerifier,
  ) async {
    print('🔄 开始交换授权码...');
    print('📤 请求 URL: $baseUrl/api/v0/oauth/token');
    print('📤 授权码: $code');

    try {
      final response = await _dio.post(
        '$baseUrl/api/v0/oauth/token',
        data: {
          'client_id': clientId,
          'grant_type': 'authorization_code',
          'code': code,
          'redirect_uri': redirectUri,
          'code_verifier': codeVerifier,
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      print('📥 响应状态码: ${response.statusCode}');
      print('📥 响应数据: ${response.data}');

      if (response.statusCode == 200) {
        final apiResponse = LxnsApiResponse<Map<String, dynamic>>.fromJson(
          response.data,
          dataParser: (data) => data as Map<String, dynamic>,
        );

        if (!apiResponse.success) {
          print('❌ API 返回失败: ${apiResponse.message}');
          return null;
        }

        final data = apiResponse.data!;
        final tokenData = {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
          'scope': data['scope'],
        };

        print('✅ 交换 token 成功');
        return tokenData;
      }
    } on DioException catch (dioException) {
      print('❌ 交换 token 失败 (DioException):');
      print('   错误类型: ${dioException.type}');
      print('   响应数据: ${dioException.response?.data}');
    } catch (e) {
      print('❌ 交换 token 失败: $e');
    }
    return null;
  }
}

/// 落雪咖啡屋 OAuth2 登录页面
class _LxnsOAuth2LoginPage extends StatefulWidget {
  const _LxnsOAuth2LoginPage();

  @override
  State<_LxnsOAuth2LoginPage> createState() => _LxnsOAuth2LoginPageState();
}

class _LxnsOAuth2LoginPageState extends State<_LxnsOAuth2LoginPage> {
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
  }

  /// 开始 OAuth2 登录流程
  Future<void> _startOAuth2Login() async {
    setState(() => _isLoading = true);

    try {
      final handler = LxnsLoginHandler();
      final result = await handler.performOAuth2Login();

      if (mounted) {
        if (result != null) {
          Navigator.pop(context, result);
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('登录失败，请重试')));
          setState(() => _isLoading = false);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('登录失败: $e')));
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('落雪咖啡屋登录')),
      body: Column(
        children: [
          // 可滚动内容区域
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Banner 图片 (背景 + 前景叠加)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // 背景图
                        CachedNetworkImage(
                          imageUrl: LxnsLoginHandler.backgroundUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: colorScheme.surfaceContainerHighest,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) => AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Container(
                              color: colorScheme.surfaceContainerHighest,
                              child: Icon(
                                Icons.coffee,
                                size: 64,
                                color: colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        // 前景图
                        Positioned.fill(
                          child: CachedNetworkImage(
                            imageUrl: LxnsLoginHandler.foregroundUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => const SizedBox(),
                            errorWidget: (context, url, error) =>
                                const SizedBox(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '落雪咖啡屋',
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '使用 OAuth2 安全授权登录',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // 功能说明
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '登录说明',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '点击下方按钮将打开浏览器进行授权，授权成功后会自动返回应用完成登录。',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '• 需要登录您的落雪咖啡屋账号\n'
                            '• 授权应用访问您的游戏数据\n'
                            '• 授权成功后自动跳转回应用',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 固定在底部的登录按钮
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: FilledButton.icon(
                onPressed: _isLoading ? null : _startOAuth2Login,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.login),
                label: Text(_isLoading ? '登录中...' : '使用 OAuth2 登录'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize: const Size(double.infinity, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
