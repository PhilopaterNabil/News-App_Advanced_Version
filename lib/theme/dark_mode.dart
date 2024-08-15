import 'package:flutter/material.dart';

ThemeData darkmood = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.black,
      primary: const Color.fromARGB(255, 34, 34, 34),
      secondary: const Color.fromARGB(255, 160, 159, 159),
      inversePrimary: Colors.grey.shade300,
      inverseSurface: Colors.blue,
    ));
