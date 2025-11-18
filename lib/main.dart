import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/routes/app_pages.dart';
import 'package:rank_hub/routes/app_routes.dart';
import 'package:rank_hub/controllers/theme_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 初始化主题控制器
    final themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        title: 'RankHub',
        theme: themeController.getLightTheme(),
        darkTheme: themeController.getDarkTheme(),
        themeMode: themeController.themeMode.value,
        // 设置初始路由
        initialRoute: AppRoutes.main,
        // 配置路由页面
        getPages: AppPages.routes,
        // 禁用调试横幅
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
