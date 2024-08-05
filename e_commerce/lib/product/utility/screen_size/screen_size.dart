import 'package:flutter/material.dart';

class ScreenSizeHelper {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void initialize(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
  }
}
