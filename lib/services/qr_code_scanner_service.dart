import 'package:flutter/material.dart';

/// 二维码处理器接口
/// 用于解析和处理扫描到的二维码内容
abstract class QRCodeHandler {
  /// 处理器名称
  String get name;

  /// 处理器描述
  String get description;

  /// 判断是否可以处理此二维码内容
  /// 返回 true 表示可以处理
  bool canHandle(String qrContent);

  /// 处理二维码内容
  /// [context] BuildContext，用于导航等操作
  /// [qrContent] 二维码内容
  Future<void> handle(BuildContext context, String qrContent);
}

/// 二维码扫描器服务
/// 管理所有已注册的二维码处理器
class QRCodeScannerService {
  // 单例模式
  static final QRCodeScannerService _instance =
      QRCodeScannerService._internal();
  factory QRCodeScannerService() => _instance;
  QRCodeScannerService._internal();

  // 已注册的处理器列表
  final List<QRCodeHandler> _handlers = [];

  /// 注册处理器
  void registerHandler(QRCodeHandler handler) {
    if (!_handlers.contains(handler)) {
      _handlers.add(handler);
      print('✅ 已注册二维码处理器: ${handler.name}');
    }
  }

  /// 注销处理器
  void unregisterHandler(QRCodeHandler handler) {
    _handlers.remove(handler);
    print('❌ 已注销二维码处理器: ${handler.name}');
  }

  /// 获取所有已注册的处理器
  List<QRCodeHandler> get handlers => List.unmodifiable(_handlers);

  /// 处理二维码内容
  /// 自动匹配合适的处理器并处理
  /// 返回是否成功处理
  Future<bool> handleQRCode(BuildContext context, String qrContent) async {
    print('📱 扫描到二维码: $qrContent');

    // 查找可以处理此内容的处理器
    final handler = _handlers.firstWhere(
      (h) => h.canHandle(qrContent),
      orElse: () => _DefaultHandler(),
    );

    if (handler is _DefaultHandler) {
      print('⚠️ 未找到匹配的处理器');
      return false;
    }

    try {
      print('🔄 使用处理器: ${handler.name}');
      await handler.handle(context, qrContent);
      return true;
    } catch (e) {
      print('❌ 处理二维码失败: $e');
      rethrow;
    }
  }

  /// 清空所有处理器
  void clearHandlers() {
    _handlers.clear();
    print('🗑️ 已清空所有二维码处理器');
  }
}

/// 默认处理器（用于未匹配到处理器的情况）
class _DefaultHandler implements QRCodeHandler {
  @override
  String get name => 'Default';

  @override
  String get description => 'Default handler';

  @override
  bool canHandle(String qrContent) => false;

  @override
  Future<void> handle(BuildContext context, String qrContent) async {}
}
