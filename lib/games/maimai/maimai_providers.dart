import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rank_hub/core/resource_provider.dart';
import 'package:rank_hub/games/maimai/maimai_resources.dart';
import 'package:rank_hub/games/maimai/models/maimai_score.dart';
import 'package:rank_hub/games/maimai/models/maimai_song.dart';
import 'package:rank_hub/modules/lxns/services/maimai_api_service.dart';

final maimaiSongByIdProvider = Provider.family<MaimaiSong?, int>((ref, songId) {
  return ref.watch(
    resourceProviderOf<List<MaimaiSong>>(
      maimaiSongListResourceKey,
    ).select((async) => async.value?.firstWhereOrNull((s) => s.id == songId)),
  );
});

final maimaiScoreByIdProvider = Provider.family<MaimaiScore?, int>((
  ref,
  songId,
) {
  return ref.watch(
    resourceProviderOf<List<MaimaiScore>>(maimaiScoreListResourceKey).select(
      (async) => async.value?.firstWhereOrNull((s) => s.songId == songId),
    ),
  );
});
