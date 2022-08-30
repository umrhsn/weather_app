import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/high_low_temps.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/rain_probability.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/weather_icons.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/week_days.dart';

class WeekCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const WeekCard({Key? key, required this.isLight, required this.isCollapsed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WeekDaysWidget(isCollapsed: isCollapsed),
          const Spacer(flex: 2),
          RainProbabilityWidget(isCollapsed: isCollapsed),
          const Spacer(),
          const WeatherIconsWidget(),
          const Spacer(),
          HighLowTempsWidget(isCollapsed: isCollapsed),
        ],
      ),
    );
  }
}
