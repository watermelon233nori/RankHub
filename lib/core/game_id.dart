import 'package:flutter/material.dart';

@immutable
class GameId {
  final String name;
  final String version;
  final String platform;
  final String region;

  const GameId({
    required this.name,
    required this.version,
    required this.platform,
    required this.region,
  });

  String get value => '$name-$version-$platform-$region'.replaceAll('.', '_');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameId &&
        other.name == name &&
        other.version == version &&
        other.platform == platform &&
        other.region == region;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        version.hashCode ^
        platform.hashCode ^
        region.hashCode;
  }

  @override
  String toString() {
    return value;
  }
}
