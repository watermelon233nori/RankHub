// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'md_album.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MdAlbumAdapter extends TypeAdapter<MdAlbum> {
  @override
  final int typeId = 38;

  @override
  MdAlbum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MdAlbum(
      title: fields[0] as String,
      jsonKey: fields[1] as String,
      localized: fields[2] as MdLocalizedText,
      tag: fields[3] as String,
      musicList: (fields[4] as List).cast<MdMusic>(),
    );
  }

  @override
  void write(BinaryWriter writer, MdAlbum obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.jsonKey)
      ..writeByte(2)
      ..write(obj.localized)
      ..writeByte(3)
      ..write(obj.tag)
      ..writeByte(4)
      ..write(obj.musicList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MdAlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
