import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/info_card/widgets/info_widget.dart';

class InfoCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const InfoCard({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImgAssets.uvIndex,
            title: AppStrings.uvIndex,
            subtitle: AppStrings.high,
          ),
          _buildDivider(),
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImgAssets.wind,
            title: AppStrings.wind,
            subtitle: AppStrings.windSpeed,
          ),
          _buildDivider(),
          InfoWidget(
            isLight: isLight,
            isCollapsed: isCollapsed,
            image: ImgAssets.humidity,
            title: AppStrings.humidity,
            subtitle: AppStrings.humidityPercent,
          ),
        ],
      ),
    );
  }

  Container _buildDivider() {
    return Container(
        height: 100,
        width: isLight ? 0.5 : 0.25,
        color: isLight ? AppColors.dividerLightGrey : AppColors.dividerDarkGrey);
  }
}
