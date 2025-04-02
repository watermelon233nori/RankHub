import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/pages/player_switch_page.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';
import 'package:rank_hub/src/core/player_manager.dart';

class RankPage extends ConsumerWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerManager = ref.watch(playerManagerProvider);
    final dsm = ref.read(dataSourceManagerProvider.notifier);
    final pm = ref.read(playerManagerProvider.notifier);

    return playerManager.when(
        data: (value) {
          if (value.activePlayerId == null ||
              pm.getDataSourceName(playerId: value.activePlayerId) == null) {
            return const Scaffold(
              body: Center(
                child: Text('没有数据'),
              ),
            );
          }

          final dataSourceProvider = dsm.getDataSource(
            pm.getDataSourceName(playerId: value.activePlayerId)!,
          );

          if (dataSourceProvider == null) {
            return const Scaffold(
              body: Center(
                child: Text('数据源不可用'),
              ),
            );
          }

          return Scaffold(
            body: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Scaffold(
                extendBody: true,
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.9),
                  surfaceTintColor: Colors.transparent,
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  flexibleSpace: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: dataSourceProvider.getDefaultRecordTitle()),
                      Tab(text: dataSourceProvider.getRankedRecordsTitle()),
                    ],
                  ),
                  title: TextButton(
                    onPressed: () {
                      showCupertinoSheet(
                        context: context,
                        pageBuilder: (context) => const PlayerSwitchPage(),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${pm.getPlayerName(playerId: value.activePlayerId)} (${dataSourceProvider.getProviderGameName()})",
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  actions:
                      dataSourceProvider.buildRecordPageAppBarActions(context),
                ),
                body: TabBarView(
                  children: [
                    dataSourceProvider.buildRecordList(),
                    dataSourceProvider.buildRankedRecordList(),
                  ],
                ),
              ),
            ),
          );
        },
        error: (_, e) {
          return Scaffold(
            body: Center(
              child: Text('无法获取成绩列表\n$e'),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
