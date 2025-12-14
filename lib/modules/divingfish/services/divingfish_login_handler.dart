import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_handler.dart';

/// 水鱼查分器登录处理器
/// 提供用户名密码登录界面
class DivingFishLoginHandler extends PlatformLoginHandler {
  @override
  Platform get platform => Platform.divingFish;

  @override
  String get platformName => '水鱼查分器';

  @override
  IconData get platformIcon => Icons.water_drop_outlined;

  @override
  String get platformIconUrl => 'https://www.diving-fish.com/favicon.ico';

  @override
  String get platformDescription => 'Maimai DX / CHUNITHM 查分器';

  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    return await Navigator.push<PlatformLoginResult>(
      context,
      MaterialPageRoute(
        builder: (context) => const _DivingFishLoginPage(),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentials) async {
    // 由 CredentialProvider 处理验证
    return true;
  }

  @override
  Future<Map<String, dynamic>?> refreshCredentials(
    Map<String, dynamic> credentials,
  ) async {
    // API Key 不需要刷新
    return null;
  }

  @override
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentials,
  ) async {
    // 使用用户名作为 externalId
    final username = credentials['username'] as String?;

    if (username == null || username.isEmpty) {
      throw Exception('用户名不能为空');
    }

    return PlatformAccountInfo(
      externalId: username,
      displayName: username,
      avatarUrl: platformIconUrl, // 使用平台图标作为头像
    );
  }
}

/// 水鱼查分器登录页面
class _DivingFishLoginPage extends StatefulWidget {
  const _DivingFishLoginPage();

  @override
  State<_DivingFishLoginPage> createState() => _DivingFishLoginPageState();
}

class _DivingFishLoginPageState extends State<_DivingFishLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // 构建凭据数据
      final credentialData = {
        'username': _usernameController.text.trim(),
        'password': _passwordController.text,
      };

      // 获取账号信息
      final loginHandler = DivingFishLoginHandler();
      final accountInfo = await loginHandler.fetchAccountInfo(credentialData);

      final result = PlatformLoginResult(
        externalId: accountInfo?.externalId ?? 'unknown',
        credentialData: credentialData,
        displayName: accountInfo?.displayName,
      );

      if (!mounted) return;
      Navigator.of(context).pop(result);
    } catch (e) {
      if (!mounted) return;

      Get.snackbar(
        '登录失败',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('水鱼查分器登录'), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 平台图标和说明
                Icon(
                  Icons.water_drop_outlined,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  '水鱼查分器',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Maimai DX / CHUNITHM 查分器',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // 登录说明
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '使用您的水鱼查分器账号登录',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '登录后将自动同步您的舞萌DX成绩数据',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // 用户名输入
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: '用户名',
                    hintText: '请输入水鱼账号用户名',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入用户名';
                    }
                    return null;
                  },
                  autofocus: true,
                ),
                const SizedBox(height: 16),

                // 密码输入
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscurePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入密码';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // 登录按钮
                FilledButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('确认', style: TextStyle(fontSize: 16)),
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
