import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final String? errorDetails;
  final VoidCallback? onRetry;
  static const int _messageLimit = 20;

  const ErrorView({
    super.key,
    required this.errorMessage,
    this.errorDetails,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final bool isTooLong = errorMessage.length > _messageLimit;
    final bool useFallbackDetails = isTooLong && (errorDetails == null);
    final String? displayDetails = useFallbackDetails ? errorMessage : errorDetails;
    final String shortMessage = isTooLong ? '加载失败\n点击下方按钮查看详情或重新加载' : errorMessage;

    return Container(
      padding: const EdgeInsets.all(64),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 40),
            const SizedBox(height: 10),
            Text(
              shortMessage,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (onRetry != null)
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('重新加载'),
              ),
            if (displayDetails != null)
              TextButton(
                onPressed: () => _showErrorDetailsDialog(context, displayDetails),
                child: const Text('查看详细信息'),
              ),
          ],
        ),
      ),
    );
  }

  void _showErrorDetailsDialog(BuildContext context, String details) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('错误详情'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SelectableText(
                details,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: details));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('已复制到剪贴板')),
                );
              },
              child: const Text('复制'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('关闭'),
            ),
          ],
        );
      },
    );
  }
}