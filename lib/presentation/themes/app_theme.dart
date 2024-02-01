import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  buttonTheme: const ButtonThemeData(buttonColor: Color(0x008bc34a)),
  //accent color for snack bar and all
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    backgroundColor: Color.fromARGB(255, 104, 58, 183),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 104, 58, 183),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 24, 24, 24),
    ),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 104, 58, 183),
    background: Color.fromARGB(255, 245, 245, 245),
  ),
);

ThemeData darktheme = ThemeData(
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 13, 72, 161),
      titleTextStyle: TextStyle(
        color: Color.fromARGB(255, 237, 237, 237),
      )),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color.fromARGB(255, 13, 72, 161),
  ),
  //accent color for snack bar and all
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color.fromARGB(255, 0, 171, 193)),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 237, 237, 237),
    ),
  ),
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    secondaryContainer:Color.fromARGB(0, 0, 30, 112) ,
    primaryContainer: Color.fromARGB(0, 0, 30, 112),
      primary: Color.fromARGB(255, 13, 72, 161),
      background: Color.fromARGB(255, 33, 33, 33)),
);
