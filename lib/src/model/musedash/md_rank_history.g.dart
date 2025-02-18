// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_rank_history.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdRankHistoryAdapter extends TypeAdapter<MdRankHistory> {
  @override
  final int typeId = 32;

  @override
  MdRankHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdRankHistory(
      lastRank: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MdRankHistory obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lastRank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdRankHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
