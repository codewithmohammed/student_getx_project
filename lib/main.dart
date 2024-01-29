import 'package:flutter/material.dart';
import 'package:student_getx_project/features/main/presentation/main_screen.dart';
import 'package:student_getx_project/presentation/themes/app_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darktheme,
      home: const MainScreen(),
    );
  }
}
