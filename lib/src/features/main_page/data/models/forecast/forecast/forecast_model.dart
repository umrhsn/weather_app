import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/forecast_days_model.dart';

class ForecastModel {
  /// ['forecast']
  final ForecastDaysModel? forecastDayModel;

  ForecastModel({required this.forecastDayModel});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastDayModel: ForecastDaysModel.fromJson(json[Endpoint.jsonForecastDay]),
    );
  }
}
