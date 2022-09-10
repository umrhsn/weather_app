import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';

class RegionText extends StatelessWidget {
  const RegionText({
    Key? key,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    // TODO: change icon to location_off according to location status
    return Row(children: [
      BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var region = '';
          if (state is GetForecastSuccess) {
            region = state.location.region;
          }
          return Text(
            region,
            style: !isCollapsed
                ? const TextStyle(color: Colors.white)
                : Theme.of(context).textTheme.titleMedium,
          );
        },
      ),
      Icon(
        Icons.location_on,
        color: !isCollapsed ? Colors.white : Theme.of(context).iconTheme.color,
        size: !isCollapsed ? null : 18,
      )
    ]);
  }
}
