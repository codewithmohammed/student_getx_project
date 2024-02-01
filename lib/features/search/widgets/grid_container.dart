import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/core/models/student_model.dart';
import 'package:student_getx_project/features/edit/presentation/edit_screen.dart';
import 'package:student_getx_project/features/view/presentation/student_view.dart';
import 'package:student_getx_project/provider/student_provider.dart';

class GridContainer extends StatelessWidget {
  const GridContainer({
    super.key,
    required this.studentModel,
  });

  final StudentModel studentModel;

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.put(StudentController());
    return InkWell(
      onTap: () {
        Get.toNamed('/Student', arguments: studentModel);
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) {
        //     return StudentView(
        //       studentModel: studentModel,
        //     );
        //   },
        // ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 131, 131, 131),
              boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 2)]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                            color: Colors.white),
                      ),
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            shape: BoxShape.rectangle,
                            color: Colors.red,
                            image: DecorationImage(
                                image:
                                    MemoryImage(studentModel.profilePicture))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          studentController.assignStudentData(studentModel);
                          Get.to(const EditScreen(),
                              transition: Transition.circularReveal);
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete ${studentModel.name}'),
                                content: const Text(
                                    'are you sure you want to delete this student'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () async {
                                      await studentController.deleteStudent(
                                          studentModel.studentID);
                                      Get.back();
                                    },
                                    child: const Text('Yes'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Name:${studentModel.name}',
                    style: const TextStyle(
                        fontSize: 18, overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                      'Class:${studentModel.classNumber} ,Div:${studentModel.division}',
                      style: const TextStyle(
                          fontSize: 18, overflow: TextOverflow.ellipsis))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
