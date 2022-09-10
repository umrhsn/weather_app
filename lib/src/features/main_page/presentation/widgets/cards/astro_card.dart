import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/core/utils/assets_manager.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';

class AstroCard extends StatefulWidget {
  final bool isLight;
  final bool isCollapsed;

  const AstroCard({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  @override
  State<AstroCard> createState() => _AstroCardState();
}

class _AstroCardState extends State<AstroCard> {
  @override
  Widget build(BuildContext context) {
    var textStyle = AppColors.collapsedMediumTextStyle(context, widget.isCollapsed);

    return CardWidget(
      isLight: widget.isLight,
      isCollapsed: widget.isCollapsed,
      widget: BlocBuilder<AppCubit, AppState>(
        buildWhen: (_, state) {
          return state is GetAstronomySuccess;
        },
        builder: (context, state) {
          var sunrise = '';
          var sunset = '';
          if (state is GetAstronomySuccess) {
            sunrise = state.astro.sunrise;
            sunset = state.astro.sunset;
          }
          debugPrint('sunrise = $sunrise');
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(AppStrings.sunrise, style: textStyle),
                  Text(sunrise, style: textStyle),
                  Image.asset(ImgAssets.sunrise, height: 100)
                ],
              ),
              Column(
                children: [
                  Text(AppStrings.sunrise, style: textStyle),
                  Text(sunset, style: textStyle),
                  Image.asset(ImgAssets.sunset, height: 100)
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
