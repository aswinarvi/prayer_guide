// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerContentAdapter extends TypeAdapter<PrayerContent> {
  @override
  final int typeId = 10;

  @override
  PrayerContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrayerContent(
      title: fields[0] as String?,
      bibleVerse: (fields[1] as List?)?.cast<String>(),
      bibleVerseReference: fields[2] as String?,
      imageUrl: fields[3] as String?,
      content: (fields[4] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PrayerContent obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.bibleVerse)
      ..writeByte(2)
      ..write(obj.bibleVerseReference)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
