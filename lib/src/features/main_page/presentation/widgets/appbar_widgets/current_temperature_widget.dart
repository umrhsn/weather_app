import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/widgets/text_theme.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/datetime_now_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/high_low_temperature_widget.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  const CurrentTemperatureWidget({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '33°',
          style: isCollapsed
              ? AppTextThemes.textTheme(isLight: isLight).bodyLarge
              : AppTextThemes.textTheme(isLight: isLight).bodyLarge!.copyWith(color: Colors.white),
        ),
        isCollapsed
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                HighLowTemperatureWidget(isCollapsed: isCollapsed),
                DateTimeNowWidget(isCollapsed: isCollapsed),
              ])
            : Container(),
        // TODO: change image according to day-night status of user's location
        Image.asset(ImgAssets.moon, height: 80)
      ],
    );
  }
}
