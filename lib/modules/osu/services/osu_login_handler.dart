import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:rank_hub/models/osu/osu_user.dart';
import 'package:rank_hub/models/osu/osu_score.dart';
import 'package:rank_hub/services/account_service.dart';
import 'package:rank_hub/services/isar_service.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/services/platform_login_handler.dart';

/// osu! 平台登录处理器
/// 使用 OAuth2 授权流程
class OsuLoginHandler extends PlatformLoginHandler {
  // OAuth2 配置
  static const String baseUrl = 'https://osu.ppy.sh';
  static const String clientId = '47511';
  static const String clientSecret = 'Ttswix8hCsxowTJxKfeyBTI5PV4zWvIfM8VzTVKD';
  static const String redirectUri = 'rankhub://osu/callback';
  static const String scope = 'public identify';

  final Dio _dio = Dio();

  @override
  Platform get platform => Platform.osu;

  @override
  String get platformName => 'osu! Bancho';

  @override
  IconData get platformIcon => Icons.music_note;

  @override
  String get platformIconUrl => 'https://osu.ppy.sh/favicon.ico';

  @override
  String get platformDescription => 'osu! 官服 - 使用 OAuth2 授权登录';

  @override
  Future<PlatformLoginResult?> showLoginPage(BuildContext context) async {
    return await performOAuth2Login();
  }

  /// 执行 OAuth2 登录流程
  Future<PlatformLoginResult?> performOAuth2Login() async {
    final BuildContext? context = Get.context;
    try {
      // 构建授权 URL
      final authUrl =
          '$baseUrl/oauth/authorize?'
          'client_id=$clientId&'
          'redirect_uri=${Uri.encodeComponent(redirectUri)}&'
          'response_type=code&'
          'scope=${Uri.encodeComponent(scope)}';

      print('🔐 开始 osu! OAuth2 授权...');
      print('📤 授权 URL: $authUrl');

      // 使用 flutter_web_auth 打开授权页面
      final result = await FlutterWebAuth2.authenticate(
        url: authUrl,
        callbackUrlScheme: 'rankhub',
      );

      print('📥 收到回调: $result');

      // 解析回调 URL
      final uri = Uri.parse(result);
      final code = uri.queryParameters['code'];
      final error = uri.queryParameters['error'];

      if (error != null) {
        print('❌ 授权失败: $error');
        return null;
      }

      if (code == null) {
        print('❌ 未收到授权码');
        return null;
      }

      print('✅ 授权码获取成功: $code');

      // 使用授权码交换 token
      final tokenData = await exchangeCodeForToken(code);
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

      // 显示数据同步提示
      if (context != null && context.mounted) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('正在同步 osu! 数据...'),
                    SizedBox(height: 8),
                    Text(
                      '正在获取用户详细信息',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }

      // 触发数据同步（等待执行完成）
      await _syncUser(
        tokenData['access_token'] as String,
        accountInfo.externalId,
      );

      // 关闭 Loading 弹窗
      if (context != null && context.mounted && Navigator.canPop(context)) {
        Navigator.pop(context);
      }

      return PlatformLoginResult(
        externalId: accountInfo.externalId,
        credentialData: tokenData,
        displayName: accountInfo.displayName,
        avatarUrl: accountInfo.avatarUrl,
        metadata: accountInfo.metadata,
      );
    } catch (e) {
      print('❌ osu! 登录失败: $e');
      return null;
    }
  }

