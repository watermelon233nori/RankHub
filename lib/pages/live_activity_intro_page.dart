import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/live_activity_service.dart';
import '../services/queue_status_manager.dart';
import 'dart:io';

/// 实时活动介绍页面
/// 从底部全屏弹出，展示实时活动效果
class LiveActivityIntroPage extends StatelessWidget {
  final bool showSkipButton;

  const LiveActivityIntroPage({super.key, this.showSkipButton = true});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 上半部分：展示效果图
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight * 0.6,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    // 关闭按钮
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    SizedBox(height: 32),
                    // 效果图
                    Expanded(
                      child: Center(child: _buildDemoImage(screenWidth)),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 下半部分：说明和按钮
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题
                      Text(
                        '实时活动',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),

                      // 副标题
                      Text(
                        '在灵动岛和锁屏界面实时查看排队状态',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // 功能说明
                      _buildFeatureItem(
                        context,
                        Icons.visibility,
                        '实时显示',
                        '持续显示您的排队位置和等待时间',
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureItem(
                        context,
                        Icons.notifications_active,
                        '即时更新',
                        '队列变化时自动更新，无需打开应用',
                      ),
                      const SizedBox(height: 16),
                      _buildFeatureItem(
                        context,
                        Icons.touch_app,
                        '快速访问',
                        '点击灵动岛即可快速打开应用查看详情',
                      ),
                      const SizedBox(height: 32),

                      // 按钮组
                      Row(
                        children: [
                          if (showSkipButton) ...[
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () async {
                                  if (Platform.isIOS) {
                                    await LiveActivityService.instance
                                        .markNotFirstTime();
                                  }
                                  Get.back();
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('暂不开启'),
                              ),
                            ),
                            const SizedBox(width: 12),
                          ],
                          Expanded(
                            flex: showSkipButton ? 1 : 2,
                            child: FilledButton(
                              onPressed: () async {
                                if (Platform.isIOS) {
                                  // 开启实时活动
                                  await LiveActivityService.instance.setEnabled(
                                    true,
                                  );
                                  // 标记已经不是首次
                                  await LiveActivityService.instance
                                      .markNotFirstTime();
                                  // 立即刷新排队状态以创建 Live Activity
                                  try {
                                    await QueueStatusManager.instance
                                        .refreshStatus();
                                  } catch (e) {
                                    // 忽略错误，可能当前没有排队状态
                                  }
                                  Get.back();
                                  Get.snackbar(
                                    '成功',
                                    '已开启实时活动',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else {
                                  Get.back();
                                }
                              },
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(showSkipButton ? '开启' : '关闭'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDemoImage(double screenWidth) {
    // 尝试加载本地图片，如果不存在则显示占位图
    return SizedBox(
      width: screenWidth * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'assets/images/live_activity_demo.png',
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          errorBuilder: (context, error, stackTrace) {
            // 图片加载失败时显示占位内容
            return Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.widgets, size: 64, color: Colors.grey[600]),
                  const SizedBox(height: 16),
                  Text(
                    '实时活动演示',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '加入队列后可在灵动岛查看排队状态',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: Theme.of(context).primaryColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 显示实时活动介绍页面（从底部弹出）
  static Future<void> show({bool showSkipButton = true}) async {
    await Get.to(
      () => LiveActivityIntroPage(showSkipButton: showSkipButton),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 300),
      fullscreenDialog: true,
    );
  }
}
