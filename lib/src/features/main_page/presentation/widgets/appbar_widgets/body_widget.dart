import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/datetime_now_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/feels_like_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/high_low_temperature_widget.dart';

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
            HighLowTemperatureWidget(isCollapsed: isCollapsed),
            isCollapsed ? Container() : const FeelsLikeWidget(),
          ],
        ),
        DateTimeNowWidget(isCollapsed: isCollapsed),
      ],
    );
  }
}
