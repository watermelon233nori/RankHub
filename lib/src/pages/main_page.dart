import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rank_hub/src/pages/data_src_page.dart';
import 'package:rank_hub/src/pages/rank_page.dart';
import 'package:rank_hub/src/pages/wiki_page.dart';
import 'package:rank_hub/src/view/settings_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const _channel = MethodChannel('fun.meow0.rankhub.network');
  int _selectedIndex = 0;
  late final PageController _pageController;

  Future<void> startTunnel() async {
    await _channel.invokeMethod('startTunnel');
  }

  Future<void> stopTunnel() async {
    await _channel.invokeMethod('stopTunnel');
  }

  // 底部导航项列表
  final List<NavigationDestination> _navItems = const [
    NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: '概览'),
    NavigationDestination(
        icon: Icon(Icons.insert_chart_outlined),
        selectedIcon: Icon(Icons.insert_chart),
        label: '成绩'),
    NavigationDestination(
        icon: Icon(Icons.book_outlined),
        selectedIcon: Icon(Icons.book),
        label: '百科'),
    NavigationDestination(
        icon: Icon(Icons.cloud_outlined),
        selectedIcon: Icon(Icons.cloud),
        label: '数据源'),
    NavigationDestination(
        icon: Icon(Icons.settings_outlined),
        selectedIcon: Icon(Icons.settings),
        label: '设置'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 页面列表
    final List<Widget> pages = [
      const Center(child: Text("还没想好这部分要怎么写")),
      const RankPage(),
      const WikiPage(),
      const DataSrcPage(),
      SettingsPage(),
    ];

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: NavigationBar(
                backgroundColor:
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
                destinations: _navItems,
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onNavItemTapped,
              ))),
      body: Stack(
        children: pages
            .asMap()
            .entries
            .map((entry) => AnimatedOpacity(
                  curve: Curves.easeInOutExpo,
                  opacity: _selectedIndex == entry.key ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: AnimatedScale(
                    scale: _selectedIndex == entry.key ? 1.0 : 0.98,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutExpo,
                    child: IgnorePointer(
                        ignoring: _selectedIndex != entry.key,
                        child: entry.value),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
