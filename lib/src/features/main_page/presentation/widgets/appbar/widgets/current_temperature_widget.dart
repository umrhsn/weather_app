import 'package:flutter/material.dart';
import 'package:weather_app/src/config/themes/widgets/text_theme.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/datetime_now_text.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/high_low_text.dart';

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
      children: [
        Text(
          '33°',
          style: isCollapsed
              ? AppTextThemes.textTheme(isLight: isLight).bodyLarge
              : AppTextThemes.textTheme(isLight: isLight).bodyLarge!.copyWith(color: Colors.white),
        ),
        const Spacer(flex: 1),
        isCollapsed
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                HighLowText(isCollapsed: isCollapsed),
                DateTimeNowText(isCollapsed: isCollapsed),
              ])
            : Container(),
        const Spacer(flex: 3),
        // TODO: change image according to day-night status of user's location
        Image.asset(ImgAssets.moonGif, height: 80)
      ],
    );
  }
}
