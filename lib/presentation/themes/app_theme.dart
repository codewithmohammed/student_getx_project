import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  buttonTheme: const ButtonThemeData(buttonColor: Color(0x008bc34a)),
  //accent color for snack bar and all
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color.fromARGB(255, 0, 171, 193),
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 66, 66, 66),
    ),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 104, 58, 183),
    background: Color.fromARGB(255, 245, 245, 245),
  ),
);

ThemeData darktheme = ThemeData(
  buttonTheme:
      const ButtonThemeData(buttonColor: Color.fromARGB(255, 139, 195, 74)),
  //accent color for snack bar and all
  snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color.fromARGB(255, 0, 171, 193)),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    bodyMedium: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    titleLarge: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    titleMedium: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
    titleSmall: TextStyle(
      color: Color.fromARGB(255, 189, 189, 189),
    ),
  ),
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 13, 72, 161),
      background: Color.fromARGB(255, 33, 33, 33)),
);
