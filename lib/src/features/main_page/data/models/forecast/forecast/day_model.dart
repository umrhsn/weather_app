import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_item_entity.dart';

class DayModel extends DayEntity {
  /// ['day']
  const DayModel(
      {required final double maxTempCelsius,
      required final double minTempCelsius,
      required final int chanceOfRain,
      required final ConditionModel conditionModel,
      required})
      : super(
          maxTempCelsius: maxTempCelsius,
          minTempCelsius: minTempCelsius,
          chanceOfRain: chanceOfRain,
          conditionModel: conditionModel,
        );

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      maxTempCelsius: json[Endpoint.jsonMaxTempCelsius] as double,
      minTempCelsius: json[Endpoint.jsonMinTempCelsius] as double,
      chanceOfRain: json[Endpoint.jsonChanceOfRain] as int,
      conditionModel: ConditionModel.fromJson(json[Endpoint.jsonCondition] as Map<String, dynamic>),
    );
  }
}
