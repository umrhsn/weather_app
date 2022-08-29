import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  Brightness get brightness => MediaQuery.of(this).platformBrightness;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
