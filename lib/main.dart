import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_getx_project/core/models/student_model.dart';
import 'package:student_getx_project/features/add/presentation/add_screen.dart';
import 'package:student_getx_project/features/edit/presentation/edit_screen.dart';
import 'package:student_getx_project/features/main/presentation/main_screen.dart';
import 'package:student_getx_project/features/view/presentation/student_view.dart';
import 'package:student_getx_project/presentation/themes/app_theme.dart';
import 'package:student_getx_project/provider/init_dependency.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDependency(),
      initialRoute: '/Main',
      // home: const LoginScreen(),
      getPages: [
        GetPage(name: '/Main', page: () => const MainScreen()),
        GetPage(name: '/Add', page: () => const AddScreen()),
        GetPage(name: '/Edit', page: () => const EditScreen()),
        GetPage(name: '/Student', page: () =>  StudentView())
      ],
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darktheme,
      );
  }
}