  @override
  Future<bool> validateCredentials(Map<String, dynamic> credentialData) async {
    final accessToken = credentialData['access_token'] as String?;
    if (accessToken == null || accessToken.isEmpty) {
      return false;
    }

    // 验证 token 是否有效 - 使用 me 接口
    try {
      final response = await _dio.get(
        '$baseUrl/api/v2/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('验证 osu! token 失败: $e');
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
      print('📤 获取 osu! 用户信息...');
      final response = await _dio.get(
        '$baseUrl/api/v2/me',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      print('📥 响应: ${response.data}');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final userId = data['id'];
        final username = data['username'];
        final avatarUrl = data['avatar_url'];

        print('✅ 获取用户信息成功: $username (ID: $userId)');

        return PlatformAccountInfo(
          externalId: userId.toString(),
          displayName: username ?? 'osu! Player',
          avatarUrl: avatarUrl,
          metadata: {'user_id': userId, 'username': username},
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

    print('🔄 开始刷新 osu! token...');

    try {
      final response = await _dio.post(
        '$baseUrl/oauth/token',
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'grant_type': 'refresh_token',
          'refresh_token': refreshToken,
          // 'scope': scope, // 刷新时 scope 可选，如果需要更改权限则需要
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Accept': 'application/json'},
        ),
      );

      print('📥 响应状态码: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final newTokenData = {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'], // 刷新后可能会返回新的 refresh_token
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
        };
        print('✅ 刷新 token 成功');
        return newTokenData;
      }
    } catch (e) {
      print('❌ 刷新 token 失败: $e');
    }
    return null;
  }

  /// 使用授权码交换访问令牌
  Future<Map<String, dynamic>?> exchangeCodeForToken(String code) async {
    print('🔄 开始交换授权码...');

    try {
      final response = await _dio.post(
        '$baseUrl/oauth/token',
        data: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
          'grant_type': 'authorization_code',
          'redirect_uri': redirectUri,
        },
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {'Accept': 'application/json'},
        ),
      );

      print('📥 响应状态码: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final tokenData = {
          'access_token': data['access_token'],
          'refresh_token': data['refresh_token'],
          'token_expiry': DateTime.now()
              .add(Duration(seconds: data['expires_in'] as int))
              .toIso8601String(),
          'scope': scope,
        };

        print('✅ 交换 token 成功');
        return tokenData;
      }
    } catch (e) {
      print('❌ 交换 token 失败: $e');
    }
    return null;
  }

  /// 撤销访问令牌
  Future<bool> revokeToken(String accessToken) async {
    print('🔄 开始撤销 osu! token...');

    try {
      final response = await _dio.delete(
        '$baseUrl/oauth/tokens/current',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      print('📥 撤销 token 响应状态码: ${response.statusCode}');

      return response.statusCode == 204 || response.statusCode == 200;
    } catch (e) {
      print('❌ 撤销 token 失败: $e');
      return false;
    }
  }

  /// 同步用户数据
  /// 优化：只请求 /me 并解析 statistics_rulesets
  Future<void> _syncUser(String accessToken, String userIdStr) async {
    print('🔄 开始同步 osu! 用户数据...');
    final userId = int.tryParse(userIdStr);
    if (userId == null) return;

    try {
      print('📤 获取用户详细信息 (/me)...');
      final response = await _dio.get(
        '$baseUrl/api/v2/me',
        queryParameters: {'key': 'id'}, // 使用 ID 查找
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        // 直接解析并保存 OsuUser
        // OsuUser.fromJson 已经包含了对 statistics_rulesets 的处理逻辑
        final osuUser = OsuUser.fromJson(data);

        await IsarService.instance.osu.saveUser(osuUser);
        print('✅ osu! 用户数据同步完成');

        // 同步所有模式的 Best Scores
        final modes = ['osu', 'taiko', 'fruits', 'mania'];
        for (final mode in modes) {
          // 检查该模式是否有数据（可选，这里简单起见全部尝试同步，或者检查 play_count > 0）
          // API 如果该模式没玩过可能会返回空列表，符合预期
          await syncBestScores(accessToken, userId, mode);
        }
      }
    } catch (e) {
      print('❌ 同步 osu! 用户数据失败: $e');
    }
  }

  /// 同步用户的 Best 100 成绩
  Future<void> syncBestScores(
    String accessToken,
    int userId,
    String mode,
  ) async {
    print('🔄 同步 $mode Best 100 成绩...');
    try {
      final response = await _dio.get(
        '$baseUrl/api/v2/users/$userId/scores/best',
        queryParameters: {'mode': mode, 'limit': 100},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final scores = data.map((e) => OsuScore.fromJson(e)).toList();

        await IsarService.instance.osu.saveScores(scores);
        print('✅ $mode Best 100 同步完成: ${scores.length} 条');
      }
    } catch (e) {
      print('❌ 同步 $mode 成绩失败: $e');
    }
  }

  /// 手动刷新用户数据
  Future<void> refreshUser(Account account) async {
    print('🔄 刷新 osu! 用户数据 (ID: ${account.externalId})');

    // 1. 获取有效 Token (自动处理刷新)
    // 使用 AccountService 来获取最新的凭据，而不是直接在 handler 中实现
    final updatedAccount = await AccountService.instance.getCredential(account);
    final accessToken = updatedAccount.accessToken;

    if (accessToken == null) {
      print('❌ 无法获取有效凭证，请重新登录');
      Get.snackbar('刷新失败', '登录凭证已过期，请重新登录');
      return;
    }

    // 2. 显示 Loading (如果是手动触发)
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    try {
      // 3. 执行同步
      await _syncUser(accessToken, account.externalId);

      Get.back(); // 关闭 Loading
      Get.snackbar('刷新成功', 'osu! 数据已更新');
    } catch (e) {
      Get.back();
      print('❌ 刷新失败: $e');
      Get.snackbar('刷新失败', e.toString());
    }
  }
}
