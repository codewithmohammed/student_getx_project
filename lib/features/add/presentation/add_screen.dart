import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_getx_project/features/form_keys.dart';
import 'package:student_getx_project/provider/student_provider.dart';
import 'package:student_getx_project/utils/field_validators.dart';
import 'package:student_getx_project/widgets/custom_button.dart';
import 'package:student_getx_project/widgets/custom_text_form_field.dart';
import 'package:student_getx_project/widgets/profile_picture_stack.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StudentController addStudentController = Get.find();
    // Future<void> onSubmitClicked() async {
    //   if (addFormKey.currentState!.validate() && addStudentController.addImageBytes != null) {
    //     // print(nameController.text);
    //     addStudentController.addIsLoading.value = true;
    //     addStudentController.update();
    //     await addStudentController.addStudentToDB();
    //   } else if (addStudentController.addImageBytes == null) {
    //     addStudentController.showSnackBar('Image ', 'Not Selected');
    //   }
    //   await Future.delayed(const Duration(seconds: 2));
    //   addStudentController.addClearTextFields();
    //   addStudentController.addImageBytes = null;
    //   addStudentController.addIsLoading.value = false;
    //   addStudentController.update();
    // }
   
    final kwidth = MediaQuery.of(context).size.width;
    return ScaffoldMessenger(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Obx(key: Key('value'), () {
              return Form(
                key: FormKey.addFormKey,
                child: addStudentController.addIsLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: GetBuilder<StudentController>(
                              builder: (addStudentController) {
                                return ProfilePictureStack(
                                    imageBytes:
                                        addStudentController.addImageBytes,
                                    function: () {
                                      addStudentController.addSelectImage();
                                    });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: CustomTextFormField(
                              controller: addStudentController.nameController,
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
                                    controller: addStudentController
                                        .classNumberController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Class',
                                    hint: '12',
                                    isObscure: false,
                                    validator: validateClassNumber,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: kwidth / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: CustomTextFormField(
                                      controller: addStudentController
                                          .divisionController,
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
                              controller: addStudentController.emailController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.join,
                              label: 'Email',
                              hint: 'example@email.com',
                              isObscure: false,
                              validator: validateEmail,
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
                                    controller:
                                        addStudentController.ageController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Age',
                                    hint: '13',
                                    isObscure: false,
                                    validator: validateAge,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: kwidth / 2,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: CustomTextFormField(
                                    controller: addStudentController
                                        .phoneNumberController,
                                    textInputType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.join,
                                    label: 'Phone Number',
                                    hint: '0123456789',
                                    isObscure: false,
                                    validator: validatePhoneNumber,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: CustomTextFormField(
                              controller: addStudentController.streetController,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.join,
                              label: 'Street',
                              hint: 'Abu Dhabi',
                              isObscure: false,
                              validator: validateStreet,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 50,
                              width: kwidth / 2,
                              child: CustomButton(
                                containerColor: Colors.green,
                                isLoading:
                                    addStudentController.addIsLoading.value,
                                text: 'Submit',
                                onTap: () async {
                                   await addStudentController.onSubmitClicked(FormKey.addFormKey);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
