import 'package:intl/intl.dart';

class AppStrings {
  static const String appName = 'WeatherApp';

  /// app route
  static const String noRouteFound = 'No Route Found';

  /// Date-time
  static String sunrise = 'Sunrise';
  static String sunset = 'Sunset';
  static String dayNow = DateFormat('E').format(DateTime.now());
  static String hourNow = DateFormat('h:mm a').format(DateTime.now()).toLowerCase();
}
