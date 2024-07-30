import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  primaryColor: const Color(0xffff9800),
  colorScheme: const ColorScheme.light(
    surface: Colors.white,
    primary: Color(0xff121212),
    secondary: Color(0xff9e9e9e),
    tertiary: Color(0xffeeeeee),
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
  ),
);
