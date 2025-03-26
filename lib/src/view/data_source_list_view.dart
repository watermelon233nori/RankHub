import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';
import 'package:rank_hub/src/core/abstract/data_source_provider.dart';

class DataSourceListView extends ConsumerWidget {
  const DataSourceListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providers = ref.watch(dataSourceManagerProvider);

    return providers.when(
        data: (data) {
          return ListView.builder(
              itemCount: data.sources.length,
              itemBuilder: (ctx, index) {
                String key = data.sources.keys.elementAt(index);
                DataSourceProvider provider = data.sources[key]!;
                return ListTile(
                  leading: provider.buildProviderIcon(),
                  title: Text(provider.getProviderName()),
                  subtitle: Text("${provider.getProviderGameName()} - ${provider.getProviderLoacation()}"),
                  trailing: Switch(value: provider.isActive, onChanged: (_) {}),
                );
              });
        },
        error: (_, e) => Center(child: Text("无法加载数据源\n$e"),),
        loading: () => const CircularProgressIndicator());
  }
}
