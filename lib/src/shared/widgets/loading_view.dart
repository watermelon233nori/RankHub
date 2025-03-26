import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final String? loadingText;

  const LoadingView({super.key, this.loadingText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        if (loadingText != null) ...[
          const SizedBox(height: 10),
          Text(loadingText!, style: const TextStyle(fontSize: 16)),
        ],
      ],
    );
  }
}
