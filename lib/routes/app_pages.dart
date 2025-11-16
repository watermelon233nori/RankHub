import 'package:get/get.dart';
import 'package:rank_hub/pages/main_page.dart';
import 'package:rank_hub/pages/wiki.dart';
import 'package:rank_hub/pages/rank.dart';
import 'package:rank_hub/pages/mine.dart';
import 'package:rank_hub/pages/detail.dart';
import 'package:rank_hub/pages/data_sync.dart';
import 'package:rank_hub/routes/app_routes.dart';
import 'package:rank_hub/controllers/main_controller.dart';
import 'package:rank_hub/controllers/game_controller.dart';
import 'package:rank_hub/controllers/data_sync_controller.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.main,
      page: () => const MainPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainController());
        Get.lazyPut(() => GameController());
      }),
    ),
    GetPage(name: AppRoutes.wiki, page: () => const WikiPage()),
    GetPage(name: AppRoutes.rank, page: () => const RankPage()),
    GetPage(name: AppRoutes.mine, page: () => const MinePage()),
    GetPage(
      name: AppRoutes.detail,
      page: () => const DetailPage(),
      transition: Transition.native,
    ),
    GetPage(
      name: AppRoutes.dataSync,
      page: () => const DataSyncPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => DataSyncController());
      }),
      transition: Transition.native,
    ),
  ];
}
