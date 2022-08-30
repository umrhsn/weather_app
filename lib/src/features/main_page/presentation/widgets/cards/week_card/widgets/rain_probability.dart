import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class RainProbabilityWidget extends StatelessWidget {
  final bool isCollapsed;

  const RainProbabilityWidget({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customIconColor = AppColors.collapsedGreyCyanIconColor(context, isCollapsed);
    var customTextColor = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    switch (isCollapsed) {
      case true:
        break;
      case false:
        break;
    }

    Padding _buildRainProbabilityItem() {
      return Padding(
        padding: AppDimens.bottomMediumPadding,
        child: Row(children: [
          Icon(Icons.water_drop, color: customIconColor, size: 13),
          const SizedBox(width: 3),
          Text('100%', style: customTextColor)
        ]),
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
