import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/forecast_day_item_model.dart';

class ForecastDaysModel {
  /// ['forecastday']
  List<ForecastDayItemModel> forecastDays;

  ForecastDaysModel({required this.forecastDays});

  factory ForecastDaysModel.fromJson(List<dynamic> json) {
    var days = [];
    json.asMap().forEach((index, forecastDayItem) {
      var dayItem = ForecastDayItemModel.fromJson(json[index]);
      days.add(dayItem);
    });
    List<ForecastDayItemModel> daysList = days.cast<ForecastDayItemModel>();
    return ForecastDaysModel(forecastDays: daysList);
  }
}
