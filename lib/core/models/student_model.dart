import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  final String studentID;
  @HiveField(1)
  final Uint8List profilePicture;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String classNumber;
  @HiveField(4)
  final String division;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String age;
  @HiveField(7)
  final String phoneNumber;
  @HiveField(8)
  final String street;

  StudentModel(
      {required this.studentID,
      required this.profilePicture,
      required this.name,
      required this.age,
      required this.classNumber,
      required this.email,
      required this.division,
      required this.phoneNumber,
      required this.street});
}
