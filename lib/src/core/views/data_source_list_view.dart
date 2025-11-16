import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/core/strategy_manager.dart';

class DataSourceListView extends ConsumerWidget {
  const DataSourceListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = ref.watch(strategyManagerProvider);

    return providers.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.strategies.length,
              itemBuilder: (ctx, index) {
                String key = data.strategies.keys.elementAt(index);
                ModeStrategy provider = data.strategies[key]!;
                return ListTile(
                  leading: Image(image: provider.getModeIcon(),
                      width: 40,
                      height: 40),
                  title: Text(provider.getModeName()),
                  subtitle: Text("${provider.getGameName()} - ${provider.getDataSourceLocation()}"),
                );
              });
        },
        error: (_, e) => Center(child: Text("无法加载数据源\n$e"),),
        loading: () => const CircularProgressIndicator());
  }
}
