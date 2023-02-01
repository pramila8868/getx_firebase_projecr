import 'package:flutter/material.dart';

import 'sub_them_mixing.dart';

const Color primaryColorLight = Colors.blue;
const Color colorLight = Colors.red;
const Color mainTextcolorLight = Colors.red;
const Color cardColor = Color.fromARGB(255, 254, 254, 255);

class LightTheme with SubThemeData {
  buildLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      primaryColor: primaryColorLight,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      iconTheme: getIconTheme(),
      cardColor: cardColor,
      textTheme: getTextTthemes().apply(
          bodyColor: mainTextcolorLight, displayColor: mainTextcolorLight),
    );
  }
}
