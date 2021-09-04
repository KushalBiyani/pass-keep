// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_pin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterPinAdapter extends TypeAdapter<MasterPin> {
  @override
  final int typeId = 0;

  @override
  MasterPin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MasterPin()..pin = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, MasterPin obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.pin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterPinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
