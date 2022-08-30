import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/media_query_values.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/weather_appbar.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/info_card/info_card.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/sunset_sunrise_card.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/today_card.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/card_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/today_temp_list.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/cards/week_card/week_card.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  /// [_scrollController] here is meant to detect if [_appBarCollapsed] or not
  late ScrollController _scrollController;
  bool _appBarCollapsed = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (isCollapsed() && !_appBarCollapsed) {
          setState(() => _appBarCollapsed = true);
        } else if (!isCollapsed() && _appBarCollapsed) {
          setState(() => _appBarCollapsed = false);
        }
      });
  }

  bool isCollapsed() =>
      _scrollController.hasClients && _scrollController.offset > (230 - kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isLight = context.brightness == Brightness.light;

    List<Widget> widgetsList = [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TodayTemperaturesList(isLight: isLight, isCollapsed: _appBarCollapsed),
            TodayCard(isLight: isLight, isCollapsed: _appBarCollapsed),
            WeekCard(isLight: isLight, isCollapsed: _appBarCollapsed),
            SunsetSunriseCard(isLight: isLight, isCollapsed: _appBarCollapsed),
            InfoCard(isLight: isLight, isCollapsed: _appBarCollapsed),
          ],
        ),
      )
    ];

    return Scaffold(
      // TODO: change [backgroundColor] dynamically with [SliverAppBar] color change
      backgroundColor: _appBarCollapsed
          ? isLight
              ? AppColors.lightGrey
              : AppColors.black
          // TODO: change background color according to day-night status of user's location
          : AppColors.night,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          WeatherAppBar(isCollapsed: _appBarCollapsed, isLight: isLight),
          SliverList(
            delegate: SliverChildListDelegate(widgetsList),
          )
        ],
        scrollBehavior:
            // TODO: Search for the new way to implement AndroidOverscrollIndicator
            // ignore: deprecated_member_use
            const ScrollBehavior(androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      ),
      drawer: const Drawer(
          // TODO: to be implemented
          // TODO: make the drawer positioned widget not default drawer
          ),
    );
  }
}
