import 'package:dio/dio.dart';
import 'package:rank_hub/models/musedash/musedash_album.dart';
import 'package:rank_hub/models/musedash/musedash_music.dart';
import 'package:rank_hub/modules/musedash/services/musedash_isar_service.dart';

/// MuseDash API 服务（曲库部分）
class MuseDashMusicApiService {
  static final MuseDashMusicApiService _instance =
      MuseDashMusicApiService._internal();
  factory MuseDashMusicApiService() => _instance;
  static MuseDashMusicApiService get instance => _instance;

  MuseDashMusicApiService._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.musedash.moe',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  final _isarService = MuseDashIsarService.instance;

  /// 获取所有专辑数据
  Future<Map<String, dynamic>> fetchAlbums() async {
    try {
      final response = await _dio.get('/albums');

      if (response.statusCode == 200 && response.data != null) {
        return response.data as Map<String, dynamic>;
      }

      throw Exception('获取专辑数据失败: ${response.statusCode}');
    } catch (e) {
      print('❌ 获取专辑数据失败: $e');
      rethrow;
    }
  }

  /// 同步专辑和音乐数据到数据库
  Future<void> syncAlbumsToDatabase({
    required Function(int current, int total, String description) onProgress,
  }) async {
    try {
      print('📥 开始同步专辑和音乐数据...');

      onProgress(0, 100, '正在获取专辑数据...');

      // 获取专辑数据
      final albumsData = await fetchAlbums();

      // 解析专辑和音乐
      final albums = <MuseDashAlbum>[];
      final musicList = <MuseDashMusic>[];

      final totalAlbums = albumsData.length;
      var processedAlbums = 0;

      for (final entry in albumsData.entries) {
        final albumUid = entry.key;
        final albumJson = entry.value as Map<String, dynamic>;

        // 创建专辑对象
        final album = MuseDashAlbum.fromJson(albumUid, albumJson);
        albums.add(album);

        // 解析专辑中的音乐
        if (albumJson['music'] != null) {
          final musicMap = albumJson['music'] as Map<String, dynamic>;

          for (final musicEntry in musicMap.entries) {
            final musicUid = musicEntry.key;
            final musicJson = musicEntry.value as Map<String, dynamic>;

            final music = MuseDashMusic.fromJson(musicUid, albumUid, musicJson);
            musicList.add(music);
          }
        }

        processedAlbums++;
        final progress = (processedAlbums / totalAlbums * 50).round();
        onProgress(progress, 100, '正在解析专辑数据: $processedAlbums/$totalAlbums');
      }

      print('📊 解析完成: ${albums.length} 个专辑, ${musicList.length} 首音乐');

      // 保存到数据库
      onProgress(50, 100, '正在保存专辑数据...');
      await _isarService.saveAlbums(albums);

      onProgress(75, 100, '正在保存音乐数据...');
      await _isarService.saveMusic(musicList);

      onProgress(100, 100, '同步完成');

      print('✅ 专辑和音乐数据同步完成');
    } catch (e) {
      print('❌ 同步专辑数据失败: $e');
      rethrow;
    }
  }

  /// 检查数据是否需要更新
  Future<bool> needsUpdate() async {
    try {
      final albumCount = await _isarService.getAlbumCount();
      final musicCount = await _isarService.getMusicCount();

      // 如果数据库为空，需要更新
      if (albumCount == 0 || musicCount == 0) {
        return true;
      }

      // 可以在这里添加版本检查逻辑
      return false;
    } catch (e) {
      return true;
    }
  }
}
