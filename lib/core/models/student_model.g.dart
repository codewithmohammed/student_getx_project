// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 1;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      studentID: fields[0] as String,
      profilePicture: fields[1] as Uint8List,
      name: fields[2] as String,
      age: fields[3] as String,
      classNumber: fields[4] as String,
      email: fields[5] as String,
      division: fields[6] as String,
      phoneNumber: fields[7] as String,
      street: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.studentID)
      ..writeByte(1)
      ..write(obj.profilePicture)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.classNumber)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.division)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.street);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
