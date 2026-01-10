import 'beatmap_model.dart';

class BeatmapParser {
  Beatmap map = Beatmap();
  int _nline = 0;
  String _curline = '';
  String _lastpos = '';
  String _section = '';

  BeatmapParser();

  void reset() {
    map.reset();
    _nline = 0;
    _curline = '';
    _lastpos = '';
    _section = '';
  }

  BeatmapParser feed(String content) {
    final lines = content.split('\n');
    for (var line in lines) {
      _feedLine(line);
    }
    return this;
  }

  void _feedLine(String line) {
    _curline = _lastpos = line;
    _nline++;

    if (line.trim().isEmpty) return;
    if (line.startsWith(' ') || line.startsWith('_')) return;
    if (line.startsWith('//')) return;

    line = _curline = line.trim();

    if (line.startsWith('[')) {
      if (_section == 'Difficulty' && map.ar == -1) {
        map.ar = map.od;
      }
      _section = line.substring(1, line.length - 1);
      return;
    }

    switch (_section) {
      case 'Metadata':
        _metadata();
        break;
      case 'General':
        _general();
        break;
      case 'Events':
        _events();
        break;
      case 'Difficulty':
        _difficulty();
        break;
      case 'TimingPoints':
        _timingPoints();
        break;
      case 'HitObjects':
        _objects();
        break;
      default:
        int fmtpos = line.indexOf('file format v');
        if (fmtpos >= 0) {
          map.formatVersion = int.tryParse(line.substring(fmtpos + 13)) ?? 14;
        }
        break;
    }
  }

  String _setpos(String str) {
    _lastpos = str.trim();
    return _lastpos;
  }

  List<String> _property() {
    final s = _curline.split(':');
    if (s.length < 2) return [s[0], ''];
    s[0] = _setpos(s[0]);
    // Join the rest back in case the value contains ':'
    s[1] = _setpos(s.sublist(1).join(':'));
    return s;
  }

  void _metadata() {
    final p = _property();
    switch (p[0]) {
      case 'Title':
        map.title = p[1];
        break;
      case 'TitleUnicode':
        map.titleUnicode = p[1];
        break;
      case 'Artist':
        map.artist = p[1];
        break;
      case 'ArtistUnicode':
        map.artistUnicode = p[1];
        break;
      case 'Creator':
        map.creator = p[1];
        break;
      case 'Version':
        map.version = p[1];
        break;
    }
  }

  void _general() {
    final p = _property();
    if (p[0] == 'Mode') {
      map.mode = int.tryParse(p[1]) ?? 0;
    } else if (p[0] == 'AudioFilename') {
      map.audioFilename = p[1];
    }
  }

  void _events() {
    // Event format: eventType,startTime,eventParams
    // Background: 0,0,"bg.jpg",0,0
    if (_curline.startsWith('0,0,"')) {
      final parts = _curline.split(',');
      if (parts.length >= 3) {
        String filename = parts[2];
        if (filename.startsWith('"') && filename.endsWith('"')) {
          filename = filename.substring(1, filename.length - 1);
        }
        map.backgroundFilename = filename;
      }
    }
  }

  void _difficulty() {
    final p = _property();
    switch (p[0]) {
      case 'CircleSize':
        map.cs = double.tryParse(p[1]) ?? 5.0;
        break;
      case 'OverallDifficulty':
        map.od = double.tryParse(p[1]) ?? 5.0;
        break;
      case 'ApproachRate':
        map.ar = double.tryParse(p[1]) ?? 5.0;
        break;
      case 'HPDrainRate':
        map.hp = double.tryParse(p[1]) ?? 5.0;
        break;
      case 'SliderMultiplier':
        map.sv = double.tryParse(p[1]) ?? 1.4;
        break;
      case 'SliderTickRate':
        map.tickRate = double.tryParse(p[1]) ?? 1.0;
        break;
    }
  }

  void _timingPoints() {
    final s = _curline.split(',');
    if (s.length < 2) return;

    final t = TimingPoint(
      time: double.tryParse(_setpos(s[0])) ?? 0,
      msPerBeat: double.tryParse(_setpos(s[1])) ?? 600,
    );

    if (s.length >= 7) {
      t.change = (s[6].trim() != '0');
    }

    map.timingPoints.add(t);
  }

  void _objects() {
    final s = _curline.split(',');
    if (s.length < 4) return;

    final time = double.tryParse(_setpos(s[2])) ?? 0;
    final type = int.tryParse(_setpos(s[3])) ?? 0;

    final obj = HitObject(time: time, type: type);

    if ((type & HitObjectType.circle) != 0) {
      obj.data = CircleData(
        pos: [
          double.tryParse(_setpos(s[0])) ?? 0,
          double.tryParse(_setpos(s[1])) ?? 0,
        ],
      );
    } else if ((type & HitObjectType.spinner) != 0) {
      obj.data = SpinnerData(endTime: double.tryParse(_setpos(s[5])) ?? 0);
    } else if ((type & HitObjectType.slider) != 0) {
      if (s.length < 8) return;

      final pointsData = s[5].split('|');
      final curveType = pointsData[0];
      final points = pointsData.sublist(1).map((e) {
        final p = e.split(':');
        return [double.tryParse(p[0]) ?? 0, double.tryParse(p[1]) ?? 0];
      }).toList();

      obj.data = SliderData(
        pos: [
          double.tryParse(_setpos(s[0])) ?? 0,
          double.tryParse(_setpos(s[1])) ?? 0,
        ],
        repetitions: int.tryParse(_setpos(s[6])) ?? 1,
        distance: double.tryParse(_setpos(s[7])) ?? 0,
        type: curveType,
        points: points,
      );
    } else if ((type & HitObjectType.hold) != 0) {
      // Mania hold note
      obj.data = HoldData(
        pos: [
          double.tryParse(_setpos(s[0])) ?? 0,
          double.tryParse(_setpos(s[1])) ?? 0,
        ],
        endTime: double.tryParse(_setpos(s[5].split(':')[0])) ?? 0,
      );
    }

    map.objects.add(obj);
  }
}
