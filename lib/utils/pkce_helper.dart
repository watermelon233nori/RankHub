import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';

/// PKCE (Proof Key for Code Exchange) 工具类
/// 用于 OAuth2 授权流程的安全增强
class PkceHelper {
  /// 生成随机的 code_verifier
  /// 长度在 43-128 个字符之间,使用 URL 安全的 Base64 编码
  static String generateCodeVerifier() {
    const length = 128;
    const charset =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final random = Random.secure();
    return List.generate(
      length,
      (i) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// 生成 code_challenge
  /// 使用 SHA-256 对 code_verifier 进行哈希,然后进行 Base64 URL 编码
  static String generateCodeChallenge(String codeVerifier) {
    final bytes = utf8.encode(codeVerifier);
    final digest = sha256.convert(bytes);
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

  /// 生成 PKCE 参数对
  /// 返回包含 code_verifier 和 code_challenge 的 Map
  static Map<String, String> generatePkcePair() {
    final codeVerifier = generateCodeVerifier();
    final codeChallenge = generateCodeChallenge(codeVerifier);
    return {'code_verifier': codeVerifier, 'code_challenge': codeChallenge};
  }
}
