import 'package:flutter/material.dart';
import 'package:weather_app/src/config/routes/app_routes.dart';
import 'package:weather_app/src/config/themes/app_theme.dart';
import 'package:weather_app/src/core/utils/app_strings.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: AppThemes.appTheme(isLight: true),
      darkTheme: AppThemes.appTheme(isLight: false),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
