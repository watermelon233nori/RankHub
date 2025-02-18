// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_localized_text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdLocalizedTextAdapter extends TypeAdapter<MdLocalizedText> {
  @override
  final int typeId = 36;

  @override
  MdLocalizedText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdLocalizedText(
      chineseS: fields[0] as String,
      chineseT: fields[1] as String,
      english: fields[2] as String,
      japanese: fields[3] as String,
      korean: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MdLocalizedText obj) {
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
      other is MdLocalizedTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
