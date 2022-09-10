import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';

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
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            var isDay = 1;
            if (state is GetForecastSuccess) {
              isDay = state.current.isDay;
            }
            return Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              color: isCollapsed
                  ? isLight
                      ? Colors.white
                      : AppColors.darkGrey
                  : isDay == 1
                      ? AppColors.dayCard
                      : AppColors.nightCard,
              child: widget ??
                  Text('tempListItem',
                      style: isCollapsed
                          ? Theme.of(context).textTheme.bodyMedium
                          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            );
          },
        ),
      ),
    );
  }
}
