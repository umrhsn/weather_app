import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/widgets/app_bar_theme.dart';
import 'package:weather_app/src/config/themes/widgets/icon_theme.dart';
import 'package:weather_app/src/config/themes/widgets/text_theme.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class AppThemes {
  static ThemeData appTheme({required bool isLight}) {
    return ThemeData(
      brightness: isLight ? Brightness.light : Brightness.dark,
      appBarTheme: AppBarThemes.appBarTheme(isLight: isLight),
      scaffoldBackgroundColor: isLight ? AppColors.lightGrey : AppColors.black,
      textTheme: AppTextThemes.textTheme(isLight: isLight),
      iconTheme: AppIconThemes.iconTheme(isLight: isLight),
    );
  }
}
