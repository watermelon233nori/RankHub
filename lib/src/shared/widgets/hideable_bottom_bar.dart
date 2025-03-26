import 'dart:ui';

import 'package:flutter/material.dart';

class HideableBottomBar extends StatelessWidget {
  const HideableBottomBar({
    super.key,
    required this.visible,
    required this.child,
    this.height = 72.0,
  });

  final bool visible;
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: visible ? height : 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: BottomAppBar(
            color: Theme.of(context).scaffoldBackgroundColor.withAlpha(242),
            child: OverflowBox(
              maxHeight: height,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
