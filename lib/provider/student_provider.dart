import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/core/database/student_methods.dart';
import 'package:student_getx_project/core/models/student_model.dart';
import 'package:student_getx_project/utils/image_picker.dart';

import 'package:uuid/uuid.dart';

class StudentController extends GetxController {
  @override
  void onInit() {
    getAllStudent();
    super.onInit();
  }

  StudentDB studentDataBase = StudentDB();
  Uint8List? addImageBytes;
 
  TextEditingController nameController = TextEditingController();
  TextEditingController classNumberController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  RxBool addIsLoading = false.obs;

  List<StudentModel> studentModels = [];
  RxList<StudentModel> studentfoundStudentsModels = RxList<StudentModel>([]);
  void addSelectImage() async {
    final Uint8List? image;
    image = await pickImageFromDevice();
    if (image != null) {
      addImageBytes = image;
    } else {
      addImageBytes = null;
      showSnackBar('Image', 'Not Selected');
    }
    update();
  }

  showSnackBar(String title, String subTitle) {
    Get.snackbar(title, subTitle);
  }

  // onSubmitClicked() async {}

  Future<void> onSubmitClicked(GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate() && addImageBytes != null) {
      print(nameController.text);
      addIsLoading.value = true;
      update();
      await addStudentToDB();
    } else if (addImageBytes == null) {
      showSnackBar('Image ', 'Not Selected');
    }
    await Future.delayed(const Duration(seconds: 2));
    addClearTextFields();
    addImageBytes = null;
    addIsLoading.value = false;
    update();
  }

  Future<void> addStudentToDB() async {
    String uuid = const Uuid().v4();
    // print(nameController.text);
    final studentModel = StudentModel(
        studentID: uuid,
        profilePicture: addImageBytes!,
        name: nameController.text,
        age: ageController.text,
        classNumber: classNumberController.text,
        email: emailController.text,
        division: divisionController.text,
        phoneNumber: phoneNumberController.text,
        street: streetController.text);

    await studentDataBase.insertstudent(studentModel);
    await getAllStudent();
  }

  /////////////////EDITING?//////////////////////////////////////
  ////////////////////////
  ////
  ///
  ///
  ///
  ///
  String? currentStudentID;
  TextEditingController editNameController = TextEditingController();
  TextEditingController editClassNumberController = TextEditingController();
  TextEditingController editDivisionController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editAgeController = TextEditingController();
  TextEditingController editPhoneNumberController = TextEditingController();
  TextEditingController editStreetController = TextEditingController();
  Uint8List? editImageBytes;

  RxBool editIsLoading = false.obs;

  void editSelectImage() async {
    final Uint8List? image;
    image = await pickImageFromDevice();
    if (image != null) {
      editImageBytes = image;
    } else {
      editImageBytes = null;
    }
    update();
  }

  Future<void> getAllStudent() async {
    studentModels = await studentDataBase.getstudent();
    studentfoundStudentsModels.value = studentModels;
    update();
  }

  Future<String> deleteStudent(String key) async {
    const String result = 'succesfully deleted';
    await studentDataBase.deletestudent(key);
    await getAllStudent();
    return result;
  }

  Future<void> onSubmitForEditClicked(GlobalKey<FormState> globalKey,String updateID) async {
    if (globalKey.currentState!.validate() && editImageBytes != null) {
      editIsLoading.value = true;
      update();
      await editStudent(updateID);
    } else if (editImageBytes == null) {
     showSnackBar('Image ', 'Not Selected');
    }
    await Future.delayed(const Duration(seconds: 2));
    editClearTextFields();
    editImageBytes = null;
    editIsLoading.value = false;
    update();
  }

  Future<void> editStudent(String updateID) async {
    final model = StudentModel(
        studentID: updateID,
        profilePicture: editImageBytes!,
        name: editNameController.text,
        age: editAgeController.text,
        classNumber: editClassNumberController.text,
        email: editEmailController.text,
        division: editDivisionController.text,
        phoneNumber: editPhoneNumberController.text,
        street: editStreetController.text);
    await StudentDB().insertstudent(model);
    await getAllStudent();
  }

  Future<void> assignStudentData(StudentModel studentModel) async {
    currentStudentID = studentModel.studentID;
    editImageBytes = studentModel.profilePicture;
    editNameController.text = studentModel.name;
    editClassNumberController.text = studentModel.classNumber;
    editDivisionController.text = studentModel.division;
    editEmailController.text = studentModel.email;
    editAgeController.text = studentModel.age;
    editPhoneNumberController.text = studentModel.phoneNumber;
    editStreetController.text = studentModel.phoneNumber;
    update();
  }

  void addClearTextFields() {
    nameController.clear();
    classNumberController.clear();
    divisionController.clear();
    emailController.clear();
    ageController.clear();
    phoneNumberController.clear();
    streetController.clear();
  }

  void editClearTextFields() async {
    editNameController.clear();
    editClassNumberController.clear();
    editDivisionController.clear();
    editEmailController.clear();
    editAgeController.clear();
    editPhoneNumberController.clear();
    editStreetController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<StudentModel> results = [];
    if (enteredKeyword.trim().isEmpty) {
      results = studentModels;
    } else {
      results = studentModels
          .where((student) =>
              student.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    studentfoundStudentsModels.value = results;
    update();
  }
}
