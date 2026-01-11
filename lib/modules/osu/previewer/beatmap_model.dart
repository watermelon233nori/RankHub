import 'dart:math';

class Beatmap {
  String artist = '';
  String artistUnicode = '';
  String title = '';
  String titleUnicode = '';
  String creator = '';
  String version = '';
  int mode = 0;

  String audioFilename = '';
  String backgroundFilename = '';

  // Difficulty
  double cs = 5.0;
  double od = 5.0;
  double ar = -1;
  double hp = 5.0;
  double sv = 1.4;
  double tickRate = 1.0;

  List<HitObject> objects = [];
  List<TimingPoint> timingPoints = [];
  int formatVersion = 14;

  void reset() {
    artist = '';
    artistUnicode = '';
    title = '';
    titleUnicode = '';
    creator = '';
    version = '';
    mode = 0;
    audioFilename = '';
    backgroundFilename = '';
    cs = 5.0;
    od = 5.0;
    ar = -1;
    hp = 5.0;
    sv = 1.4;
    tickRate = 1.0;
    objects = [];
    timingPoints = [];
    formatVersion = 14;
  }

  int get ncircles =>
      objects.where((o) => (o.type & HitObjectType.circle) != 0).length;
  int get nsliders =>
      objects.where((o) => (o.type & HitObjectType.slider) != 0).length;
  int get nspinners =>
      objects.where((o) => (o.type & HitObjectType.spinner) != 0).length;

  int maxCombo() {
    int res = ncircles + nspinners;
    int tindex = -1;
    double tnext = double.negativeInfinity;
    double pxPerBeat = 0.0;

    for (var obj in objects) {
      if ((obj.type & HitObjectType.slider) == 0) {
        continue;
      }

      while (obj.time >= tnext) {
        tindex++;
        if (timingPoints.length > tindex + 1) {
          tnext = timingPoints[tindex + 1].time;
        } else {
          tnext = double.infinity;
        }

        var t = timingPoints[tindex];
        double svMultiplier = 1.0;
        if (!t.change && t.msPerBeat < 0) {
          svMultiplier = -100.0 / t.msPerBeat;
        }

        if (formatVersion < 8) {
          pxPerBeat = sv * 100.0;
        } else {
          pxPerBeat = sv * 100.0 * svMultiplier;
        }
      }

      final data = obj.data as SliderData;
      double numBeats = (data.distance * data.repetitions) / pxPerBeat;

      int ticks = ((numBeats - 0.1) / data.repetitions * tickRate).ceil();
      ticks--;
      ticks *= data.repetitions;
      ticks += data.repetitions + 1;

      res += max(0, ticks);
    }
    return res;
  }
}

class TimingPoint {
  double time;
  double msPerBeat;
  bool change;

  TimingPoint({
    required this.time,
    required this.msPerBeat,
    this.change = true,
  });
}

class HitObject {
  double time;
  int type;
  dynamic data; // Can be CircleData, SliderData, SpinnerData

  // Calculated properties
  double duration = 0;
  double endTime = 0;
  List<double> endPos = [0, 0];
  int comboCount = 0;
  int comboNumber = 0;

  HitObject({required this.time, required this.type, this.data});
}

class HitObjectType {
  static const int circle = 1;
  static const int slider = 2;
  static const int newCombo = 4;
  static const int spinner = 8;
  static const int hold = 128;
}

class CircleData {
  List<double> pos;
  CircleData({required this.pos});
}

class SliderData {
  List<double> pos;
  int repetitions;
  double distance;
  List<List<double>> points;
  String type; // 'L', 'B', 'P', 'C'

  SliderData({
    required this.pos,
    required this.repetitions,
    required this.distance,
    required this.points,
    required this.type,
  });
}

class SpinnerData {
  double endTime;
  SpinnerData({required this.endTime});
}

class HoldData {
  List<double> pos;
  double endTime;
  HoldData({required this.pos, required this.endTime});
}
