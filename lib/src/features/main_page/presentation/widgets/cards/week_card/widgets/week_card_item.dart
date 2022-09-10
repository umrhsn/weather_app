import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/chance_of_rain_item.dart';

class WeekCardItem extends StatelessWidget {
  const WeekCardItem({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
    required this.index,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;
  final int index;

  @override
  Widget build(BuildContext context) {
    var customTextStyle = AppColors.collapsedMediumTextStyle(context, isCollapsed);

    SizedBox _buildDayItem() => SizedBox(
        width: 95,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var day = 'day';
            if (state is GetForecastSuccess) {
              day = state.forecast.forecastDays[index].date;
            }
            return Text(day, style: customTextStyle);
          },
        ));

    // Row _buildDayNightWeatherItem() {
    //   return Row(
    //     children: [
    //       Image.asset(dayWeatherImg, height: 18),
    //       const SizedBox(width: 7),
    //       Image.asset(nightWeatherImg, height: 18),
    //     ],
    //   );
    // }

    BlocBuilder<AppCubit, AppState> _buildHighLowTempItem() {
      return BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var maxTemp = '0';
          var minTemp = '0';
          if (state is GetForecastSuccess) {
            maxTemp = state.forecast.forecastDays[index].dayModel.maxTempCelsius.round().toString();
            minTemp = state.forecast.forecastDays[index].dayModel.minTempCelsius.round().toString();
          }
          return Row(
            children: [
              Text('$maxTemp${AppStrings.symbolDegree}', style: customTextStyle),
              const SizedBox(width: 5),
              Text('$minTemp${AppStrings.symbolDegree}', style: customTextStyle)
            ],
          );
        },
      );
    }

    return Padding(
      padding: AppDimens.bottomMediumPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildDayItem(),
          const Spacer(flex: 2),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              var chanceOfRain = '100';
              if (state is GetForecastSuccess) {
                chanceOfRain = state.forecast.forecastDays[index].dayModel.chanceOfRain.toString();
              }
              return ChanceOfRainItem(isCollapsed: isCollapsed);
            },
          ),
          const Spacer(),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              var imgUrl = '';
              if (state is GetForecastSuccess) {
                imgUrl =
                    '${AppStrings.httpsWColon}${state.forecast.forecastDays[index].dayModel.conditionModel.imgUrl}';
              }
              return Expanded(child: Image.network(imgUrl, height: 18, fit: BoxFit.fitWidth));
            },
          ),
          const Spacer(),
          _buildHighLowTempItem(),
        ],
      ),
    );
  }
}
