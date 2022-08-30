import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/rain_probability_item.dart';

class WeekCardItem extends StatelessWidget {
  const WeekCardItem({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    required this.day,
    required this.rainProbability,
    required this.dayWeatherImg,
    required this.nightWeatherImg,
    required this.highTemp,
    required this.lowTemp,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;
  final String day;
  final String rainProbability;
  final String dayWeatherImg;
  final String nightWeatherImg;
  final String highTemp;
  final String lowTemp;

  @override
  Widget build(BuildContext context) {
    var customTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    SizedBox _buildDayItem() => SizedBox(width: 95, child: Text(day, style: customTextStyle));

    Row _buildDayNightWeatherItem() {
      return Row(
        children: [
          Image.asset(dayWeatherImg, height: 18),
          const SizedBox(width: 7),
          Image.asset(nightWeatherImg, height: 18),
        ],
      );
    }

    Row _buildHighLowTempItem() {
      return Row(
        children: [
          Text('$highTemp${AppStrings.symbolDegree}', style: customTextStyle),
          const SizedBox(width: 5),
          Text('$lowTemp${AppStrings.symbolDegree}', style: customTextStyle)
        ],
      );
    }

    return Padding(
      padding: AppDimens.bottomMediumPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDayItem(),
          const Spacer(flex: 2),
          RainProbabilityItem(rainProbability: rainProbability, isCollapsed: isCollapsed),
          const Spacer(),
          _buildDayNightWeatherItem(),
          const Spacer(),
          _buildHighLowTempItem(),
        ],
      ),
    );
  }
}
