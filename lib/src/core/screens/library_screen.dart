import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/core/strategy_manager.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strategyData = ref.watch(strategyManagerProvider);

    return switch (strategyData) {
      AsyncData(:final valueOrNull?) => _buildLibraryScreen(context, valueOrNull),
      AsyncError(:final error, :final stackTrace) => ErrorView(
          errorMessage: error.toString(),
          errorDetails: stackTrace.toString(),
      ),
      _ => const LoadingView(),
    };
  }

  Widget _buildLibraryScreen(BuildContext context, ({
    String? activeStrategy,
    Map<String, ModeStrategy> strategies
  }) strategyInfo) {
    final strategy = strategyInfo.activeStrategy;

    if (strategy == null) {
      return _buildNoDataView();
    }

    final provider = strategyInfo.strategies[strategy];

    if (provider == null) {
      return _buildUnavailableView(strategy);
    }

    final libraryViews = provider.getLibraryViews();

    return DefaultTabController(
      length: libraryViews.length,
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: _buildAppBar(context, provider),
        body: TabBarView(children: List<Widget>.from(libraryViews.values)),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, ModeStrategy provider) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: const ColoredBox(color: Colors.transparent),
        ),
      ),
      title: GameTitleButton(gameName: provider.getGameName()),
      bottom: TabBar(
        tabs: provider.getLibraryViews().keys
            .map((title) => Tab(text: title))
            .toList(),
      ),
      actions: const [
        IconButton(
          onPressed: null, // TODO: implement functionality
          icon: Icon(Icons.more_vert),
        ),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildNoDataView() {
    return const Center(child: Text("没有数据"));
  }

  Widget _buildUnavailableView(String strategy) {
    return Center(child: Text("数据源 “$strategy” 不可用"));
  }
}

class GameTitleButton extends StatelessWidget {
  final String gameName;

  const GameTitleButton({super.key, required this.gameName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: Add strategy switch logic
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(gameName),
          const SizedBox(width: 4),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}