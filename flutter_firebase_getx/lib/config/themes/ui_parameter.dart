import 'package:flutter/material.dart';
import 'package:get/get.dart';

const double _mobileScreenPadding = 25.0;
const double _cardBorderRadius = 10.0;
double get mobileScreenPadding => _mobileScreenPadding;
double get cardBorderRadius => _cardBorderRadius;
//double get cardBorderRadius => _mobileScreenPadding;
//double get mobileScreenPadding => _cardBorderRadius;

class UIParameters {
  static BorderRadius get cardBorderRadius =>
      BorderRadius.circular(_cardBorderRadius);
  static EdgeInsets get mobileScreenPadding =>
      const EdgeInsets.all(_mobileScreenPadding);
  static bool isDarkMode() {
    //BuildContext context) {
    // return Theme.of(context).brightness == Brightness.dark;

    // return Theme.of().brightness == Brightness.dark;// donot ned to pass contextwhen using getx
    return Get.isDarkMode ? true : false;
  }
}
