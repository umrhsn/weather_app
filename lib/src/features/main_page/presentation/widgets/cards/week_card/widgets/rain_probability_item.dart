import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class RainProbabilityItem extends StatelessWidget {
  const RainProbabilityItem(
      {Key? key, required this.rainProbability, required this.isCollapsed, this.smallText = false})
      : super(key: key);

  final bool isCollapsed;
  final bool smallText;
  final String rainProbability;

  @override
  Widget build(BuildContext context) {
    var customTextStyle = !smallText
        ? AppColors.collapsedMediumTextStyle(context, isCollapsed)
        : AppColors.collapsedSmallTextStyle(context, isCollapsed);
    var customIconColor = AppColors.collapsedGreyCyanIconColor(context, isCollapsed);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.water_drop, color: customIconColor, size: 13),
        const SizedBox(width: 3),
        Text('$rainProbability%', style: customTextStyle)
      ],
    );
  }
}
