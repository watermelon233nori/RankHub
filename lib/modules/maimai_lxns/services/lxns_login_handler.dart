import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'package:rank_hub/utils/pkce_helper.dart';

/// Chrome Safari Browser 实例，用于打开授权页面
class OAuth2Browser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print('OAuth2 浏览器已打开');
  }

  @override
  void onClosed() {
    print('OAuth2 浏览器已关闭');
  }
}

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
  static const String redirectUri = 'urn:ietf:wg:oauth:2.0:oob'; // 无回调地址时使用
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
      return response.statusCode == 200;
    } catch (e) {
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
      // 获取用户 profile 信息
      final profileResponse = await _dio.get(
        '$baseUrl/api/v0/user/profile',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      if (profileResponse.statusCode == 200) {
        final profileData = profileResponse.data['data'];
        final userId = profileData['id'];
        final userName = profileData['name'];
        final userEmail = profileData['email'];

        return PlatformAccountInfo(
          externalId: userId.toString(),
          displayName: userName ?? 'lxns_user',
          avatarUrl: iconUrl, // 使用平台 icon 作为头像
          metadata: {'user_id': userId, 'email': userEmail},
        );
      }
    } catch (e) {
      print('获取账号信息失败: $e');
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> refreshCredentials(
    Map<String, dynamic> oldCredentialData,
  ) async {
    final refreshToken = oldCredentialData['refresh_token'] as String?;
    if (refreshToken == null) {
      return null;
    }

    try {
      final response = await _dio.post(
        '$baseUrl/api/v0/oauth/token',
        data: {
          'client_id': clientId,
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
        },
        options: Options(contentType: Headers.jsonContentType),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
        };
      }
    } catch (e) {
      print('刷新 token 失败: $e');
    }
    return null;
  }

  /// 使用授权码交换访问令牌
  Future<Map<String, dynamic>?> exchangeCodeForToken(
    String code,
    String codeVerifier,
  ) async {
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

      if (response.statusCode == 200) {
        final data = response.data['data'];
        return {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
          'scope': data['scope'],
        };
      }
    } on DioException catch (dioException) {
      print(
        '交换 token 失败: ${dioException.response?.data ?? dioException.message}',
      );
    } catch (e) {
      print('交换 token 失败: $e');
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
  final _codeController = TextEditingController();
  String? _codeVerifier;
  String? _authUrl;
  bool _isLoading = false;
  bool _showCodeInput = false;

  @override
  void initState() {
    super.initState();
    _generateAuthUrl();
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  /// 生成授权链接
  void _generateAuthUrl() {
    final pkcePair = PkceHelper.generatePkcePair();
    _codeVerifier = pkcePair['code_verifier'];
    final codeChallenge = pkcePair['code_challenge'];

    _authUrl =
        '${LxnsLoginHandler.baseUrl}/oauth/authorize?'
        'response_type=code&'
        'client_id=${LxnsLoginHandler.clientId}&'
        'redirect_uri=${Uri.encodeComponent(LxnsLoginHandler.redirectUri)}&'
        'scope=${Uri.encodeComponent(LxnsLoginHandler.scope)}&'
        'code_challenge=$codeChallenge&'
        'code_challenge_method=S256';
  }

  /// 验证授权码格式
  /// lxns 授权码格式: XXXX-XXXX-XXXX (12个字符 + 2个连字符)
  bool _isValidAuthCode(String code) {
    final cleaned = code.trim();
    // 匹配格式: 4个大写字母/数字 - 4个大写字母/数字 - 4个大写字母/数字
    final regex = RegExp(r'^[A-Z0-9]{4}-[A-Z0-9]{4}-[A-Z0-9]{4}$');
    return regex.hasMatch(cleaned);
  }

  /// 从剪切板读取并验证授权码
  Future<String?> _readAuthCodeFromClipboard() async {
    try {
      final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
      final text = clipboardData?.text?.trim();
      if (text != null && _isValidAuthCode(text)) {
        return text;
      }
    } catch (e) {
      print('读取剪切板失败: $e');
    }
    return null;
  }

  /// 打开 WebView 进行授权
  Future<void> _openWebView() async {
    if (_authUrl == null) return;

    setState(() => _isLoading = true);

    try {
      // 使用 ChromeSafariBrowser 打开授权页面
      final browser = OAuth2Browser();
      await browser.open(
        url: WebUri(_authUrl!),
        settings: ChromeSafariBrowserSettings(
          shareState: CustomTabsShareState.SHARE_STATE_OFF,
          barCollapsingEnabled: true,
        ),
      );

      // 浏览器关闭后,尝试从剪切板读取授权码
      setState(() {
        _showCodeInput = true;
        _isLoading = false;
      });

      // 延迟一下再读取剪切板,确保用户有时间复制
      await Future.delayed(const Duration(milliseconds: 300));

      if (mounted) {
        final authCode = await _readAuthCodeFromClipboard();
        if (authCode != null) {
          // 自动填充授权码
          _codeController.text = authCode;

          // 显示提示
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('已自动填充授权码'),
                duration: Duration(seconds: 2),
              ),
            );

            // 自动提交登录
            await Future.delayed(const Duration(milliseconds: 500));
            if (mounted) {
              await _handleCodeLogin();
            }
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('打开授权页面失败: $e')));
        setState(() => _isLoading = false);
      }
    }
  }

  /// 使用授权码登录
  Future<void> _handleCodeLogin() async {
    final code = _codeController.text.trim();
    if (code.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('请输入授权码')));
      return;
    }

    // 验证授权码格式
    if (!_isValidAuthCode(code)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('授权码格式不正确,应为 XXXX-XXXX-XXXX 格式')),
      );
      return;
    }

    if (_codeVerifier == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('PKCE 验证码丢失,请重新授权')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final handler = LxnsLoginHandler();

      // 使用授权码交换 token
      final tokenData = await handler.exchangeCodeForToken(
        code,
        _codeVerifier!,
      );
      if (tokenData == null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('获取访问令牌失败,请检查授权码是否正确')));
        }
        return;
      }

      // 获取账号信息
      final accountInfo = await handler.fetchAccountInfo(tokenData);
      if (accountInfo == null) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('获取账号信息失败')));
        }
        return;
      }

      // 返回登录结果
      if (mounted) {
        Navigator.pop(
          context,
          PlatformLoginResult(
            externalId: accountInfo.externalId,
            credentialData: tokenData,
            displayName: accountInfo.displayName,
            avatarUrl: accountInfo.avatarUrl,
            metadata: accountInfo.metadata,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('登录失败: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                  // 背景图 - 使用 AspectRatio 确保完整显示
                  CachedNetworkImage(
                    imageUrl: LxnsLoginHandler.backgroundUrl,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: colorScheme.surfaceContainerHighest,
                        child: const Center(child: CircularProgressIndicator()),
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
                  // 前景图 - 使用 Positioned.fill 跟随背景尺寸
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: LxnsLoginHandler.foregroundUrl,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => const SizedBox(),
                      errorWidget: (context, url, error) => const SizedBox(),
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

            // 步骤说明
            _buildStepCard(
              context,
              step: '1',
              title: '点击下方按钮打开授权页面',
              description: '将在系统浏览器中打开,登录您的落雪咖啡屋账号并授权',
            ),
            const SizedBox(height: 16),
            _buildStepCard(
              context,
              step: '2',
              title: '复制授权码',
              description: '授权成功后会显示授权码(形如 ABCD-EFGH-IJKL),复制到剪切板',
            ),
            const SizedBox(height: 16),
            _buildStepCard(
              context,
              step: '3',
              title: '返回应用',
              description: '关闭浏览器,应用会自动读取剪切板并填充授权码',
            ),
            const SizedBox(height: 32),

            // 打开授权页面按钮
            if (!_showCodeInput)
              FilledButton.icon(
                onPressed: _isLoading ? null : _openWebView,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.open_in_browser),
                label: const Text('打开授权页面'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),

            // 授权码输入框
            if (_showCodeInput) ...[
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(
                  labelText: '授权码',
                  hintText: '格式: XXXX-XXXX-XXXX (自动填充)',
                  helperText: '复制授权码后会自动填充并提交',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.key),
                ),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textCapitalization: TextCapitalization.characters,
                readOnly: _isLoading,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _isLoading ? null : _handleCodeLogin,
                icon: _isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.login),
                label: const Text('登录'),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: _isLoading ? null : _openWebView,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('重新授权'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildStepCard(
    BuildContext context, {
    required String step,
    required String title,
    required String description,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                step,
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
