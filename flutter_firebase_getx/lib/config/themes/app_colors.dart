import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/light_theme.dart';
import 'package:flutter_firebase_getx/config/themes/ui_parameter.dart';

const Color onSurfaceTextColor = Colors.white;
const mainGradLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColorLight, colorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColorLight, colorLight]);
LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode() ? mainGradientDark : mainGradLight;

Color customScaffoldColor(BuildContext context) => UIParameters.isDarkMode()
    ? const
// ignore: prefer_const_constructors
        Color.fromARGB(255, 20, 46, 158)
    : Color.fromARGB(255, 221, 221, 221);
