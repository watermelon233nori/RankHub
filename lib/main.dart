import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rank_hub/routes/app_pages.dart';
import 'package:rank_hub/routes/app_routes.dart';
import 'package:rank_hub/controllers/theme_controller.dart';
import 'package:rank_hub/services/log_service.dart';
import 'package:rank_hub/services/qr_code_scanner_service.dart';
import 'package:rank_hub/services/mai_party_qr_handler.dart';
import 'package:rank_hub/services/mai_net_qr_handler.dart';
import 'package:rank_hub/services/queue_status_manager.dart';
import 'package:rank_hub/services/live_activity_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化日志服务
  final logService = LogService.instance;
  logService.initialize();

  // 初始化 Live Activities
  await LiveActivityService.instance.init();

  // 注册二维码处理器
  final qrService = QRCodeScannerService();
  qrService.registerHandler(MaiPartyQRCodeHandler());
  qrService.registerHandler(MaiNetQRCodeHandler());

  // 初始化排队状态管理器
  Get.put(QueueStatusManager());

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
        initialRoute: AppRoutes.main,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
