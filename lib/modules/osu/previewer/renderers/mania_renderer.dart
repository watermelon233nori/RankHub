
import 'dart:math';
import 'package:flutter/material.dart';
import '../beatmap_model.dart';

class ManiaRenderer {
  final Beatmap beatmap;
  final List<HitObject> hitObjects;
  final List<TimingPoint> timingPoints;
  late double mainBPM;
  late int keyCount;

  // Constants
  static const double LANE_WIDTH = 30;
  static const double NOTE_HEIGHT = 15;
  static const double JUDGE_LINE_HEIGHT = 5;
  static const double NOTE_SPEED = 0.65;
  static const double HIT_POSITION = 384 - 20;
  static const double X_CENTER = 512 / 2;
  static const double LANE_SPACING = 1;

  static const Color COLOUR_1 = Colors.white;
  static const Color COLOUR_2 = Color(0xFFDC8DBA);
  static const Color COLOUR_S = Color(0xFFD5BC00);

  static const List<List<Color>> LANE_COLOURS = [
    [],
    [COLOUR_S],
    [COLOUR_1, COLOUR_1],
    [COLOUR_1, COLOUR_S, COLOUR_1],
    [COLOUR_1, COLOUR_2, COLOUR_2, COLOUR_1],
    [COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_1, COLOUR_2, COLOUR_1],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1],
    [COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_1],
    // Co-op
    [COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1, 
     COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1],
    [],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_1, COLOUR_2, COLOUR_1, 
     COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_1, COLOUR_2, COLOUR_1],
    [],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1,
     COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1],
    [],
    [COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1,
     COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S, COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_S],
    [],
    [COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_1,
     COLOUR_1, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_S, COLOUR_2, COLOUR_1, COLOUR_2, COLOUR_1],
  ];

  ManiaRenderer(this.beatmap) 
      : hitObjects = beatmap.objects,
        timingPoints = beatmap.timingPoints {
    keyCount = beatmap.cs.toInt();
    mainBPM = _getMainBPM(timingPoints, hitObjects);
  }

  double _getMainBPM(List<TimingPoint> timingPoints, List<HitObject> hitObjects) {
    // Note: hitObjects are processed in BeatmapProcessor, so endTime might be available, 
    // but here we just need last object time for duration calculation.
    // However, JS implementation uses raw timing points.
    
    // My BeatmapProcessor sorts timingPoints descending. 
    // But this algorithm expects ascending order to calculate durations between points.
    // So I need to sort them ascending here.
    final sortedPoints = List<TimingPoint>.from(timingPoints)
      ..sort((a, b) => a.time.compareTo(b.time));

    final bpms = <double, double>{};
    
    // Filter positive msPerBeat (uninherited points)
    final uninherited = sortedPoints.where((p) => p.msPerBeat > 0).toList();
    
    if (uninherited.isEmpty) return 60.0; // Default

    for (int i = 0; i < uninherited.length; i++) {
      final point = uninherited[i];
      double endTime = double.infinity;
      if (i + 1 < uninherited.length) {
        endTime = uninherited[i + 1].time;
      } else {
        endTime = hitObjects.isNotEmpty ? hitObjects.last.time : point.time;
      }
      
      final duration = max(0.0, endTime - point.time);
      final msPerBeat = point.msPerBeat;
      bpms[msPerBeat] = (bpms[msPerBeat] ?? 0) + duration;
    }
    
    double maxDuration = 0;
    double mainMsPerBeat = uninherited[0].msPerBeat;
    
    bpms.forEach((msPerBeat, duration) {
      if (duration > maxDuration) {
        maxDuration = duration;
        mainMsPerBeat = msPerBeat;
      }
    });
    
    return 60000 / mainMsPerBeat;
  }

  double _computeSVTimeOffset(double time, double objectTime, double mainBPM, List<TimingPoint> timingPoints) {
    // Need ascending timing points for this loop
    final sortedPoints = List<TimingPoint>.from(timingPoints)
      ..sort((a, b) => a.time.compareTo(b.time));
      
    double totalOffset = 0;
    double lastTime = 0;
    double currentBPM = 60000 / (sortedPoints.isNotEmpty ? sortedPoints[0].msPerBeat.abs() : 600); // Fail safe
    if (sortedPoints.isNotEmpty && sortedPoints[0].msPerBeat > 0) {
        currentBPM = 60000 / sortedPoints[0].msPerBeat;
    }
    
    double currentSV = 1;
    
    for (var point in sortedPoints) {
      if (point.time > objectTime) break;
      
      if (point.time > time) {
        final bpmFactor = currentBPM / mainBPM;
        totalOffset += bpmFactor * currentSV * (point.time - max(lastTime, time));
      }

      if (point.msPerBeat > 0) {
        currentBPM = 60000 / point.msPerBeat;
      } else {
        currentSV = -100 / point.msPerBeat;
      }

      lastTime = point.time;
    }

    if (lastTime < objectTime) {
      final bpmFactor = currentBPM / mainBPM;
      totalOffset += bpmFactor * currentSV * (objectTime - max(lastTime, time));
    }

    return totalOffset;
  }

  int _getLane(HitObject object, int keyCount) {
    final x = (object.data is HoldData) 
        ? (object.data as HoldData).pos[0] 
        : (object.data is CircleData ? (object.data as CircleData).pos[0] : 0);
    return (x * keyCount / 512).floor();
  }

  void render(Canvas canvas, Size size, double time) {
    // Filter visible objects (endTime > time)
    // In JS: hitObjects.filter((object) => object.endTime > time)
    // Optimisation: Binary search could be used, but filter is fine for now.
    
    final visibleObjects = hitObjects.where((object) => object.endTime > time);

    for (var object in visibleObjects) {
        if ((object.type & HitObjectType.hold) != 0) {
            _drawHoldNote(canvas, object, time);
        } else {
            _drawNote(canvas, object, time);
        }
    }
    
    // Draw judge line
    final xOffset = X_CENTER - LANE_WIDTH * keyCount / 2;
    final yOffset = HIT_POSITION;
    final paint = Paint()..color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(xOffset, yOffset, LANE_WIDTH * keyCount, JUDGE_LINE_HEIGHT), paint);
  }

  void _drawHoldNote(Canvas canvas, HitObject object, double time) {
      final lane = _getLane(object, keyCount);
      final startOffset = _computeSVTimeOffset(time, object.time, mainBPM, timingPoints);
      final holdOffset = _computeSVTimeOffset(max(time, object.time), object.endTime, mainBPM, timingPoints);
      
      final xOffset = (lane - keyCount / 2) * LANE_WIDTH + X_CENTER;
      final yOffset = HIT_POSITION - NOTE_SPEED * max(0, startOffset);
      final height = NOTE_SPEED * holdOffset;
      
      if (yOffset < -NOTE_HEIGHT - 64) return;
      
      final laneColours = keyCount < LANE_COLOURS.length ? LANE_COLOURS[keyCount] : [];
      final colour = (lane < laneColours.length) ? laneColours[lane] : COLOUR_1;
      
      final paint = Paint()..color = colour.withValues(alpha: 0.5); // 7f is approx 0.5
      // Note: height is positive in calculation but we draw upwards, so y decreases.
      // JS: ctx.fillRect(..., -height)
      // Rect.fromLTWH(left, top, width, height)
      // Top is yOffset, height is -height (upwards)
      // So rect is from yOffset - height to yOffset
      
      canvas.drawRect(
          Rect.fromLTWH(
              xOffset + LANE_SPACING, 
              yOffset - height, 
              LANE_WIDTH - 2 * LANE_SPACING, 
              height
          ), 
          paint
      );
      
      final headPaint = Paint()..color = colour;
      canvas.drawRect(
          Rect.fromLTWH(
              xOffset + LANE_SPACING, 
              yOffset - NOTE_HEIGHT, 
              LANE_WIDTH - 2 * LANE_SPACING, 
              NOTE_HEIGHT
          ), 
          headPaint
      );
  }

  void _drawNote(Canvas canvas, HitObject object, double time) {
      final lane = _getLane(object, keyCount);
      final totalOffset = _computeSVTimeOffset(time, object.time, mainBPM, timingPoints);
      
      final xOffset = (lane - keyCount / 2) * LANE_WIDTH + X_CENTER;
      final yOffset = HIT_POSITION - NOTE_SPEED * totalOffset;
      
      if (yOffset < -NOTE_HEIGHT - 64) return;
      
      final laneColours = keyCount < LANE_COLOURS.length ? LANE_COLOURS[keyCount] : [];
      final colour = (lane < laneColours.length) ? laneColours[lane] : COLOUR_1;
      
      final paint = Paint()..color = colour;
      canvas.drawRect(
          Rect.fromLTWH(
              xOffset + LANE_SPACING, 
              yOffset - NOTE_HEIGHT, 
              LANE_WIDTH - 2 * LANE_SPACING, 
              NOTE_HEIGHT
          ), 
          paint
      );
  }
}
