import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../controllers/osu_preview_controller.dart';
import '../models/beatmap.dart';
import '../renderers/mania_renderer.dart';
import '../renderers/osu_renderer.dart';

class OsuPreviewPage extends StatefulWidget {
  const OsuPreviewPage({super.key});

  @override
  State<OsuPreviewPage> createState() => _OsuPreviewPageState();
}

class _OsuPreviewPageState extends State<OsuPreviewPage>
    with SingleTickerProviderStateMixin {
  late final OsuPreviewController controller;
  late final Ticker _ticker;
  Duration _frameTime = Duration.zero;

  Duration _lastKnownPosition = Duration.zero;
  DateTime _lastKnownTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    controller = Get.put(OsuPreviewController());

    // Subscribe to position updates for sync
    controller.onPositionChanged.listen((pos) {
      _lastKnownPosition = pos;
      _lastKnownTime = DateTime.now();
    });

    _ticker = createTicker((elapsed) {
      if (controller.isPlaying.value) {
        final now = DateTime.now();
        // Interpolate
        final estimatedPos =
            _lastKnownPosition + now.difference(_lastKnownTime);
        if (mounted) {
          setState(() {
            _frameTime = estimatedPos;
          });
        }
      }
    });

    // Listen to playing state to start/stop ticker
    ever(controller.isPlaying, (playing) {
      if (playing) {
        _ticker.start();
        _lastKnownTime = DateTime.now(); // Reset time base
        // Also maybe fetch current position immediately to sync?
        controller.getCurrentPosition().then((pos) {
          if (pos != null) {
            _lastKnownPosition = pos;
            _lastKnownTime = DateTime.now();
          }
        });
      } else {
        _ticker.stop();
      }
    });

    // Also listen to position changes from seek (manual update via controller.position)
    ever(controller.position, (pos) {
      if (!controller.isPlaying.value) {
        setState(() {
          _frameTime = pos;
          _lastKnownPosition = pos;
          _lastKnownTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('osu! Preview Debug')),
      body: Column(
        children: [
          _buildControls(),
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  color: Colors.black,
                  child: ClipRect(
                    child: Obx(() {
                      final beatmap = controller.beatmap.value;
                      if (beatmap == null) {
                        return const Center(
                          child: Text(
                            'Select a .osu or .osz file',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }

                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          // Background
                          if (controller.backgroundFile.value != null)
                            Image.file(
                              controller.backgroundFile.value!,
                              fit: BoxFit.cover,
                              color: Colors.black.withValues(alpha: 0.6),
                              colorBlendMode: BlendMode.darken,
                            ),

                          CustomPaint(
                            painter: OsuGamePainter(
                              beatmap: beatmap,
                              renderer: controller.renderer,
                              time: _frameTime.inMilliseconds.toDouble(),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ),
          _buildPlaybackControls(),
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: controller.pickBeatmap,
            child: const Text('Select .osu'),
          ),
          ElevatedButton(
            onPressed: controller.pickOsz,
            child: const Text('Select .osz'),
          ),
          ElevatedButton(
            onPressed: controller.pickAudio,
            child: const Text('Select Audio'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaybackControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[900],
      child: Column(
        children: [
          Obx(
            () => Text(
              controller.beatmap.value != null
                  ? '${controller.beatmap.value!.artist} - ${controller.beatmap.value!.title} [${controller.beatmap.value!.version}]'
                  : 'No beatmap loaded',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Row(
            children: [
              Obx(
                () => IconButton(
                  icon: Icon(
                    controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: controller.togglePlay,
                ),
              ),
              Expanded(
                child: Obx(() {
                  final max = controller.duration.value.inMilliseconds
                      .toDouble();
                  final current = controller.position.value.inMilliseconds
                      .toDouble();
                  return Slider(
                    value: current.clamp(0.0, max > 0 ? max : 0.0),
                    max: max > 0 ? max : 1.0,
                    onChanged: (value) {
                      controller.seek(value);
                      setState(() {
                        _frameTime = Duration(milliseconds: value.toInt());
                      });
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OsuGamePainter extends CustomPainter {
  final Beatmap beatmap;
  final dynamic renderer;
  final double time;

  OsuGamePainter({required this.beatmap, this.renderer, required this.time});

  @override
  void paint(Canvas canvas, Size size) {
    // osu! resolution is 512x384
    final scaleX = size.width / 512;
    final scaleY = size.height / 384;
    final scale = scaleX < scaleY ? scaleX : scaleY; // fit contain

    // Center it
    final translateX = (size.width - 512 * scale) / 2;
    final translateY = (size.height - 384 * scale) / 2;

    canvas.translate(translateX, translateY);
    canvas.scale(scale);

    // Clip to 512x384 area to avoid drawing outside
    canvas.clipRect(const Rect.fromLTWH(0, 0, 512, 384));

    // Draw background/border
    final borderPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawRect(const Rect.fromLTWH(0, 0, 512, 384), borderPaint);

    // Delegate to specific renderer
    if (renderer != null) {
      if (renderer is OsuRenderer) {
        (renderer as OsuRenderer).render(canvas, size, time);
      } else if (renderer is ManiaRenderer) {
        (renderer as ManiaRenderer).render(canvas, size, time);
      }
    } else {
      // Draw unsupported text
      const textStyle = TextStyle(color: Colors.white, fontSize: 20);
      final textSpan = TextSpan(
        text: 'Unsupported Mode: ${beatmap.mode}',
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset((512 - textPainter.width) / 2, (384 - textPainter.height) / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant OsuGamePainter oldDelegate) {
    return oldDelegate.time != time ||
        oldDelegate.beatmap != beatmap ||
        oldDelegate.renderer != renderer;
  }
}
