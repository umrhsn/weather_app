import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';

class SunsetSunriseCard extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;

  const SunsetSunriseCard({Key? key, required this.isLight, required this.isCollapsed})
      : super(key: key);

  @override
  State<SunsetSunriseCard> createState() => _SunsetSunriseCardState();
}

class _SunsetSunriseCardState extends State<SunsetSunriseCard> {
  @override
  Widget build(BuildContext context) {
    var textStyle = AppColors.collapsedMediumTextStyle(context, widget.isCollapsed);

    return CardWidget(
      isLight: widget.isLight,
      isCollapsed: widget.isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(AppStrings.sunrise, style: textStyle),
              Text(AppStrings.hourNow, style: textStyle),
              Image.asset(ImgAssets.sunrise, height: 100)
            ],
          ),
          Column(
            children: [
              Text(AppStrings.sunrise, style: textStyle),
              Text(AppStrings.hourNow, style: textStyle),
              Image.asset(ImgAssets.sunset, height: 100)
            ],
          ),
        ],
      ),
    );
  }
}
