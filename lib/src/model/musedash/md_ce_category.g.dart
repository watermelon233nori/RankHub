// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_ce_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdCECategoryAdapter extends TypeAdapter<MdCECategory> {
  @override
  final int typeId = 35;

  @override
  MdCECategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdCECategory(
      category: fields[0] as String,
      names: fields[1] as MdCENames,
    );
  }

  @override
  void write(BinaryWriter writer, MdCECategory obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.names);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdCECategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
