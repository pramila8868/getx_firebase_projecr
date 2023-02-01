import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/dark_theme.dart';
import 'package:flutter_firebase_getx/config/themes/light_theme.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initalizeThemeData();
    super.onInit();
  }

  void initalizeThemeData() {
    _darkTheme = DarkTheme().buildDarkTheme(); // initialize
    _lightTheme = LightTheme().buildLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;
  ThemeData get lightTheme => _lightTheme;
}
