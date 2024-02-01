import 'package:get/get.dart';
import 'package:student_getx_project/provider/student_provider.dart';


class InitDependency implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentController());
    // Get.lazyPut(() => UpdateController());
  }
}
