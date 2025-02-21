import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/provider/data_source_manager.dart';

class WikiPage extends ConsumerWidget {
  const WikiPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataSource = ref.watch(dataSourceManagerProvider);
    final ds = ref.read(dataSourceManagerProvider.notifier);

    return dataSource.when(
        data: (data) {
          if (data.activeSource == null) {
            return const Center(
              child: Text("没有数据"),
            );
          }

          final provider = ds.getDataSource(data.activeSource!);

          if (provider == null) {
            return Center(
              child: Text("数据源 “${data.activeSource}” 不可用"),
            );
          }

          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor:
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
              surfaceTintColor: Colors.transparent,
              centerTitle: false,
              flexibleSpace: ClipRRect(
                  child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: Container(color: Colors.transparent))),
              title: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(provider.getProviderGameName()),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(1),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                  )),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                const SizedBox(width: 8),
              ],
            ),
            body: provider.buildSongList(),
          );
        },
        error: (_, e) {
          return Center(
            child: Text("加载失败\n$e"),
          );
        },
        loading: () => const CircularProgressIndicator());
  }
}
