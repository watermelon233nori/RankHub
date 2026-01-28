import 'package:flutter/material.dart';

class ContainSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  final String textLeft;
  final String textRight;
  final IconData leftIcon;
  final IconData rightIcon;

  final double width;
  final double height;

  const ContainSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.textLeft,
    required this.textRight,
    required this.leftIcon,
    required this.rightIcon,
    this.width = 260,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    final radius = height / 2;
    final sliderWidth = width * 0.7;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (d) {
        final isLeft = d.localPosition.dx < width / 2;
        if (isLeft != value) onChanged(isLeft);
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            // 背景胶囊（深色）
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),

            // 滑块（浅色，仅做“包含”）
            AnimatedPositioned(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOutCubic,
              left: value ? 4 : width - sliderWidth - 4,
              top: 4,
              bottom: 4,
              child: IgnorePointer(
                child: Container(
                  width: sliderWidth,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(radius),
                  ),
                ),
              ),
            ),

            // 内容层（永远固定）
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  SizedBox(width: 4),
                  _icon(icon: leftIcon, selected: value),

                  Expanded(
                    child: Center(
                      child: Text(
                        value ? textLeft : textRight,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  _icon(icon: rightIcon, selected: !value),

                  SizedBox(width: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _icon({required IconData icon, required bool selected}) {
    return Icon(
      icon,
      size: 20,
      color: selected ? Colors.black : Colors.grey.shade400,
    );
  }
}
