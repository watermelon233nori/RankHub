import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:archive/archive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '../models/beatmap.dart';
import '../services/beatmap_parser.dart';
import '../services/beatmap_processor.dart';
import '../renderers/osu_renderer.dart';
import '../renderers/mania_renderer.dart';

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
      // We might not want to update this too often for UI if we use Ticker for smooth animation
      // But it's good for slider
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

  Future<void> pickOsz() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final filePath = result.files.single.path!;
      if (!filePath.toLowerCase().endsWith('.osz') &&
          !filePath.toLowerCase().endsWith('.zip')) {
        Get.snackbar('Error', 'Please select an .osz or .zip file');
        return;
      }

      await _processOszFile(File(filePath));
    }
  }

  Future<void> _processOszFile(File oszFile) async {
    try {
      Get.dialog(
        const Center(child: CircularProgressIndicator()),
        barrierDismissible: false,
      );

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
          File(path.join(extractPath, filename))
            ..createSync(recursive: true)
            ..writeAsBytesSync(data);
        }
      }

      Get.back(); // Close loading

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

      // 3. Sort and Select Difficulty
      // "按文件大小顺序从低到高排序"
      osuFiles.sort(
        (a, b) => (a as File).lengthSync().compareTo((b as File).lengthSync()),
      );

      await _showDifficultySelectionDialog(osuFiles);
    } catch (e) {
      if (Get.isDialogOpen ?? false) Get.back();
      Get.snackbar('Error', 'Failed to process osz: $e');
    }
  }

  Future<void> _showDifficultySelectionDialog(
    List<FileSystemEntity> osuFiles,
  ) async {
    await Get.dialog(
      AlertDialog(
        title: const Text('Select Difficulty'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: osuFiles.length,
            itemBuilder: (context, index) {
              final file = osuFiles[index] as File;
              final filename = path.basename(file.path);
              // Extract difficulty name: [DifficultyName].osu
              String diffName = filename;
              final match = RegExp(r'\[(.*?)\]\.osu$').firstMatch(filename);
              if (match != null) {
                diffName = match.group(1) ?? filename;
              }

              final size = (file.lengthSync() / 1024).toStringAsFixed(1);

              return ListTile(
                title: Text(diffName),
                subtitle: Text('Size: ${size}KB'),
                onTap: () {
                  Get.back();
                  _loadOsuFromExtract(file);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        ],
      ),
    );
  }

  Future<void> _loadOsuFromExtract(File osuFile) async {
    await loadBeatmap(osuFile);

    // 4. Load Audio & Background
    if (beatmap.value != null && _tempUnzipPath != null) {
      final map = beatmap.value!;

      // Audio
      if (map.audioFilename.isNotEmpty) {
        final audioPath = path.join(_tempUnzipPath!, map.audioFilename);
        final file = File(audioPath);
        if (file.existsSync()) {
          audioFile.value = file;
          await _audioPlayer.setSourceDeviceFile(file.path);
        } else {
          // Fallback generic search
          _searchAndLoadAudio();
        }
      } else {
        _searchAndLoadAudio();
      }

      // Background
      if (map.backgroundFilename.isNotEmpty) {
        final bgPath = path.join(_tempUnzipPath!, map.backgroundFilename);
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
      // Filter for images, prioritize bg.jpg/png if multiple
      final images = files.where((f) {
        final ext = path.extension(f.path).toLowerCase();
        return ['.jpg', '.jpeg', '.png'].contains(ext);
      }).toList();

      if (images.isNotEmpty) {
        // Prefer "bg" in name
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

  Future<void> pickBeatmap() async {
    // On iOS, using FileType.custom with 'osu' extension might fail because it's not a standard UTI.
    // We use FileType.any and manually check the extension.
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final path = result.files.single.path!;
      if (!path.toLowerCase().endsWith('.osu')) {
        Get.snackbar('Error', 'Please select a .osu file');
        return;
      }
      final file = File(path);
      await loadBeatmap(file);
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

      // Reset audio if new map
      // But user might want to reuse audio? No, usually map specific.
      // But requirement says "select beatmap then select audio".
    } catch (e) {
      Get.snackbar('Error', 'Failed to parse beatmap: $e');
    }
  }

  Future<void> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      final path = result.files.single.path!;
      final ext = path.split('.').last.toLowerCase();
      if (!['mp3', 'ogg', 'wav', 'm4a', 'aac'].contains(ext)) {
        Get.snackbar(
          'Error',
          'Please select an audio file (mp3, ogg, wav, m4a)',
        );
        return;
      }

      final file = File(path);
      audioFile.value = file;
      await _audioPlayer.setSourceDeviceFile(file.path);
    }
  }

  void togglePlay() async {
    if (beatmap.value == null) {
      Get.snackbar('Tip', 'Please select a beatmap first');
      return;
    }

    if (audioFile.value == null) {
      Get.snackbar('Tip', 'Please select an audio file');
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
