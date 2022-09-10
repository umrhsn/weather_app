import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';

class CurrentEntity extends Equatable {
  final int isDay; // is_day
  final int lastUpdatedEpoch; // last_updated_epoch
  final String lastUpdated; // last_updated
  final double tempCelsius; // temp_c
  final double feelsLikeCelsius; // feelslike_c
  final double uvIndex; // uv
  final double windKph; // wind_kph
  final int humidity; // humidity
  final ConditionModel conditionModel; // condition

  const CurrentEntity({
    required this.isDay,
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempCelsius,
    required this.feelsLikeCelsius,
    required this.uvIndex,
    required this.windKph,
    required this.humidity,
    required this.conditionModel,
  });

  @override
  List<Object?> get props => [
        isDay,
        lastUpdatedEpoch,
        lastUpdated,
        tempCelsius,
        feelsLikeCelsius,
        uvIndex,
        windKph,
        humidity,
        conditionModel,
      ];
}

class ConditionEntity extends Equatable {
  final String imgUrl;

  const ConditionEntity({required this.imgUrl});

  @override
  List<Object?> get props => [imgUrl];
}
