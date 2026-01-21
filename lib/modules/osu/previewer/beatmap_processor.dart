
import 'beatmap_model.dart';

class BeatmapProcessor {
  static void process(Beatmap beatmap) {
    _processTimingPoints(beatmap.timingPoints);
    _processHitObjects(beatmap.objects, beatmap.timingPoints, beatmap.sv);
    _processCombo(beatmap);
  }

  static void _processTimingPoints(List<TimingPoint> timingPoints) {
    if (timingPoints.isEmpty) return;
    
    final firstPoint = timingPoints[0];
    firstPoint.time = 0;
    double msPerBeat = firstPoint.msPerBeat;
    
    for (var point in timingPoints) {
      if (point.msPerBeat < 0) {
        point.msPerBeat = msPerBeat * point.msPerBeat / -100;
      } else {
        msPerBeat = point.msPerBeat;
      }
    }
    // Sort descending to make finding the active point easier (first one <= time)
    timingPoints.sort((a, b) => b.time.compareTo(a.time));
  }

  static void _processHitObjects(List<HitObject> hitObjects, List<TimingPoint> timingPoints, double sv) {
    for (var object in hitObjects) {
      if ((object.type & HitObjectType.slider) != 0) {
        TimingPoint? tPoint;
        // Find the timing point active at object.time (timingPoints are sorted descending)
        for (var tp in timingPoints) {
          if (tp.time <= object.time) {
            tPoint = tp;
            break;
          }
        }
        // Fallback
        tPoint ??= timingPoints.isNotEmpty ? timingPoints.last : TimingPoint(time: 0, msPerBeat: 600);

        final beatDuration = tPoint.msPerBeat;
        final data = object.data as SliderData;
        final duration = data.distance / (100.0 * sv) * beatDuration;
        
        object.duration = duration;
        object.endTime = object.time + duration * data.repetitions;
      } else if ((object.type & HitObjectType.spinner) != 0) {
        final data = object.data as SpinnerData;
        object.endTime = data.endTime;
        object.endPos = [512 / 2, 384 / 2];
      } else if ((object.type & HitObjectType.hold) != 0) {
         final data = object.data as HoldData;
         object.endTime = data.endTime;
         object.endPos = data.pos; // Mania hold
      } else {
        object.endTime = object.time;
        if (object.data is CircleData) {
            object.endPos = (object.data as CircleData).pos;
        }
      }
    }
  }

  static void _processCombo(Beatmap beatmap) {
    // Osu specific combo processing
    // Note: Colors are usually hardcoded or from skin. 
    // Reference implementation uses a fixed list of colors.
    
    int comboNumber = 0;
    int comboCount = 1;
    // We assume default combo colors count is 4 for now, matching reference
    const int comboColorsCount = 4;

    for (var object in beatmap.objects) {
      comboCount++;
      if ((object.type & HitObjectType.newCombo) != 0) {
        comboCount = 1;
        comboNumber = (comboNumber + 1) % comboColorsCount;
      }
      object.comboCount = comboCount;
      object.comboNumber = comboNumber;
    }
  }
}
