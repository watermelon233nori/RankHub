import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rank_hub/models/account/account.dart';
import 'package:rank_hub/modules/lxns/services/maimai_net_api_service.dart';

import 'package:rank_hub/modules/lxns/services/net_sync_helper.dart';
import 'package:techno_kitchen_dart/techno_kitchen_dart.dart';

/// NET数据同步Controller
class NetSyncController extends GetxController {
  final Account account;

  NetSyncController({required this.account});

  // 状态
  final isLoading = false.obs;
  final currentStep = Rx<NetSyncStep>(NetSyncStep.input);
  final input = ''.obs;

  // 当前选中的NET用户
  final selectedNetUser = Rx<UserPreview?>(null);

  // 当前QR Code（用于同步时创建会话）
  final currentQrCode = Rx<String?>(null);

  // 同步进度
  final syncProgress = 0.0.obs;
  final syncMessage = ''.obs;
  final syncedScoreCount = 0.obs;

  /// 通过 QR Code 获取用户信息
  Future<void> fetchUserByQrCode() async {
    final qrCode = input.value.trim();
    if (qrCode.isEmpty) {
      Get.snackbar('错误', '请输入 QR Code', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // 验证 QR Code 格式
    if (!qrCode.startsWith('SGWCMAID')) {
      Get.snackbar(
        '错误',
        'QR Code 格式不正确，必须以 SGWCMAID 开头',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    await _fetchUserByQrCode(qrCode);
  }

  /// 通过QR Code获取用户
  Future<void> _fetchUserByQrCode(String qrCode) async {
    isLoading.value = true;
    try {
      final netUser = await MaimaiNetApiService.instance.getUserPreview(qrCode);

      selectedNetUser.value = netUser;
      currentQrCode.value = qrCode; // 保存QR code用于同步
      currentStep.value = NetSyncStep.preview;
    } catch (e) {
      Get.snackbar('错误', '获取用户信息失败: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// 开始同步成绩到查分器
  Future<void> startSync() async {
    final user = selectedNetUser.value;
    if (user == null) return;

    // 检查是否有QR Code（同步必需）
    final qrCode = currentQrCode.value;
    if (qrCode == null || qrCode.isEmpty) {
      Get.snackbar(
        '提示',
        '请使用QR Code方式获取用户信息以进行同步',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

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

      // 使用统一的同步逻辑，传入QR Code
      final count = await NetSyncHelper.syncNetScoresToLxns(
        qrCode: qrCode,
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
    currentQrCode.value = null;
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
