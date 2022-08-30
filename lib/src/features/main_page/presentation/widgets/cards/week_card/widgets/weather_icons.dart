import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';

class WeatherIconsWidget extends StatelessWidget {
  const WeatherIconsWidget({Key? key}) : super(key: key);

  Padding _buildWeatherIconsItem() {
    return Padding(
      padding: AppDimens.bottomMediumPadding,
      child: Row(
        children: [
          Image.asset(ImgAssets.sunPng, height: 18),
          const SizedBox(width: 7),
          Image.asset(ImgAssets.moonPng, height: 18),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
        _buildWeatherIconsItem(),
      ],
    );
  }
}
