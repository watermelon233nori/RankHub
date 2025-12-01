import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 日志级别
enum LogLevel { debug, info, warning, error }

/// 日志条目
class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String message;
  final String? stackTrace;
  final String? tag;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.message,
    this.stackTrace,
    this.tag,
  });

  String get formattedTime {
    return '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}:'
        '${timestamp.second.toString().padLeft(2, '0')}.'
        '${timestamp.millisecond.toString().padLeft(3, '0')}';
  }

  static IconData getLevelIconData(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return Icons.bug_report;
      case LogLevel.info:
        return Icons.info;
      case LogLevel.warning:
        return Icons.warning;
      case LogLevel.error:
        return Icons.error;
    }
  }

  String get levelName {
    switch (level) {
      case LogLevel.debug:
        return 'DEBUG';
      case LogLevel.info:
        return 'INFO';
      case LogLevel.warning:
        return 'WARN';
      case LogLevel.error:
        return 'ERROR';
    }
  }
}

/// 日志服务 - 捕获和管理应用日志
class LogService extends GetxService {
  static LogService? _instance;

  static LogService get instance {
    _instance ??= LogService._();
    return _instance!;
  }

  LogService._();

  // 日志列表（最多保存1000条）
  final RxList<LogEntry> _logs = <LogEntry>[].obs;
  List<LogEntry> get logs => _logs;
  RxList<LogEntry> get logsRx => _logs;

  // 最大日志数量
  static const int maxLogs = 1000;

  // 是否启用日志捕获
  final RxBool _enabled = true.obs;
  bool get enabled => _enabled.value;
  set enabled(bool value) => _enabled.value = value;

  /// 初始化日志服务
  void initialize() {
    // 重写 debugPrint 来捕获日志
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) {
        _addLog(LogLevel.debug, message);
      }
      // 仍然输出到控制台
      developer.log(message ?? '', name: 'DEBUG');
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      _addLog(
        LogLevel.error,
        error.toString(),
        stackTrace: stack.toString(),
        tag: 'PlatformDispatcher',
      );
      return true; // 已处理错误
    };

    // 捕获 FlutterError
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      _addLog(
        LogLevel.error,
        details.exception.toString(),
        stackTrace: details.stack.toString(),
        tag: 'FlutterError',
      );
      originalOnError?.call(details);
    };

    debugPrint('📝 日志服务已初始化');
  }

  /// 添加日志
  void _addLog(
    LogLevel level,
    String message, {
    String? stackTrace,
    String? tag,
  }) {
    if (!_enabled.value) return;

    final entry = LogEntry(
      timestamp: DateTime.now(),
      level: level,
      message: message,
      stackTrace: stackTrace,
      tag: tag,
    );

    _logs.add(entry);

    // 限制日志数量
    if (_logs.length > maxLogs) {
      _logs.removeAt(0);
    }
  }

  /// 记录调试日志
  void debug(String message, {String? tag}) {
    _addLog(LogLevel.debug, message, tag: tag);
    developer.log(message, name: tag ?? 'DEBUG');
  }

  /// 记录信息日志
  void info(String message, {String? tag}) {
    _addLog(LogLevel.info, message, tag: tag);
    developer.log(message, name: tag ?? 'INFO');
  }

  /// 记录警告日志
  void warning(String message, {String? tag}) {
    _addLog(LogLevel.warning, message, tag: tag);
    developer.log(message, name: tag ?? 'WARN');
  }

  /// 记录错误日志
  void error(String message, {String? stackTrace, String? tag}) {
    _addLog(LogLevel.error, message, stackTrace: stackTrace, tag: tag);
    developer.log(
      message,
      name: tag ?? 'ERROR',
      error: message,
      stackTrace: stackTrace != null ? StackTrace.fromString(stackTrace) : null,
    );
  }

  /// 清空日志
  void clear() {
    _logs.clear();
    debugPrint('🗑️ 日志已清空');
  }

  /// 获取指定级别的日志
  List<LogEntry> getLogsByLevel(LogLevel level) {
    return _logs.where((log) => log.level == level).toList();
  }

  /// 搜索日志
  List<LogEntry> searchLogs(String query) {
    if (query.isEmpty) return _logs;

    final lowerQuery = query.toLowerCase();
    return _logs.where((log) {
      return log.message.toLowerCase().contains(lowerQuery) ||
          (log.tag?.toLowerCase().contains(lowerQuery) ?? false) ||
          (log.stackTrace?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();
  }

  /// 导出日志为文本
  String exportLogs() {
    final buffer = StringBuffer();
    buffer.writeln('===== RankHub 日志导出 =====');
    buffer.writeln('导出时间: ${DateTime.now()}');
    buffer.writeln('日志数量: ${_logs.length}');
    buffer.writeln('============================\n');

    for (final log in _logs) {
      buffer.writeln(
        '[${log.formattedTime}] [${log.levelName}]${log.tag != null ? ' [${log.tag}]' : ''} ${log.message}',
      );
      if (log.stackTrace != null) {
        buffer.writeln('Stack Trace:\n${log.stackTrace}');
      }
      buffer.writeln('---');
    }

    return buffer.toString();
  }

  // ==================== 全局静态便捷方法 ====================

  /// 全局调试日志
  static void d(String message, {String? tag}) {
    instance.debug(message, tag: tag);
  }

  /// 全局信息日志
  static void i(String message, {String? tag}) {
    instance.info(message, tag: tag);
  }

  /// 全局警告日志
  static void w(String message, {String? tag}) {
    instance.warning(message, tag: tag);
  }

  /// 全局错误日志
  static void e(String message, {String? stackTrace, String? tag}) {
    instance.error(message, stackTrace: stackTrace, tag: tag);
  }
}
