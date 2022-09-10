import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/config/themes/system/system_overlay_style.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/app_dimens.dart';
import 'package:weather_app/src/features/main_page/presentation/cubit/app_cubit.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/widgets/texts/region_text.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/main_widget.dart';

// ignore: must_be_immutable
class WeatherAppBar extends StatelessWidget {
  bool isCollapsed;
  bool isLight;

  WeatherAppBar({super.key, required this.isCollapsed, required this.isLight});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: AppDimens.sliverAppBarCollapsedHeight,
      expandedHeight: AppDimens.sliverAppBarExpandedHeight,
      pinned: true,
      systemOverlayStyle: _setSystemOverlayStyle(),
      backgroundColor: _setBackgroundColor(),
      title: _buildTitleWidget(),
      flexibleSpace: _buildFlexibleSpaceBar(),
      iconTheme: _setIconTheme(context),
    );
  }

  SystemUiOverlayStyle _setSystemOverlayStyle() {
    return isCollapsed
        ? isLight
            ? AppSystemUiOverlayStyle.light
            : AppSystemUiOverlayStyle.dark
        : AppSystemUiOverlayStyle.dark;
  }

  Color _setBackgroundColor() {
    return isLight ? AppColors.lightGrey : AppColors.black;
  }

  RegionText? _buildTitleWidget() {
    return isCollapsed ? RegionText(isCollapsed: isCollapsed) : null;
  }

  FlexibleSpaceBar _buildFlexibleSpaceBar() {
    return FlexibleSpaceBar(
      expandedTitleScale: AppDimens.sliverAppBarScaleFactor,
      collapseMode: CollapseMode.none,
      titlePadding: EdgeInsets.only(top: isCollapsed ? 0 : 50, right: 20, left: 20),
      title: MainWidget(isLight: isLight, isCollapsed: isCollapsed),
      background: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          var isDay = 1;
          if (state is GetForecastSuccess) {
            isDay = state.current.isDay;
          }
          return Container(color: isDay == 1 ? AppColors.day : AppColors.night);
        },
      ),
    );
  }

  IconThemeData _setIconTheme(BuildContext context) {
    return !isCollapsed
        ? Theme.of(context).iconTheme.copyWith(color: Colors.white)
        : Theme.of(context).iconTheme;
  }
}
