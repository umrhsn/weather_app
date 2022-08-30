import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/rain_probability_item.dart';

class RainProbabilityWidget extends StatelessWidget {
  final bool isCollapsed;

  const RainProbabilityWidget({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customIconColor = AppColors.collapsedGreyCyanIconColor(context, isCollapsed);
    var customTextColor = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    Padding _buildRainProbabilityItem() {
      return Padding(
        padding: AppDimens.bottomMediumPadding,
        child:
            RainProbabilityItem(customIconColor: customIconColor, customTextColor: customTextColor),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
        _buildRainProbabilityItem(),
      ],
    );
  }
}
