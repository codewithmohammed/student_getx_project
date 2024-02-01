import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_getx_project/core/models/student_model.dart';



const studentDBName = 'student_database';

abstract class StudentDBFunctions {
  Future<void> insertstudent(StudentModel value);
  Future<List<StudentModel>> getstudent();
  Future<void> clearstudent();
}

class StudentDB implements StudentDBFunctions {
  @override
  Future<void> insertstudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    studentDB.put(value.studentID, value);
  }

  @override
  Future<void> clearstudent() async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    await studentDB.clear();
  }

  @override
  Future<List<StudentModel>> getstudent() async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    return studentDB.values.toList();
  }

  Future<void> deletestudent(String key) async {
    final studentDB = await Hive.openBox<StudentModel>(studentDBName);
    studentDB.delete(key);
  }
}
