import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/day_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/forecast_day_item_model.dart';

class ForecastDayItemEntity extends Equatable {
  final String date;
  final int dateEpoch;
  final DayModel dayModel;
  final ForecastHourModel hoursModel;

  const ForecastDayItemEntity({
    required this.date,
    required this.dateEpoch,
    required this.dayModel,
    required this.hoursModel,
  });

  @override
  List<Object?> get props => [
        date,
        dateEpoch,
        dayModel,
        hoursModel,
      ];
}

class DayEntity extends Equatable {
  final double maxTempCelsius;
  final double minTempCelsius;
  final int chanceOfRain;
  final ConditionModel conditionModel;

  const DayEntity(
      {required this.maxTempCelsius,
      required this.minTempCelsius,
      required this.chanceOfRain,
      required this.conditionModel});

  @override
  List<Object?> get props => [
        maxTempCelsius,
        minTempCelsius,
        chanceOfRain,
        conditionModel,
      ];
}
