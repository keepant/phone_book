// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteContactModelAdapter extends TypeAdapter<FavoriteContactModel> {
  @override
  final int typeId = 0;

  @override
  FavoriteContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteContactModel(
      name: fields[0] as String,
      phone: fields[1] as String,
      email: fields[2] as String,
      job: fields[3] as String,
      company: fields[4] as String,
      imgUrl: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteContactModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phone)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.job)
      ..writeByte(4)
      ..write(obj.company)
      ..writeByte(5)
      ..write(obj.imgUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
