import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/week_card_item.dart';

class WeekCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;
  final String day;
  final String rainProbability;
  final String dayWeatherImg;
  final String nightWeatherImg;
  final String highTemp;
  final String lowTemp;

  const WeekCard({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    this.day = 'Wednesday',
    this.rainProbability = '100',
    this.dayWeatherImg = ImgAssets.sunPng,
    this.nightWeatherImg = ImgAssets.moonPng,
    this.highTemp = '34',
    this.lowTemp = '24',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeekCardItem _buildWeekCardItem() {
      return WeekCardItem(
        isLight: isLight,
        isCollapsed: isCollapsed,
        day: day,
        rainProbability: rainProbability,
        dayWeatherImg: dayWeatherImg,
        nightWeatherImg: nightWeatherImg,
        highTemp: highTemp,
        lowTemp: lowTemp,
      );
    }

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Column(
        children: [
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
          _buildWeekCardItem(),
        ],
      ),
    );
  }
}
