import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/models/maimai/net_user.dart';
import 'package:rank_hub/modules/lxns/services/maimai_net_api_service.dart';
import 'package:rank_hub/modules/lxns/services/net_user_service.dart';
import 'package:rank_hub/modules/lxns/services/net_sync_helper.dart';

/// NET数据同步Controller
class NetSyncController extends GetxController {
  final Account account;

  NetSyncController({required this.account});

  // 状态
  final isLoading = false.obs;
  final currentStep = Rx<NetSyncStep>(NetSyncStep.input);
  final input = ''.obs;

  // NET用户列表
  final recentNetUsers = <NetUser>[].obs;
  final selectedNetUser = Rx<NetUser?>(null);

  // 同步进度
  final syncProgress = 0.0.obs;
  final syncMessage = ''.obs;
  final syncedScoreCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadRecentNetUsers();
  }

  /// 加载最近使用的NET用户
  Future<void> _loadRecentNetUsers() async {
    try {
      final users = await NetUserService.instance.getRecentNetUsers(limit: 10);
      recentNetUsers.value = users;
    } catch (e) {
      print('加载NET用户列表失败: $e');
    }
  }

  /// 自动判断输入类型并获取用户
  /// - 纯数字：User ID
  /// - SGWCMAID开头：QR Code
  Future<void> fetchUserByInput() async {
    final inputValue = input.value.trim();
    if (inputValue.isEmpty) {
      Get.snackbar(
        '错误',
        '请输入User ID或QR Code',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // 判断输入类型
    if (inputValue.startsWith('SGWCMAID')) {
      // QR Code
      await _fetchUserByQrCode(inputValue);
    } else if (RegExp(r'^\d+$').hasMatch(inputValue)) {
      // 纯数字 User ID
      final userId = int.tryParse(inputValue);
      if (userId != null) {
        await _fetchUserByUserId(userId);
      } else {
        Get.snackbar('错误', 'User ID格式错误', snackPosition: SnackPosition.BOTTOM);
      }
    } else {
      Get.snackbar(
        '错误',
        '输入格式不正确，请输入User ID（纯数字）或QR Code（SGWCMAID开头）',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// 通过QR Code获取用户
  Future<void> _fetchUserByQrCode(String qrCode) async {
    isLoading.value = true;
    try {
      final netUser = await MaimaiNetApiService.instance.createUserFromQrCode(
        qrCode,
      );

      // 保存到本地
      await NetUserService.instance.saveNetUser(netUser);

      selectedNetUser.value = netUser;
      currentStep.value = NetSyncStep.preview;

      // 刷新最近用户列表
      await _loadRecentNetUsers();
    } catch (e) {
      Get.snackbar('错误', '获取用户信息失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 通过User ID获取用户
  Future<void> _fetchUserByUserId(int userId) async {
    isLoading.value = true;
    try {
      final netUser = await MaimaiNetApiService.instance.createUserFromUserId(
        userId,
      );

      // 保存到本地
      await NetUserService.instance.saveNetUser(netUser);

      selectedNetUser.value = netUser;
      currentStep.value = NetSyncStep.preview;

      // 刷新最近用户列表
      await _loadRecentNetUsers();
    } catch (e) {
      Get.snackbar('错误', '获取用户信息失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 选择最近使用的用户
  Future<void> selectRecentUser(NetUser user) async {
    selectedNetUser.value = user;
    currentStep.value = NetSyncStep.preview;

    // 更新最后使用时间
    await NetUserService.instance.updateLastUsedTime(user.userId);
    await _loadRecentNetUsers();
  }

  /// 开始同步成绩到查分器
  Future<void> startSync() async {
    final user = selectedNetUser.value;
    if (user == null) return;

    currentStep.value = NetSyncStep.syncing;
    isLoading.value = true;
    syncProgress.value = 0.0;
    syncMessage.value = '正在从NET获取成绩...';
    syncedScoreCount.value = 0;

    try {
      // 检查访问令牌
      if (account.accessToken == null || account.accessToken!.isEmpty) {
        throw Exception('访问令牌不存在，请重新登录');
      }

      // 使用统一的同步逻辑
      final count = await NetSyncHelper.syncNetScoresToLxns(
        userId: user.userId,
        accessToken: account.accessToken!,
        onProgress: (progress, message, scoreCount) {
          syncProgress.value = progress;
          syncMessage.value = message;
          syncedScoreCount.value = scoreCount;
        },
      );

      currentStep.value = NetSyncStep.success;

      Get.snackbar(
        '成功',
        '成功同步 $count 条成绩到查分器',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
      );
    } catch (e) {
      currentStep.value = NetSyncStep.error;
      syncMessage.value = '同步失败: $e';
      Get.snackbar(
        '同步失败',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// 返回输入界面
  void backToInput() {
    currentStep.value = NetSyncStep.input;
    selectedNetUser.value = null;
    input.value = '';
    syncProgress.value = 0.0;
    syncMessage.value = '';
    syncedScoreCount.value = 0;
  }

  /// 从剪贴板粘贴
  Future<void> pasteFromClipboard(Function(String) onPaste) async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data != null && data.text != null && data.text!.isNotEmpty) {
      onPaste(data.text!);
    }
  }
}

/// NET同步步骤
enum NetSyncStep {
  input, // 输入QR Code或User ID
  preview, // 预览用户信息
  syncing, // 同步中
  success, // 同步成功
  error, // 同步失败
}
