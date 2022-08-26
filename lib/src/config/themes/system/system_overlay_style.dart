import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSystemUiOverlayStyle {
  static const light = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );

  static const dark = SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  static SystemUiOverlayStyle setSystemUiOverlayStyle({required bool isLight}) {
    SystemUiOverlayStyle systemOverlayStyle =
        isLight ? AppSystemUiOverlayStyle.light : AppSystemUiOverlayStyle.dark;
    return systemOverlayStyle;
  }
}
