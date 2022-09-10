import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/widgets/chance_of_rain_item.dart';

class HourTemperaturesCard extends StatelessWidget {
  final bool isLight;
  final bool isCollapsed;

  const HourTemperaturesCard({Key? key, required this.isLight, required this.isCollapsed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Padding _buildListItem(int index) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var hour = '';
            var imgUrl = '';
            var tempC = '';
            if (state is GetForecastSuccess) {
              var forecastDay = state.forecast.forecastDays[0].hoursModel.forecastDaysByHour[index];
              hour = forecastDay.time.toString().substring(11);
              imgUrl = '${AppStrings.httpsWColon}${forecastDay.conditionModel.imgUrl}';
              tempC = forecastDay.tempCelsius.round().toString();
            }
            return Column(
              children: [
                Text(hour, style: AppColors.collapsedSmallTextStyle(context, isCollapsed)),
                const SizedBox(height: 8),
                Image.network(imgUrl, height: 20, width: 40, fit: BoxFit.fitWidth),
                const SizedBox(height: 15),
                Text('$tempC${AppStrings.symbolDegree}',
                    style: AppColors.collapsedMediumTextStyle(context, isCollapsed)),
                const SizedBox(height: 8),
                ChanceOfRainItem(isCollapsed: isCollapsed, smallText: true),
              ],
            );
          },
        ),
      );
    }

    return CardWidget(
      isLight: isLight,
      isCollapsed: isCollapsed,
      widget: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            List<Padding> hourItems = [];
            if (state is GetForecastSuccess) {
              state.forecast.forecastDays[0].hoursModel.forecastDaysByHour
                  .asMap()
                  .forEach((index, value) {
                hourItems.add(_buildListItem(index));
              });
            }
            return Row(
              children: hourItems,
            );
          },
        ),
      ),
    );
  }
}
