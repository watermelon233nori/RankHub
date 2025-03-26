import 'package:rank_hub/src/features/lx_mai/data/model/player_data.dart';
import 'package:rank_hub/src/features/lx_mai/domain/lx_mai_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'lx_mai_player_provider.g.dart';

@riverpod
class LxMaiPlayer extends _$LxMaiPlayer {
  @override
  Future<List<PlayerData>> build() async {
    final repo = ref.watch(lxMaiRepositoryProvider);
    return await repo.getPlayerDataList();
  }
}