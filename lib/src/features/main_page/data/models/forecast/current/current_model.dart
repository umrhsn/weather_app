import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';
import 'package:weather_app/src/features/main_page/domain/entities/current_entity.dart';

class CurrentModel extends CurrentEntity {
  /// ['current']
  const CurrentModel({
    required final int isDay, // is_day
    required final int lastUpdatedEpoch, // last_updated_epoch
    required final String lastUpdated, // last_updated
    required final double tempCelsius, // temp_c
    required final double feelsLikeCelsius, // feelslike_c
    required final double uvIndex, // uv
    required final double windKph, // wind_kph
    required final int humidity, // humidity
    required final ConditionModel conditionModel, // condition
  }) : super(
          isDay: isDay,
          lastUpdatedEpoch: lastUpdatedEpoch,
          lastUpdated: lastUpdated,
          tempCelsius: tempCelsius,
          feelsLikeCelsius: feelsLikeCelsius,
          uvIndex: uvIndex,
          windKph: windKph,
          humidity: humidity,
          conditionModel: conditionModel,
        );

  factory CurrentModel.fromJson(Map<String, dynamic> json) {
    return CurrentModel(
      isDay: json[Endpoint.jsonIsDay] as int,
      lastUpdatedEpoch: json[Endpoint.jsonLastUpdatedEpoch] as int,
      lastUpdated: json[Endpoint.jsonLastUpdated] as String,
      tempCelsius: json[Endpoint.jsonTempCelsius] as double,
      feelsLikeCelsius: json[Endpoint.jsonFeelsLikeCelsius] as double,
      uvIndex: json[Endpoint.jsonUvIndex] as double,
      windKph: json[Endpoint.jsonWindKph] as double,
      humidity: json[Endpoint.jsonHumidity] as int,
      conditionModel: ConditionModel.fromJson(json[Endpoint.jsonCondition] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        Endpoint.jsonIsDay: isDay,
        Endpoint.jsonLastUpdatedEpoch: lastUpdatedEpoch,
        Endpoint.jsonLastUpdated: lastUpdated,
        Endpoint.jsonTempCelsius: tempCelsius,
        Endpoint.jsonFeelsLikeCelsius: feelsLikeCelsius,
        Endpoint.jsonUvIndex: uvIndex,
        Endpoint.jsonWindKph: windKph,
        Endpoint.jsonHumidity: humidity,
        Endpoint.jsonCondition: conditionModel,
      };
}
