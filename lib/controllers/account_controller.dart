import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/modules/musedash/services/musedash_credential_provider.dart';
import 'package:rank_hub/services/account_service.dart';
import 'package:rank_hub/modules/lxns/services/lxns_credential_provider.dart';
import 'package:rank_hub/services/platform_login_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 账号管理控制器
class AccountController extends GetxController {
  final AccountService _accountService = AccountService.instance;
  static const String _currentAccountIdKey = 'current_account_id';

  // ========== 状态管理 ==========
  final _accounts = <Account>[].obs;
  List<Account> get accounts => _accounts;

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  // ========== 当前账号 ==========
  final Rx<Account?> _currentAccount = Rx<Account?>(null);
  Account? get currentAccount => _currentAccount.value;
  Rx<Account?> get currentAccountRx => _currentAccount;

  @override
  void onInit() {
    super.onInit();

    // 初始化平台登录管理器
    PlatformLoginManager.instance.initialize();

    // 注册凭据提供者
    _accountService.registerProvider(LxnsCredentialProvider());
    _accountService.registerProvider(MuseDashCredentialProvider());

    // 加载账号列表
    loadAccounts();
  }

  /// 加载所有账号
  Future<void> loadAccounts() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final accounts = await _accountService.getAllAccounts();
      _accounts.value = accounts;

      // 从 SharedPreferences 恢复上次选择的账号
      final prefs = await SharedPreferences.getInstance();
      final savedAccountId = prefs.getInt(_currentAccountIdKey);

      if (savedAccountId != null) {
        // 尝试找到保存的账号
        final savedAccount = accounts.firstWhereOrNull(
          (a) => a.id == savedAccountId,
        );
        if (savedAccount != null) {
          _currentAccount.value = savedAccount;
          return;
        }
      }

      // 如果没有当前账号,选择第一个激活的账号
      if (_currentAccount.value == null && accounts.isNotEmpty) {
        _currentAccount.value = accounts.firstWhereOrNull((a) => a.isActive);
        // 保存选择
        if (_currentAccount.value != null) {
          await _saveCurrentAccountId(_currentAccount.value!.id);
        }
      }
    } catch (e) {
      _errorMessage.value = '加载账号失败: $e';
      print('加载账号失败: $e');
      debugPrintStack(stackTrace: (e as Error).stackTrace);
    } finally {
      _isLoading.value = false;
    }
  }

  /// 绑定新账号
  Future<bool> bindAccount({
    required Platform platform,
    required String externalId,
    required Map<String, dynamic> credentialData,
    String? displayName,
    String? avatarUrl,
  }) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final account = await _accountService.bindAccount(
        platform: platform,
        externalId: externalId,
        credentialData: credentialData,
        displayName: displayName,
        avatarUrl: avatarUrl,
      );

      await loadAccounts();

      // 如果是第一个账号,设置为当前账号
      if (_currentAccount.value == null) {
        _currentAccount.value = account;
      }

      Get.snackbar('成功', '账号绑定成功');
      return true;
    } catch (e) {
      _errorMessage.value = '绑定账号失败: $e';
      Get.snackbar('错误', '绑定账号失败: $e');
      print(e);
      debugPrintStack(stackTrace: (e as Error).stackTrace);
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// 解绑账号
  Future<bool> unbindAccount(int accountId) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      await _accountService.unbindAccount(accountId);
      await loadAccounts();

      // 如果删除的是当前账号,清空当前账号
      if (_currentAccount.value?.id == accountId) {
        _currentAccount.value = _accounts.firstWhereOrNull((a) => a.isActive);
        await _saveCurrentAccountId(_currentAccount.value?.id);
      }

      Get.snackbar('成功', '账号解绑成功');
      return true;
    } catch (e) {
      _errorMessage.value = '解绑账号失败: $e';
      Get.snackbar('错误', '解绑账号失败: $e');
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  /// 切换当前账号
  Future<void> switchAccount(Account account) async {
    _currentAccount.value = account;
    await _saveCurrentAccountId(account.id);
    Get.snackbar('成功', '已切换到账号: ${account.displayName ?? account.externalId}');
  }

  /// 保存当前账号ID
  Future<void> _saveCurrentAccountId(int? accountId) async {
    final prefs = await SharedPreferences.getInstance();
    if (accountId != null) {
      await prefs.setInt(_currentAccountIdKey, accountId);
    } else {
      await prefs.remove(_currentAccountIdKey);
    }
  }

  /// 设置账号激活状态
  Future<void> setAccountActive(int accountId, bool isActive) async {
    try {
      await _accountService.setAccountActive(accountId, isActive);
      await loadAccounts();
    } catch (e) {
      Get.snackbar('错误', '操作失败: $e');
    }
  }

  /// 获取账号凭据（含自动刷新）
  Future<Account?> getAccountCredential(Account account) async {
    try {
      return await _accountService.getCredential(account);
    } catch (e) {
      Get.snackbar('错误', '获取凭据失败: $e');
      return null;
    }
  }

  /// 验证账号凭据
  Future<bool> validateAccount(Account account) async {
    try {
      return await _accountService.validateCredential(account);
    } catch (e) {
      return false;
    }
  }

  /// 获取指定平台的激活账号
  Account? getActivePlatformAccount(Platform platform) {
    return _accounts.firstWhereOrNull(
      (a) => a.platform == platform && a.isActive,
    );
  }

  /// 检查平台是否已绑定
  bool hasPlatformAccount(Platform platform) {
    return _accounts.any((a) => a.platform == platform);
  }

  /// 获取平台账号数量
  int getPlatformAccountCount(Platform platform) {
    return _accounts.where((a) => a.platform == platform).length;
  }
}
