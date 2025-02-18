// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_player_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdPlayerDataAdapter extends TypeAdapter<MdPlayerData> {
  @override
  final int typeId = 30;

  @override
  MdPlayerData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdPlayerData(
      lastUpdate: fields[0] as DateTime,
      rl: fields[1] as double,
      diffHistoryNumber: fields[2] as int,
      plays: (fields[3] as List).cast<MdPlayerRecord>(),
      user: fields[4] as MdPlayerInfo,
      keyString: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MdPlayerData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.lastUpdate)
      ..writeByte(1)
      ..write(obj.rl)
      ..writeByte(2)
      ..write(obj.diffHistoryNumber)
      ..writeByte(3)
      ..write(obj.plays)
      ..writeByte(4)
      ..write(obj.user)
      ..writeByte(5)
      ..write(obj.keyString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdPlayerDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
