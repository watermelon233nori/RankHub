import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/src/core/abstract/mode_strategy.dart';
import 'package:rank_hub/src/core/player_manager.dart';
import 'package:rank_hub/src/core/strategy_manager.dart';
import 'package:rank_hub/src/model/player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mixin_provider.g.dart';

@riverpod
Future<({ModeStrategy strategy, Player player})> playerStrategyMixin(
  Ref ref, String? playerId,
) async {
  final strategyNogtifer = ref.read(strategyManagerProvider.notifier);
  final playerNotifier = ref.read(playerManagerProvider.notifier);

  final playerState = await ref.watch(playerManagerProvider.future);

  if (playerState.activePlayerId == null && playerId == null) {
    throw Exception("No player present");
  }

  final player = await playerNotifier.getPlayerById(playerId ?? playerState.activePlayerId!);

  if (player == null) {
    throw Exception("Player not found");
  }

  final strategy = strategyNogtifer.getStrategy(player.provider);

  if (strategy == null) {
    throw Exception("Strategy not found");
  }

  return (strategy: strategy, player: player);
}