import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';

class ChanceOfRainItem extends StatelessWidget {
  const ChanceOfRainItem(
      {Key? key, required this.isCollapsed, this.smallText = false, this.index = 0})
      : super(key: key);

  final bool isCollapsed;
  final bool smallText;
  final int index;

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
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var chanceOfRain = '100';
            if (state is GetForecastSuccess) {
              chanceOfRain = state.forecast.forecastDays[index].dayModel.chanceOfRain.toString();
            }
            return Text('$chanceOfRain%', style: customTextStyle);
          },
        )
      ],
    );
  }
}
