import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:rank_hub/src/pages/add_player_screen.dart';
import 'package:rank_hub/src/core/views/data_source_list_view.dart';
import 'package:rank_hub/src/core/views/player_list_view.dart';

class DataSrcScreen extends StatefulWidget {
  const DataSrcScreen({super.key});

  @override
  State<DataSrcScreen> createState() => _DataSrcScreenState();
}

class _DataSrcScreenState extends State<DataSrcScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _fabKey = GlobalKey<ExpandableFabState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('数据源'),
        automaticallyImplyLeading: false,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.sync))],
        bottom: TabBar(controller: _tabController, tabs: const <Widget>[
          Tab(
            text: '玩家数据',
          ),
          Tab(
            text: '游戏数据',
          ),
        ]),
      ),
      floatingActionButton: ExpandableFab(
        key: _fabKey,
        overlayStyle: const ExpandableFabOverlayStyle(
            color: Color.fromRGBO(0, 0, 0, 0.6)),
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 72,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.add),
          fabSize: ExpandableFabSize.regular,
        ),
        children: [
          FloatingActionButton.extended(
            heroTag: null,
            icon: const Icon(Icons.cloud),
            label: const Text("添加数据源"),
            onPressed: () {},
          ),
          FloatingActionButton.extended(
            heroTag: null,
            icon: const Icon(Icons.person),
            label: const Text("添加玩家"),
            onPressed: () {
              final state = _fabKey.currentState;
              if (state != null) {
                state.toggle();
              }
              showCupertinoSheet(
                  context: context,
                  pageBuilder: (context) => const AddPlayerScreen());
            },
          ),
        ],
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const PlayerListView()),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const DataSourceListView()),
        ],
      ),
    ));
  }
}
