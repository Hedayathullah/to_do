import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.blueGrey.shade400,
    primary: Colors.white,
    secondary: Colors.blueGrey.shade100,
    surface: Colors.black, // Added black color
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.blueGrey.shade900,
    primary: Colors.black,
    secondary: Colors.blueGrey.shade600,
    surface: Colors.white,
  ),
);
