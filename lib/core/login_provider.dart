import 'package:flutter/material.dart';
import 'package:rank_hub/core/platform_id.dart';

/// 平台账号信息
class PlatformAccountInfo {
  /// 外部账号ID
  final String externalId;

  /// 显示名称
  final String? displayName;

  /// 头像URL
  final String? avatarUrl;

  /// 额外元数据
  final String? metadata;

  PlatformAccountInfo({
    required this.externalId,
    this.displayName,
    this.avatarUrl,
    this.metadata,
  });
}

/// 平台登录结果
class PlatformLoginResult {
  /// 外部账号ID(平台的唯一标识)
  final String externalId;

  /// 凭据数据
  final Map<String, dynamic> credentialData;

  /// 显示名称(可选)
  final String? displayName;

  /// 头像URL(可选)
  final String? avatarUrl;

  /// 额外元数据(可选)
  final String? metadata;

  PlatformLoginResult({
    required this.externalId,
    required this.credentialData,
    this.displayName,
    this.avatarUrl,
    this.metadata,
  });
}

/// 平台登录处理器
/// 负责处理不同平台的登录流程
abstract class PlatformLoginHandler {
  /// 平台ID
  PlatformId get platformId;

  /// 平台名称
  String get platformName;

  /// 平台图标
  IconData get platformIcon;

  /// 平台图标 URL（可选，优先使用）
  String? get platformIconUrl => null;

  /// 平台描述
  String get platformDescription;

  /// 显示登录页面
  /// 返回登录结果，如果登录失败或取消则返回 null
  Future<PlatformLoginResult?> showLoginPage(BuildContext context);

  /// 验证凭据
  /// 检查给定的凭据是否有效
  Future<bool> validateCredentials(Map<String, dynamic> credentialData);

  /// 获取账号信息
  /// 通过凭据获取账号的详细信息(如用户名、头像等)
  Future<PlatformAccountInfo?> fetchAccountInfo(
    Map<String, dynamic> credentialData,
  );

  /// 刷新凭据(可选)
  /// 对于需要定期刷新的凭据(如OAuth2),实现此方法
  Future<Map<String, dynamic>?> refreshCredentials(
    Map<String, dynamic> oldCredentialData,
  ) async {
    return null; // 默认不需要刷新
  }

  /// 撤销凭据(可选)
  /// 在解绑账号时调用,用于清理平台侧的授权
  Future<void> revokeCredentials(Map<String, dynamic> credentialData) async {
    // 默认不执行任何操作
  }
}
