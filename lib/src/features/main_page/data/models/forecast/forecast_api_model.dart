import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/current_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/forecast_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/location/location_model.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_item_entity.dart';

class ForecastApiModel {
  final LocationModel? locationModel;
  final CurrentModel? currentModel;
  final ForecastModel? forecastModel;

  ForecastApiModel({
    required this.locationModel,
    required this.currentModel,
    required this.forecastModel,
  });

  factory ForecastApiModel.fromJson(Map<String, dynamic> json) {
    return ForecastApiModel(
      locationModel: LocationModel.fromJson(json[Endpoint.jsonLocation] as Map<String, dynamic>),
      currentModel: CurrentModel.fromJson(json[Endpoint.jsonCurrent] as Map<String, dynamic>),
      forecastModel: ForecastModel.fromJson(json[Endpoint.jsonForecast] as Map<String, dynamic>),
    );
  }
}
