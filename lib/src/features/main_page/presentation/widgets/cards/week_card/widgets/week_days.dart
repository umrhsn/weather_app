import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';

class WeekDaysWidget extends StatelessWidget {
  final bool isCollapsed;

  const WeekDaysWidget({Key? key, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var customTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    Padding _buildWeekDaysItem({required String text}) {
      return Padding(
          padding: AppDimens.bottomMediumPadding, child: Text(text, style: customTextStyle));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildWeekDaysItem(text: 'Yesterday'),
        _buildWeekDaysItem(text: 'Today'),
        _buildWeekDaysItem(text: 'Monday'),
        _buildWeekDaysItem(text: 'Tuesday'),
        _buildWeekDaysItem(text: 'Wednesday'),
        _buildWeekDaysItem(text: 'Thursday'),
        _buildWeekDaysItem(text: 'Friday'),
        _buildWeekDaysItem(text: 'Saturday'),
      ],
    );
  }
}
