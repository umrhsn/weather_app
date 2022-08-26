import 'package:flutter/material.dart';

class AppTextThemes {
  static TextTheme textTheme({required bool isLight}) {
    return TextTheme(
      bodyMedium: TextStyle(color: isLight ? Colors.black : Colors.white),
    );
  }
}
