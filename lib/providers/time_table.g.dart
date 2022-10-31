// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeTableAdapter extends TypeAdapter<TimeTable> {
  @override
  final int typeId = 0;

  @override
  TimeTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeTable(
      title: fields[0] as String?,
      imagePath: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeTable obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
