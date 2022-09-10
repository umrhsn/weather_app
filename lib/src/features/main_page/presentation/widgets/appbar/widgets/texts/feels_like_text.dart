import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';

class FeelsLikeText extends StatelessWidget {
  const FeelsLikeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var feelsLike = '';
        if (state is GetForecastSuccess) {
          feelsLike =
              ' Feels like ${state.current.feelsLikeCelsius.round()}${AppStrings.symbolDegree}';
        }
        return Text(
          feelsLike,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
        );
      },
    );
  }
}
