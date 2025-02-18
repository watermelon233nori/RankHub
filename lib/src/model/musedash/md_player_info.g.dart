// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_player_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdPlayerInfoAdapter extends TypeAdapter<MdPlayerInfo> {
  @override
  final int typeId = 33;

  @override
  MdPlayerInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdPlayerInfo(
      objectId: fields[0] as String,
      createdAt: fields[1] as DateTime,
      updatedAt: fields[2] as DateTime,
      userId: fields[3] as String,
      nickname: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MdPlayerInfo obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.objectId)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.updatedAt)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.nickname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdPlayerInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
