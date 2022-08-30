import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';

class TodayCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const TodayCard({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? bodyMediumTextStyle = isCollapsed
        ? Theme.of(context).textTheme.bodyMedium
        : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white);

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Column(
        children: [
          Text('Today\'s Temperature', style: bodyMediumTextStyle),
          Text('Expect the same as yesterday', style: bodyMediumTextStyle),
        ],
      ),
    );
  }
}
