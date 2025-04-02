import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/player_manager.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_filter_bar.dart';
import 'package:rank_hub/src/features/lx_mai/presentation/lx_mai_record_list.dart';
import 'package:rank_hub/src/shared/widgets/error_view.dart';
import 'package:rank_hub/src/shared/widgets/filterable_list_view.dart';
import 'package:rank_hub/src/shared/widgets/loading_view.dart';

class LxMaiRecordView extends ConsumerWidget {
  const LxMaiRecordView({super.key, this.uuid});

  final String? uuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerProvider = ref.watch(playerManagerProvider);

    return switch (playerProvider) {
      AsyncData(:final valueOrNull?) => _buildContent(uuid ?? valueOrNull.activePlayerId),
      AsyncError(:final error, :final stackTrace) => ErrorView(
          errorMessage: error.toString(), errorDetails: stackTrace.toString()),
      _ => const LoadingView(),
    };
  }

  Widget _buildContent(String? playerUuid) {
    if (playerUuid == null) {
      return const Center(child: Text('没有数据'));
    }
    return FilterableListView(
      filterViewBuilder: (visible) => LxMaiRecordFilterBar(visible),
      listViewBuilder: (scrollController) => LxMaiRecordList(
        uuid: playerUuid,
        scrollController: scrollController,
      ),
    );
  }
}