import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'beatmap_model.dart';
import 'beatmap_parser.dart';
import 'beatmap_processor.dart';
import 'renderers/osu_renderer.dart';
import 'renderers/mania_renderer.dart';

class OsuPreviewController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();

  final beatmap = Rxn<Beatmap>();
  final audioFile = Rxn<File>();
  final backgroundFile = Rxn<File>();

  final isPlaying = false.obs;
  final duration = Duration.zero.obs;
  final position = Duration.zero.obs;

  dynamic renderer;

  BeatmapParser? _parser;
  String? _tempUnzipPath;

  @override
  void onInit() {
    super.onInit();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      isPlaying.value = state == PlayerState.playing;
    });
    _audioPlayer.onDurationChanged.listen((d) {
      duration.value = d;
    });
    _audioPlayer.onPositionChanged.listen((p) {
      if ((p - position.value).abs() > const Duration(milliseconds: 100)) {
        position.value = p;
      }
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      isPlaying.value = false;
      position.value = duration.value;
    });
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    _cleanupTemp();
    super.onClose();
  }

  void _cleanupTemp() {
    if (_tempUnzipPath != null) {
      try {
        final dir = Directory(_tempUnzipPath!);
        if (dir.existsSync()) {
          dir.deleteSync(recursive: true);
        }
      } catch (e) {
        debugPrint('Failed to cleanup temp dir: $e');
      }
    }
  }

  Future<void> startPreview(File oszFile, {String? targetDiffName, String? bgFilename, String? audioFilename}) async {
    await _processOszFile(oszFile, targetDiffName: targetDiffName, bgFilename: bgFilename, audioFilename: audioFilename);
  }

  Future<void> _processOszFile(File oszFile, {String? targetDiffName, String? bgFilename, String? audioFilename}) async {
    try {
      // 1. Unzip
      final bytes = await oszFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);

      final tempDir = await getTemporaryDirectory();
      final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
      final extractPath = path.join(tempDir.path, 'osu_preview_$uniqueId');
      _tempUnzipPath = extractPath;

      await Directory(extractPath).create(recursive: true);

      for (final file in archive) {
        final filename = file.name;
        if (file.isFile) {
          final data = file.content as List<int>;
          final fileOut = File(path.join(extractPath, filename));
          await fileOut.create(recursive: true);
          await fileOut.writeAsBytes(data);
        }
      }

      // 2. Find .osu files
      final dir = Directory(extractPath);
      final files = dir.listSync();
      final osuFiles = files
          .where((f) => f.path.toLowerCase().endsWith('.osu'))
          .toList();

      if (osuFiles.isEmpty) {
        Get.snackbar('Error', 'No .osu files found in archive');
        return;
      }

      // 3. Select Difficulty
      File? selectedFile;

      if (targetDiffName != null) {
        // Try to match difficulty name exactly or partially
        // osu file format: Artist - Title (Creator) [Difficulty].osu
        // We look for [Difficulty]
        selectedFile = osuFiles.firstWhereOrNull((f) {
           final filename = path.basename(f.path);
           // Simple check: does filename contain the version?
           // The version string usually appears in [] at the end.
           // But user provided targetDiffName might be just the version string.
           return filename.contains('[$targetDiffName]');
        }) as File?;
      }

      if (selectedFile == null) {
        // Fallback: sort by size and pick the largest (usually hardest) or show dialog if we were in debug mode
        // But here we must pick one. Let's pick the one that matches targetDiffName loosely if possible
        if (targetDiffName != null) {
             selectedFile = osuFiles.firstWhereOrNull((f) {
                return path.basename(f.path).contains(targetDiffName);
             }) as File?;
        }
      }

      // If still null, just pick the first one or the one with most objects (largest size)
      if (selectedFile == null) {
         osuFiles.sort(
            (a, b) => (b as File).lengthSync().compareTo((a as File).lengthSync()), // Largest first
          );
         selectedFile = osuFiles.first as File;
      }

      await _loadOsuFromExtract(selectedFile, bgFilename: bgFilename, audioFilename: audioFilename);

    } catch (e) {
      Get.snackbar('Error', 'Failed to process osz: $e');
      debugPrint(e.toString());
    }
  }

  Future<void> _loadOsuFromExtract(File osuFile, {String? bgFilename, String? audioFilename}) async {
    await loadBeatmap(osuFile);

    if (beatmap.value != null && _tempUnzipPath != null) {
      final map = beatmap.value!;

      // Audio
      String? audioToLoad = audioFilename;
      if (audioToLoad == null || audioToLoad.isEmpty) {
        audioToLoad = map.audioFilename;
      }
      
      if (audioToLoad.isNotEmpty) {
        final audioPath = path.join(_tempUnzipPath!, audioToLoad);
        final file = File(audioPath);
        if (file.existsSync()) {
          audioFile.value = file;
          await _audioPlayer.setSourceDeviceFile(file.path);
        } else {
          _searchAndLoadAudio();
        }
      } else {
        _searchAndLoadAudio();
      }

      // Background
      String? bgToLoad = bgFilename;
      if (bgToLoad == null || bgToLoad.isEmpty) {
         bgToLoad = map.backgroundFilename;
      }

      if (bgToLoad.isNotEmpty) {
        final bgPath = path.join(_tempUnzipPath!, bgToLoad);
        final file = File(bgPath);
        if (file.existsSync()) {
          backgroundFile.value = file;
        } else {
          _searchAndLoadBg();
        }
      } else {
        _searchAndLoadBg();
      }
    }
  }

  void _searchAndLoadAudio() {
    if (_tempUnzipPath == null) return;
    final dir = Directory(_tempUnzipPath!);
    try {
      final files = dir.listSync();
      final audio = files.firstWhereOrNull((f) {
        final ext = path.extension(f.path).toLowerCase();
        return ['.mp3', '.ogg', '.wav'].contains(ext);
      });

      if (audio != null) {
        final file = File(audio.path);
        audioFile.value = file;
        _audioPlayer.setSourceDeviceFile(file.path);
      }
    } catch (e) {
      debugPrint('Audio search failed: $e');
    }
  }

  void _searchAndLoadBg() {
    if (_tempUnzipPath == null) return;
    final dir = Directory(_tempUnzipPath!);
    try {
      final files = dir.listSync();
      final images = files.where((f) {
        final ext = path.extension(f.path).toLowerCase();
        return ['.jpg', '.jpeg', '.png'].contains(ext);
      }).toList();

      if (images.isNotEmpty) {
        final best =
            images.firstWhereOrNull(
              (f) => path.basename(f.path).toLowerCase().contains('bg'),
            ) ??
            images.first;

        backgroundFile.value = File(best.path);
      }
    } catch (e) {
      debugPrint('BG search failed: $e');
    }
  }

  Future<void> loadBeatmap(File file) async {
    try {
      final content = await file.readAsString();
      _parser = BeatmapParser();
      _parser!.feed(content);

      final newBeatmap = _parser!.map;
      BeatmapProcessor.process(newBeatmap);

      if (newBeatmap.mode == 0) {
        renderer = OsuRenderer(newBeatmap);
      } else if (newBeatmap.mode == 3) {
        renderer = ManiaRenderer(newBeatmap);
      } else {
        renderer = null;
      }

      beatmap.value = newBeatmap;
    } catch (e) {
      Get.snackbar('Error', 'Failed to parse beatmap: $e');
    }
  }

  void togglePlay() async {
    if (beatmap.value == null) {
      return;
    }

    if (audioFile.value == null) {
      return;
    }

    if (isPlaying.value) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(DeviceFileSource(audioFile.value!.path));
    }
  }

  void seek(double value) {
    final newPos = Duration(milliseconds: value.toInt());
    _audioPlayer.seek(newPos);
    position.value = newPos;
  }

  Future<Duration?> getCurrentPosition() async {
    return await _audioPlayer.getCurrentPosition();
  }

  Stream<Duration> get onPositionChanged => _audioPlayer.onPositionChanged;
}
