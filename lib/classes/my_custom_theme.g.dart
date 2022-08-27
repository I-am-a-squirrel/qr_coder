// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_custom_theme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyCustomThemeAdapter extends TypeAdapter<MyCustomTheme> {
  @override
  final int typeId = 1;

  @override
  MyCustomTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyCustomTheme(
      red: fields[0] as bool,
      green: fields[1] as bool,
      blue: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MyCustomTheme obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.red)
      ..writeByte(1)
      ..write(obj.green)
      ..writeByte(2)
      ..write(obj.blue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyCustomThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
