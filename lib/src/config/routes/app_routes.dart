import 'package:flutter/material.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';
import 'package:weather_app/src/features/main_page/presentation/screens/main_page.dart';

class Routes {
  static const String initialRoute = '';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const MainPage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
