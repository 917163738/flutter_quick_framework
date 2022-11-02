import 'package:flutter/material.dart';

class AppColors {
  static const Color bgGray = Color(0xFFF5F7F9);
  static const Color navUnSelected = Color(0xFFb3b3b3);
  static const Color verticalDivider = Color(0x73FFFFFF);
  static const Color whiteVerticalDivider = Color(0xFFEDEDED);
  static const Color textDefault = Color(0xFF333333);
  static const Color textTitle = Color(0xFF252525);

  static Color string2Color(String colorString) {
    int value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      int? v = int.tryParse(colorString, radix: 16);
      if (v != null) {
        if (v < 0xFF000000) {
          v += 0xFF000000;
          value = v;
        }
      }
    }
    return Color(value);
  }
}
