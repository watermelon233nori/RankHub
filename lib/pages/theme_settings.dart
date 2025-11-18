import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';

class ThemeSettingsPage extends StatelessWidget {
  const ThemeSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    // 预定义的主题色
    final List<Color> themeColors = [
      Colors.blue,
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('主题设置')),
      body: ListView(
        children: [
          // 主题模式
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              '主题模式',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              title: const Text('浅色'),
              subtitle: const Text('始终使用浅色主题'),
              value: ThemeMode.light,
              groupValue: themeController.themeMode.value,
              onChanged: (value) {
                if (value != null) {
                  themeController.setThemeMode(value);
                }
              },
            ),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              title: const Text('深色'),
              subtitle: const Text('始终使用深色主题'),
              value: ThemeMode.dark,
              groupValue: themeController.themeMode.value,
              onChanged: (value) {
                if (value != null) {
                  themeController.setThemeMode(value);
                }
              },
            ),
          ),
          Obx(
            () => RadioListTile<ThemeMode>(
              title: const Text('跟随系统'),
              subtitle: const Text('根据系统设置自动切换'),
              value: ThemeMode.system,
              groupValue: themeController.themeMode.value,
              onChanged: (value) {
                if (value != null) {
                  themeController.setThemeMode(value);
                }
              },
            ),
          ),

          // 主题色
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Text(
              '主题色',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Obx(
              () => Wrap(
                spacing: 16,
                runSpacing: 16,
                children: themeColors.map((color) {
                  final isSelected = themeController.seedColor.value == color;
                  return GestureDetector(
                    onTap: () => themeController.setSeedColor(color),
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(
                                color: Theme.of(context).colorScheme.outline,
                                width: 3,
                              )
                            : null,
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: color.computeLuminance() > 0.5
                                  ? Colors.black
                                  : Colors.white,
                              size: 32,
                            )
                          : null,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
