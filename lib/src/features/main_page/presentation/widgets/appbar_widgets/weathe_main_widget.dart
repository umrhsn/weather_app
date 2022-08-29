import 'package:flutter/material.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/address_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/body_widget.dart';
import 'package:weather_app/src/features/main_page/presentation/widgets/appbar_widgets/current_temperature_widget.dart';

class WeatherMainWidget extends StatelessWidget {
  const WeatherMainWidget({
    Key? key,
    required this.isLight,
    required this.isCollapsed,
  }) : super(key: key);

  final bool isLight;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isCollapsed ? const Spacer(flex: 2) : const Spacer(flex: 7),
          CurrentTemperatureWidget(isLight: isLight, isCollapsed: isCollapsed),
          isCollapsed ? Container() : AddressWidget(isCollapsed: isCollapsed),
          isCollapsed ? Container() : const Spacer(flex: 2),
          isCollapsed ? Container() : BodyWidget(isCollapsed: isCollapsed),
          isCollapsed ? const Spacer() : const Spacer(flex: 5),
        ],
      ),
    );
  }
}
