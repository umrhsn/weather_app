import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class DateTimeNowWidget extends StatelessWidget {
  const DateTimeNowWidget({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${DateFormat('E').format(DateTime.now())}, ${DateFormat('h:mm a').format(DateTime.now()).toLowerCase()}',
      style: !isCollapsed
          ? Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
          : Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: AppDimens.fontSizeSmall * AppDimens.sliverAppBarScaleFactor),
    );
  }
}
