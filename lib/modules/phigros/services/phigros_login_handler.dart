import 'package:flutter/material.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_handler.dart';
import 'phigros_api_service.dart';

/// Phigros平台登录处理器
class PhigrosLoginHandler extends PlatformLoginHandler {
  final PhigrosApiService _apiService = PhigrosApiService.instance;
  @override
  Platform get platform => Platform.phigros;

  @override
  String get platformName => 'Phigros';

  @override
  IconData get platformIcon => Icons.stars_outlined;

  @override
  String? get platformIconUrl =>
      'https://img.tapimg.com/market/images/9000b8b031deabbd424b7f2f530ee162.png';

  @override
  String get platformDescription => 'Phigros 账号绑定';

  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    return await Navigator.push<PlatformLoginResult>(
      context,
      MaterialPageRoute(
        builder: (context) => const _PhigrosSessionTokenLoginPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentialData) async {
    final sessionToken = credentialData['api_key'] as String?;
    if (sessionToken == null || sessionToken.isEmpty) {
      return false;
    }

    try {
      return await _apiService.validateSessionToken(sessionToken);
    } catch (e) {
      print('验证Session Token失败: $e');
      return false;
    }
  }

  @override
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentialData,
  ) async {
    final sessionToken = credentialData['api_key'] as String?;
    if (sessionToken == null || sessionToken.isEmpty) {
      return null;
    }

    try {
      final userInfo = await _apiService.getUserInfo(sessionToken);
      return PlatformAccountInfo(
        externalId: userInfo.objectId,
        displayName: userInfo.nickname,
        avatarUrl: userInfo.avatar,
      );
    } catch (e) {
      print('获取账号信息失败: $e');
      return null;
    }
  }
}

/// Phigros Session Token 登录页面
class _PhigrosSessionTokenLoginPage extends StatefulWidget {
  const _PhigrosSessionTokenLoginPage();

  @override
  State<_PhigrosSessionTokenLoginPage> createState() =>
      _PhigrosSessionTokenLoginPageState();
}

class _PhigrosSessionTokenLoginPageState
    extends State<_PhigrosSessionTokenLoginPage> {
  final _sessionTokenController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final sessionToken = _sessionTokenController.text.trim();
      final apiService = PhigrosApiService.instance;

      // 验证 Session Token 并获取用户信息
      final userInfo = await apiService.getUserInfo(sessionToken);

      if (!mounted) return;

      // 返回登录结果
      Navigator.of(context).pop(
        PlatformLoginResult(
          externalId: userInfo.objectId,
          credentialData: {'api_key': sessionToken},
          displayName: userInfo.nickname,
          avatarUrl: userInfo.avatar,
        ),
      );
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString().replaceFirst('Exception: ', '');
        });
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _sessionTokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('绑定 Phigros 账号')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo 图片
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/phigros.webp',
                    height: 60,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '使用 Session Token 绑定账号',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 64),

                // Session Token 输入框
                TextFormField(
                  controller: _sessionTokenController,
                  decoration: InputDecoration(
                    labelText: 'Session Token',
                    hintText: '粘贴您的 Session Token',
                    prefixIcon: const Icon(Icons.vpn_key),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorText: _errorMessage,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入 Session Token';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                // 登录按钮
                FilledButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('绑定账号', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 24),

                // 帮助说明
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.help_outline, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              '如何获取 Session Token？',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          '1. 使用抓包工具（如 HttpCanary）监听网络请求\n'
                          '2. 在 Phigros 中登录并同步数据\n'
                          '3. 在抓包记录中找到请求头\n'
                          '4. 复制 "X-LC-Session" 字段的值',
                          style: TextStyle(fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '⚠️ 请勿泄露您的 Session Token',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.orange[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
