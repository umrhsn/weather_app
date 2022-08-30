import 'package:flutter/material.dart';

class AppIconThemes {
  static IconThemeData iconTheme({required bool isLight}) {
    return IconThemeData(color: isLight ? Colors.black : Colors.white, size: 20);
  }
}
