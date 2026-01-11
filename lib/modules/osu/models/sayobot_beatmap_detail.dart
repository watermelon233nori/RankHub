import 'package:rank_hub/modules/osu/models/sayobot_beatmap.dart';

class SayobotBeatmapDetail {
  final int sid;
  final String title;
  final String titleU;
  final String artist;
  final String artistU;
  final String creator;
  final int creatorId;
  final String source;
  final int approved;
  final int lastUpdate;
  final int approvedDate;
  final double bpm;
  final int favouriteCount;
  final int video;
  final int storyboard;
  final int preview;
  final String tags;
  final int language;
  final int genre;
  final int bidsAmount;
  final List<SayobotBeatmapDifficulty> bidData;

  SayobotBeatmapDetail({
    required this.sid,
    required this.title,
    required this.titleU,
    required this.artist,
    required this.artistU,
    required this.creator,
    required this.creatorId,
    required this.source,
    required this.approved,
    required this.lastUpdate,
    required this.approvedDate,
    required this.bpm,
    required this.favouriteCount,
    required this.video,
    required this.storyboard,
    required this.preview,
    required this.tags,
    required this.language,
    required this.genre,
    required this.bidsAmount,
    required this.bidData,
  });

  factory SayobotBeatmapDetail.fromJson(Map<String, dynamic> json) {
    if (json['data'] == null) {
      throw Exception('Response "data" is null');
    }
    final data = json['data'];
    if (data is! Map<String, dynamic>) {
      throw Exception(
        'Response "data" is not a Map: ${data.runtimeType}, Content: $data',
      );
    }

    try {
      return SayobotBeatmapDetail(
        sid: data['sid'] as int? ?? 0,
        title: data['title'] as String? ?? '',
        titleU: data['titleU'] as String? ?? '',
        artist: data['artist'] as String? ?? '',
        artistU: data['artistU'] as String? ?? '',
        creator: data['creator'] as String? ?? '',
        creatorId: data['creator_id'] as int? ?? 0,
        source: data['source'] as String? ?? '',
        approved: data['approved'] as int? ?? 0,
        lastUpdate: data['last_update'] as int? ?? 0,
        approvedDate: data['approved_date'] as int? ?? 0,
        bpm: (data['bpm'] as num?)?.toDouble() ?? 0.0,
        favouriteCount: data['favourite_count'] as int? ?? 0,
        video: data['video'] as int? ?? 0,
        storyboard: data['storyboard'] as int? ?? 0,
        preview: data['preview'] as int? ?? 0,
        tags: data['tags'] as String? ?? '',
        language: data['language'] as int? ?? 0,
        genre: data['genre'] is int
            ? data['genre'] as int
            : int.tryParse(data['genre'].toString()) ?? 0,
        bidsAmount: data['bids_amount'] as int? ?? 0,
        bidData:
            (data['bid_data'] as List<dynamic>?)?.map((e) {
              try {
                return SayobotBeatmapDifficulty.fromJson(
                  e as Map<String, dynamic>,
                );
              } catch (e) {
                print('❌ Error parsing difficulty: $e');
                print('📄 Difficulty content: $e');
                rethrow;
              }
            }).toList() ??
            [],
      );
    } catch (e) {
      print('❌ Error parsing SayobotBeatmapDetail fields: $e');
      rethrow;
    }
  }

  String get preferredTitle => titleU.isNotEmpty ? titleU : title;
  String get preferredArtist => artistU.isNotEmpty ? artistU : artist;

  String get coverUrl =>
      'https://cdn.sayobot.cn:25225/beatmaps/$sid/covers/cover.jpg';
}

class SayobotBeatmapDifficulty {
  final int bid;
  final int mode; // 0=osu! 1=taiko 2=catch 3=mania

  final String version;
  final int length;
  final double cs;
  final double ar;
  final double od;
  final double hp;
  final double star;
  final double aim;
  final double speed;
  final int circles;
  final int sliders;
  final int spinners;
  final int maxCombo;
  final int playCount;
  final int passCount;
  final double pp;
  final double ppAim;
  final double ppSpeed;
  final double ppAcc;
  final String audio;
  final String bg;

  SayobotBeatmapDifficulty({
    required this.bid,
    required this.mode,
    required this.version,
    required this.length,
    required this.cs,
    required this.ar,
    required this.od,
    required this.hp,
    required this.star,
    required this.aim,
    required this.speed,
    required this.circles,
    required this.sliders,
    required this.spinners,
    required this.maxCombo,
    required this.playCount,
    required this.passCount,
    required this.pp,
    required this.ppAim,
    required this.ppSpeed,
    required this.ppAcc,
    required this.audio,
    required this.bg,
  });

  factory SayobotBeatmapDifficulty.fromJson(Map<String, dynamic> json) {
    return SayobotBeatmapDifficulty(
      bid: json['bid'] as int? ?? 0,
      mode: json['mode'] as int? ?? 0,
      version: json['version'] as String? ?? '',
      length: json['length'] as int? ?? 0,
      cs: (json['CS'] as num?)?.toDouble() ?? 0.0,
      ar: (json['AR'] as num?)?.toDouble() ?? 0.0,
      od: (json['OD'] as num?)?.toDouble() ?? 0.0,
      hp: (json['HP'] as num?)?.toDouble() ?? 0.0,
      star: (json['star'] as num?)?.toDouble() ?? 0.0,
      aim: (json['aim'] as num?)?.toDouble() ?? 0.0,
      speed: (json['speed'] as num?)?.toDouble() ?? 0.0,
      circles: json['circles'] as int? ?? 0,
      sliders: json['sliders'] as int? ?? 0,
      spinners: json['spinners'] as int? ?? 0,
      maxCombo: json['maxcombo'] as int? ?? 0,
      playCount: json['playcount'] as int? ?? 0,
      passCount: json['passcount'] as int? ?? 0,
      pp: (json['pp'] as num?)?.toDouble() ?? 0.0,
      ppAim: (json['pp_aim'] as num?)?.toDouble() ?? 0.0,
      ppSpeed: (json['pp_speed'] as num?)?.toDouble() ?? 0.0,
      ppAcc: (json['pp_acc'] as num?)?.toDouble() ?? 0.0,
      audio: json['audio'] as String? ?? '',
      bg: json['bg'] as String? ?? '',
    );
  }
}
