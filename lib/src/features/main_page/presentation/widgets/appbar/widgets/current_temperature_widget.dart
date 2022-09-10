import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/widgets/text_theme.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/datetime_now_text.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/max_min_text.dart';

class CurrentTemperatureWidget extends StatelessWidget {
  const CurrentTemperatureWidget({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var tempC = '';
            if (state is GetForecastSuccess) {
              tempC = state.current.tempCelsius.round().toString();
            }
            return Text(
              '$tempC°',
              style: isCollapsed
                  ? AppTextThemes.textTheme(isLight: isLight).bodyLarge
                  : AppTextThemes.textTheme(isLight: isLight)
                      .bodyLarge!
                      .copyWith(color: Colors.white),
            );
          },
        ),
        const Spacer(flex: 1),
        isCollapsed
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                MaxMinText(isCollapsed: isCollapsed),
                DateTimeNowText(isCollapsed: isCollapsed),
              ])
            : Container(),
        const Spacer(flex: 3),
        // // TODO: change image according to day-night status of user's location
        // Image.asset(ImgAssets.moonGif, height: 80)
        BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var imgUrl = '';
            if (state is GetForecastSuccess) {
              imgUrl = '${AppStrings.httpsWColon}${state.current.conditionModel.imgUrl}';
            }
            return Flexible(
              flex: 2,
              child: Image.network(imgUrl, height: 110, fit: BoxFit.fitHeight),
            );
          },
        )
      ],
    );
  }
}
