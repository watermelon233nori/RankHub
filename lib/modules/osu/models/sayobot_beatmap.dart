class SayobotListResponse {
  final List<SayobotBeatmap> data;
  final int endid;
  final int status;
  final int results;

  SayobotListResponse({
    required this.data,
    required this.endid,
    required this.status,
    required this.results,
  });

  factory SayobotListResponse.fromJson(Map<String, dynamic> json) {
    return SayobotListResponse(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => SayobotBeatmap.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      endid: json['endid'] as int? ?? 0,
      status: json['status'] as int? ?? 0,
      results: json['results'] as int? ?? 0,
    );
  }
}

class SayobotBeatmap {
  final int sid;
  final String title;
  final String titleU;
  final String artist;
  final String artistU;
  final String creator;
  final int approved;
  final int modes;
  final int lastUpdate;
  final int playCount;
  final int favouriteCount;

  SayobotBeatmap({
    required this.sid,
    required this.title,
    required this.titleU,
    required this.artist,
    required this.artistU,
    required this.creator,
    required this.approved,
    required this.modes,
    required this.lastUpdate,
    required this.playCount,
    required this.favouriteCount,
  });

  factory SayobotBeatmap.fromJson(Map<String, dynamic> json) {
    return SayobotBeatmap(
      sid: json['sid'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      titleU: json['titleU'] as String? ?? '',
      artist: json['artist'] as String? ?? '',
      artistU: json['artistU'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      approved: json['approved'] as int? ?? 0,
      modes: json['modes'] as int? ?? 0,
      lastUpdate: json['lastupdate'] as int? ?? 0,
      playCount: json['play_count'] as int? ?? 0,
      favouriteCount: json['favourite_count'] as int? ?? 0,
    );
  }

  String get preferredTitle => titleU.isNotEmpty ? titleU : title;
  String get preferredArtist => artistU.isNotEmpty ? artistU : artist;

  String get coverUrl => 'https://cdn.sayobot.cn:25225/beatmaps/$sid/covers/cover.jpg';
  String get previewUrl => 'https://cdn.sayobot.cn:25225/preview/$sid.mp3';
  String get downloadUrl => 'https://dl.sayobot.cn/beatmaps/download/full/$sid';
}
