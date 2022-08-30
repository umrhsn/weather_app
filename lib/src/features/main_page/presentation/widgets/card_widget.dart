import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';

class CardWidget extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;
  final Widget? widget;

  const CardWidget({Key? key, required this.isLight, required this.isCollapsed, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          color: isCollapsed
              ? isLight
                  ? Colors.white
                  : AppColors.darkGrey
              // TODO: change card color according to day-night status of user's location
              : AppColors.nightCard,
          child: widget ??
              Text('tempListItem',
                  style: isCollapsed
                      ? Theme.of(context).textTheme.bodyMedium
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
