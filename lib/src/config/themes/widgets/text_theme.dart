import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class AppTextThemes {
  static TextTheme textTheme({required bool isLight}) {
    return TextTheme(
      titleMedium:
          TextStyle(color: isLight ? Colors.black : Colors.white, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(
          color: isLight ? Colors.black : Colors.white, fontSize: AppDimens.fontSizeSmall),
      bodyLarge: TextStyle(
          color: isLight ? Colors.black : Colors.white, fontSize: 60, fontWeight: FontWeight.w100),
      bodyMedium: TextStyle(color: isLight ? Colors.black : Colors.white),
    );
  }
}
