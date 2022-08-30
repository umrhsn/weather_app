import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';

class DateTimeNowText extends StatelessWidget {
  const DateTimeNowText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${AppStrings.dayNow}, ${AppStrings.hourNow}',
      style: !isCollapsed
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: AppDimens.fontSizeSmall * AppDimens.sliverAppBarScaleFactor),
    );
  }
}
