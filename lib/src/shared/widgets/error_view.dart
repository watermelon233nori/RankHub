import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final String? errorDetails;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.errorMessage,
    this.errorDetails,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 40),
        const SizedBox(height: 10),
        Text(errorMessage, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        if (errorDetails != null)
          TextButton(
            onPressed: () => _showErrorDetailsDialog(context),
            child: const Text('查看详细信息'),
          ),
        if (onRetry != null)
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('重新加载'),
          ),
      ],
    );
  }

  void _showErrorDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('错误详情'),
          content: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: SelectableText(
                errorDetails ?? '无详细信息',
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: errorDetails ?? ''));
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
