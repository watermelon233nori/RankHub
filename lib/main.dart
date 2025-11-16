import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/routes/app_pages.dart';
import 'package:rank_hub/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RankHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 设置初始路由
      initialRoute: AppRoutes.main,
      // 配置路由页面
      getPages: AppPages.routes,
      // 禁用调试横幅
      debugShowCheckedModeBanner: false,
    );
  }
}
