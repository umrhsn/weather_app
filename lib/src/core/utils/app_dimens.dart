import 'package:flutter/material.dart';

class AppDimens {
  /// paddings
  static const double smallPadding = 8;
  static const double mediumPadding = 10;
  static const EdgeInsets bottomSmallPadding = EdgeInsets.only(bottom: AppDimens.smallPadding);
  static const EdgeInsets bottomMediumPadding = EdgeInsets.only(bottom: AppDimens.mediumPadding);

  /// font sizes
  static const double fontSizeSmall = 12;

  /// [SliverAppBar] heights
  static const double sliverAppBarExpandedHeight = 400;
  static const double sliverAppBarCollapsedHeight = 200;
  static const double sliverAppBarScaleFactor = 1.2;
}
