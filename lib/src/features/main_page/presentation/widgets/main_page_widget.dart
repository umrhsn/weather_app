import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_colors.dart';
import 'package:weather_app/src/core/utils/media_query_values.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar/weather_appbar.dart';

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
          setState(() {
            _appBarCollapsed = true;
          });
        } else if (!isCollapsed() && _appBarCollapsed) {
          setState(() {
            _appBarCollapsed = false;
          });
        }
      });
  }

  bool isCollapsed() =>
      _scrollController.hasClients && _scrollController.offset > (230 - kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    bool isLight = context.brightness == Brightness.light;
    var testListItem = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          color: _appBarCollapsed
              ? isLight
                  ? Colors.white
                  : AppColors.darkGrey
              // TODO: change card color according to day-night status of user's location
              : AppColors.nightCard,
        ),
      ),
    );

    List<Widget> sliverChildrenList = [
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            testListItem,
            testListItem,
            testListItem,
            testListItem,
            testListItem,
            testListItem
          ],
        ),
      )
    ];

    return Scaffold(
      // TODO: change [backgroundColor] dynamically with [SliverAppBar] color change
      backgroundColor: _appBarCollapsed
          ? isLight
              ? AppColors.backgroundLight
              : AppColors.backgroundDark
          // TODO: change background color according to day-night status of user's location
          : AppColors.night,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          WeatherAppBar(isCollapsed: _appBarCollapsed, isLight: isLight),
          SliverList(
            delegate: SliverChildListDelegate(sliverChildrenList),
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
