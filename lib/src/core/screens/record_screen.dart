import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/mixin_provider.dart';
import 'package:rank_hub/src/pages/player_switch_page.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class RecordScreen extends ConsumerWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerStrategyMixin = ref.watch(playerStrategyMixinProvider(null));

    return switch (playerStrategyMixin) {
      AsyncData(:final valueOrNull?) => _buildRecordScreen(context, valueOrNull),
      AsyncError(:final error, :final stackTrace) => ErrorView(
          errorMessage: error.toString(), errorDetails: stackTrace.toString()),
      _ => const LoadingView(),
    };
  }

  Widget _buildRecordScreen(BuildContext context, dynamic valueOrNull) {
    final strategy = valueOrNull.strategy;
    final playerId = valueOrNull.player.uuid;
    final recordViews = strategy.getRecordViews(playerId);
    final recordActions = strategy.getRecordScreenActions();

    return DefaultTabController(
      length: recordViews.length,
      initialIndex: 0,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
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
            tabs: recordViews.keys.map((title) => Tab(text: title)).toList(),
          ),
          title: TextButton(
            onPressed: () {
              showCupertinoSheet(
                context: context,
                pageBuilder: (context) => const PlayerSwitchPage(),
              );
            },
            style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${valueOrNull.player.name} (${strategy.getGameName()})"),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Wrap(
                spacing: 8,
                children: recordActions.entries
                    .map((entry) => IconButton(icon: entry.key, onPressed: entry.value))
                    .toList(),
              ),
            ),
          ],
        ),
        body: TabBarView(children: recordViews.values.toList()),
      ),
    );
  }
}