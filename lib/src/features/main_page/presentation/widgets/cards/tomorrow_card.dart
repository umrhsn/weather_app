import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';

class TomorrowCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const TomorrowCard({Key? key, required this.isLight, required this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyMediumTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Column(
        children: [
          Text('Tomorrow\'s Temperature', style: bodyMediumTextStyle),
          const SizedBox(height: 4),
          Text('Expect the same as today',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400, color: Colors.grey)),
        ],
      ),
    );
  }
}
