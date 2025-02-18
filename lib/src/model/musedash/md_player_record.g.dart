// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_player_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdPlayerRecordAdapter extends TypeAdapter<MdPlayerRecord> {
  @override
  final int typeId = 31;

  @override
  MdPlayerRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdPlayerRecord(
      score: fields[0] as int,
      acc: fields[1] as double,
      i: fields[2] as int,
      platform: fields[3] as String,
      history: fields[4] as MdRankHistory,
      difficulty: fields[5] as int,
      uid: fields[6] as String,
      sum: fields[7] as int,
      characterUid: fields[8] as String,
      elfinUid: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MdPlayerRecord obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.score)
      ..writeByte(1)
      ..write(obj.acc)
      ..writeByte(2)
      ..write(obj.i)
      ..writeByte(3)
      ..write(obj.platform)
      ..writeByte(4)
      ..write(obj.history)
      ..writeByte(5)
      ..write(obj.difficulty)
      ..writeByte(6)
      ..write(obj.uid)
      ..writeByte(7)
      ..write(obj.sum)
      ..writeByte(8)
      ..write(obj.characterUid)
      ..writeByte(9)
      ..write(obj.elfinUid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdPlayerRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
