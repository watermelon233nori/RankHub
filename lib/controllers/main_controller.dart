import 'package:get/get.dart';

class MainController extends GetxController {
  // 当前选中的底部导航索引
  var currentIndex = 0.obs;

  // 切换底部导航
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
