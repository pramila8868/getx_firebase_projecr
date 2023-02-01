import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/sub_them_mixing.dart';

const Color primaryColorDark = Color.fromARGB(255, 22, 102, 183);
const Color colorDark = Color.fromARGB(255, 31, 31, 31);
const Color mainTextColorDark = Colors.white;

class DarkTheme with SubThemeData {
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      iconTheme: getIconTheme(),
      textTheme: getTextTthemes()
          .apply(bodyColor: mainTextColorDark, displayColor: mainTextColorDark),
    );
  }
}
