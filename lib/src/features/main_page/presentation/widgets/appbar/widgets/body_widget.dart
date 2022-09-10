import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/datetime_now_text.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/feels_like_text.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/max_min_text.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MaxMinText(isCollapsed: isCollapsed),
            isCollapsed ? Container() : const FeelsLikeText(),
          ],
        ),
        DateTimeNowText(isCollapsed: isCollapsed),
      ],
    );
  }
}
