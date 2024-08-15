import 'package:flutter/material.dart';

ThemeData lightmood = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: const Color.fromARGB(255, 169, 168, 168),
      primary: Colors.grey.shade300,
      secondary: const Color.fromARGB(255, 135, 134, 134),
      inversePrimary: Colors.grey.shade800,
      inverseSurface: Colors.white,
    ));
