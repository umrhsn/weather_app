import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/system/system_overlay_style.dart';

class AppBarThemes {
  static AppBarTheme appBarTheme({required bool isLight}) {
    return AppBarTheme(
      systemOverlayStyle:
          AppSystemUiOverlayStyle.setSystemUiOverlayStyle(isLight: isLight),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
