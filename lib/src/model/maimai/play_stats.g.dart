// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_stats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayStatsAdapter extends TypeAdapter<PlayStats> {
  @override
  final int typeId = 70;

  @override
  PlayStats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayStats(
      stats: (fields[0] as Map).cast<DateTime, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, PlayStats obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.stats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayStatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
