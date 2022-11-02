import 'package:flutter/material.dart';

import 'app_colors.dart';

final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.bgGray,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    //取消水波纹
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: AppColors.navUnSelected,
        selectedLabelStyle: TextStyle(fontSize: 12)));