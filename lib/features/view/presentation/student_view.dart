import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/core/models/student_model.dart';
import 'package:student_getx_project/features/edit/presentation/edit_screen.dart';
import 'package:student_getx_project/provider/student_provider.dart';
import 'package:student_getx_project/widgets/custom_button.dart';

class StudentView extends StatelessWidget {
  StudentView({super.key});

  final StudentModel? studentModel = Get.arguments as StudentModel?;

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: MemoryImage(studentModel!
                      .profilePicture), // Replace this with your actual image path
                ),
                const SizedBox(height: 20),
                Text(
                  studentModel!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Class: ${studentModel!.classNumber} - Division: ${studentModel!.division}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email: ${studentModel!.email}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Age: ${studentModel!.age}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Phone Number: ${studentModel!.phoneNumber}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Street: ${studentModel!.street}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: CustomButton(
                            isLoading: false,
                            containerColor: Colors.blue,
                            text: 'Edit',
                            onTap: () {
                              studentController
                                  .assignStudentData(studentModel!);
                              Get.off(const EditScreen(),
                                  transition: Transition.downToUp);
                            }),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: CustomButton(
                            isLoading: false,
                            containerColor: Colors.red,
                            text: 'Delete',
                            onTap: () async {
                              await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete ${studentModel!.name}'),
                                    content: const Text(
                                        'are you sure you want to delete this student'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () async {
                                          await studentController.deleteStudent(
                                              studentModel!.studentID);
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Yes'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              Navigator.of(context).pop();
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
