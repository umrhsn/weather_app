import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/rain_probability.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/rain_probability_item.dart';

class TodayTemperaturesList extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const TodayTemperaturesList({Key? key, required this.isLight, required this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Padding _buildListItem() {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            Text('3 pm', style: AppColors.collapsedSmallTextStyle(context, isCollapsed)),
            const SizedBox(height: 8),
            Image.asset(ImgAssets.sunPng, height: 20),
            const SizedBox(height: 15),
            Text('34°', style: AppColors.collapsedMediumTextStyle(context, isCollapsed)),
            const SizedBox(height: 8),
            RainProbabilityItem(
              customIconColor: AppColors.collapsedGreyCyanIconColor(context, isCollapsed),
              customTextColor: AppColors.collapsedSmallTextStyle(context, isCollapsed),
            ),
          ],
        ),
      );
    }

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
            _buildListItem(),
          ],
        ),
      ),
    );
  }
}
