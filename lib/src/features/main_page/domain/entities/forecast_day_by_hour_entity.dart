import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';

class ForecastDayByHourEntity extends Equatable {
  final String time;
  final ConditionModel conditionModel;
  final double tempCelsius;

  const ForecastDayByHourEntity({
    required this.time,
    required this.conditionModel,
    required this.tempCelsius,
  });

  @override
  List<Object?> get props => [time, conditionModel, tempCelsius];
}
