import 'package:flutter/material.dart';
import 'package:flutter_firebase_getx/config/themes/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubThemeData {
  TextTheme getTextTthemes() {
    // function
    // ignore: prefer_const_constructors
    return GoogleFonts.quicksandTextTheme(const TextTheme(
        bodyText1: TextStyle(fontWeight: FontWeight.w400),
        bodyText2: TextStyle(fontWeight: FontWeight.w400)));
  }

  IconThemeData getIconTheme() {
    return const IconThemeData(color: onSurfaceTextColor, size: 16);
  }
}
