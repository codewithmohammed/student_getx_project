import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/features/search/widgets/grid_container.dart';
import 'package:student_getx_project/provider/student_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.find();

    // final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            // controller: searchController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade700,
                prefixIcon: const Icon(CupertinoIcons.search),
                // prefixIconColor: AppColors.white,
                hintText: 'Search for students',
                hintStyle: const TextStyle(
                    // color: AppColors.greylight1,
                    ),
                suffixIconColor: Colors.white,
                border: InputBorder.none),
            onChanged: (value) {
              studentController.runFilter(value);
            },
          ),
          Expanded(
            child: GetBuilder<StudentController>(builder: (controller) {
              return GridView.builder(
                itemCount:
                    controller.studentfoundStudentsModels.value.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final studentModel =
                      controller.studentfoundStudentsModels.value[index];
                  // print(studentModel.name);
                  return GridContainer(studentModel: studentModel);
                },
              );
            }),
          )
        ],
      )),
    );
  }
}
