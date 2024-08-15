import 'package:flutter/material.dart';
import 'package:task_ninja_flutter/theme/dark_mode.dart';
import 'package:task_ninja_flutter/theme/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themedata = lightmood;

  ThemeData get themedata => _themedata;

  bool get isDarkmood => _themedata == darkmood;

  set themedata(ThemeData themeData) {
    _themedata = themeData;
    notifyListeners();
  }

  void theme() {
    if (_themedata == lightmood) {
      themedata = darkmood;
    } else {
      themedata = lightmood;
    }
  }
}