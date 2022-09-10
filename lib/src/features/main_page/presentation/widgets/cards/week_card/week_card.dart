import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/week_card_item.dart';

class WeekCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const WeekCard({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeekCardItem _buildWeekCardItem(int index) {
      return WeekCardItem(
        isLight: isLight,
        isCollapsed: isCollapsed,
        index: index,
      );
    }

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          List<WeekCardItem> weekCardItems = [];
          if (state is GetForecastSuccess) {
            state.forecast.forecastDays.asMap().forEach((index, value) {
              weekCardItems.add(_buildWeekCardItem(index));
            });
          }
          return Column(
            children: weekCardItems,
          );
        },
      ),
    );
  }
}
