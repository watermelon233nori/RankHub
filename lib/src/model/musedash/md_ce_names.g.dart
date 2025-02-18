// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_ce_names.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdCENamesAdapter extends TypeAdapter<MdCENames> {
  @override
  final int typeId = 34;

  @override
  MdCENames read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdCENames(
      chineseS: (fields[0] as List).cast<String>(),
      chineseT: (fields[1] as List).cast<String>(),
      english: (fields[2] as List).cast<String>(),
      japanese: (fields[3] as List).cast<String>(),
      korean: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, MdCENames obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.chineseS)
      ..writeByte(1)
      ..write(obj.chineseT)
      ..writeByte(2)
      ..write(obj.english)
      ..writeByte(3)
      ..write(obj.japanese)
      ..writeByte(4)
      ..write(obj.korean);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdCENamesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
