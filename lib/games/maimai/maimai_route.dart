import 'package:go_router/go_router.dart';
import 'package:rank_hub/games/maimai/views/song_detail_page.dart';

final maimaiRoute = [
  GoRoute(
    path: '/maimai/song/:songId',
    builder: (context, state) {
      final songId = int.tryParse(state.pathParameters['songId'] ?? '') ?? 0;
      return SongDetailPage(songId: songId);
    },
  ),
];
