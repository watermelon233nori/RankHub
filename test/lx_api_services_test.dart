import 'package:flutter_test/flutter_test.dart';
import 'package:rank_hub/src/services/lx_api_services.dart';
import 'package:rank_hub/src/features/lx_mai/data/model/song_score.dart';

void main() {
  group('LxApiService', () {
    test('getRecentRecords returns list of SongScore', () async {
      const friendCode = '305600065184384';

      final result = await LxApiService.getRecentRecords(friendCode);

      expect(result, isA<List<SongScore>>());
      expect(result.isNotEmpty, true);
    });
  });
}
