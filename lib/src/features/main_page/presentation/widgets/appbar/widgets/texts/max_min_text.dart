import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class MaxMinText extends StatelessWidget {
  const MaxMinText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Text(
      '34° / 24°',
      style: !isCollapsed
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: AppDimens.fontSizeSmall * AppDimens.sliverAppBarScaleFactor),
    );
  }
}
