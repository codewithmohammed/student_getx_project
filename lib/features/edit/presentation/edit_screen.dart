import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/features/form_keys.dart';
import 'package:student_getx_project/provider/student_provider.dart';
import 'package:student_getx_project/utils/field_validators.dart';
import 'package:student_getx_project/widgets/custom_button.dart';
import 'package:student_getx_project/widgets/custom_text_form_field.dart';
import 'package:student_getx_project/widgets/profile_picture_stack.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController studentController = Get.find();

    final kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Obx(key: const Key('sdjf'), () {
          return Form(
            key: FormKey.editFormKey,
            child: studentController.editIsLoading.value
                ? const CircularProgressIndicator()
                : Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GetBuilder<StudentController>(
                          builder: (studentController) {
                            return ProfilePictureStack(
                              imageBytes: studentController.editImageBytes,
                              function: () {
                                studentController.editSelectImage();
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: CustomTextFormField(
                          controller: studentController.editNameController,
                          textInputType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.join,
                          label: 'Name',
                          hint: 'Name',
                          isObscure: false,
                          validator: (string) {
                            return null;
                          },
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: kwidth / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                  controller: studentController
                                      .editClassNumberController,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.join,
                                  label: 'Class',
                                  hint: '12th',
                                  isObscure: false,
                                  validator: validateClassNumber),
                            ),
                          ),
                          SizedBox(
                            width: kwidth / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                  controller:
                                      studentController.editDivisionController,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.join,
                                  label: 'Division',
                                  hint: 'G',
                                  isObscure: false,
                                  validator: validateDivision),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: CustomTextFormField(
                            controller: studentController.editEmailController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.join,
                            label: 'Email',
                            hint: 'example@email.com',
                            isObscure: false,
                            validator: validateEmail),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: kwidth / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                  controller:
                                      studentController.editAgeController,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.join,
                                  label: 'Age',
                                  hint: '13',
                                  isObscure: false,
                                  validator: validateAge),
                            ),
                          ),
                          SizedBox(
                            width: kwidth / 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: CustomTextFormField(
                                  controller: studentController
                                      .editPhoneNumberController,
                                  textInputType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.join,
                                  label: 'Phone Number',
                                  hint: '0123456789',
                                  isObscure: false,
                                  validator: validatePhoneNumber),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: CustomTextFormField(
                            controller: studentController.editStreetController,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.join,
                            label: 'Street',
                            hint: 'Abu Dhabi',
                            isObscure: false,
                            validator: validateStreet),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Obx(
                              () => Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                width: kwidth / 2,
                                child: CustomButton(
                                  containerColor: Colors.green,
                                  isLoading:
                                      studentController.editIsLoading.value,
                                  text: 'Submit',
                                  onTap: () async {
                                    if (studentController.currentStudentID ==
                                        null) {
                                      return;
                                    }
                                    await studentController
                                        .onSubmitForEditClicked(
                                            FormKey.editFormKey,
                                            studentController.currentStudentID!)
                                        .then((value) => Get.back());
                                  },
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              width: kwidth / 2,
                              child: CustomButton(
                                containerColor: Colors.red,
                                isLoading: false,
                                text: 'Cancel',
                                onTap: () {
                                  Get.back();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
          );
        })),
      ),
    );
  }
}
