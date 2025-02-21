import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/provider/player_manager.dart';

class PlayerSwitchPage extends ConsumerWidget {
  const PlayerSwitchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerManager = ref.watch(playerManagerProvider);
    final playerNotifier = ref.read(playerManagerProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Center(
              child: Text(
                '选择玩家',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Center(
              child: Text('选择你想要查看的玩家'),
            ),
            const SizedBox(height: 64),
            playerManager.when(
              data: (_) => ListView(
                children: playerNotifier.getAllPlayers().map((player) {
                  return RadioListTile<String>(
                    title: Text(player.name),
                    value: player.uuid,
                    groupValue: playerNotifier.getCurrentPlayerId(),
                    onChanged: (value) {
                      if (value != null) {
                        playerNotifier.switchActivePlayer(value);
                      }
                    },
                  );
                }).toList(),
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text("加载错误: \$e")),
            ),
          ],
        ),
      ),
    );
  }
}
