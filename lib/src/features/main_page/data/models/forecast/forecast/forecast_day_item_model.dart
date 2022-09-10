import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/current/condtion_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/day_model.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_by_hour_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_item_entity.dart';

class ForecastDayItemModel extends ForecastDayItemEntity {
  const ForecastDayItemModel({
    required final String date,
    required final int dateEpoch,
    required final DayModel dayModel,
    required final ForecastHourModel forecastHourModel,
  }) : super(date: date, dateEpoch: dateEpoch, dayModel: dayModel, hoursModel: forecastHourModel);

  factory ForecastDayItemModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayItemModel(
      date: json[Endpoint.jsonDate] as String,
      dateEpoch: json[Endpoint.jsonDateEpoch] as int,
      dayModel: DayModel.fromJson(json[Endpoint.jsonDay] as Map<String, dynamic>),
      forecastHourModel: ForecastHourModel.fromJson(json[Endpoint.jsonHour] as List<dynamic>),
    );
  }
}

class ForecastHourModel {
  List<ForecastDayByHourModel> forecastDaysByHour;

  ForecastHourModel({required this.forecastDaysByHour});

  factory ForecastHourModel.fromJson(List<dynamic> json) {
    var hours = [];
    json.asMap().forEach((index, forecastDayItem) {
      var hourItem = ForecastDayByHourModel.fromJson(json[index]);
      hours.add(hourItem);
    });
    List<ForecastDayByHourModel> hoursList = hours.cast<ForecastDayByHourModel>();
    return ForecastHourModel(forecastDaysByHour: hoursList);
  }
}

class ForecastDayByHourModel extends ForecastDayByHourEntity {
  const ForecastDayByHourModel({
    required final String time,
    required final ConditionModel conditionModel,
    required final double tempCelsius,
  }) : super(time: time, conditionModel: conditionModel, tempCelsius: tempCelsius);

  factory ForecastDayByHourModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayByHourModel(
      time: json[Endpoint.jsonTime],
      conditionModel: ConditionModel.fromJson(json[Endpoint.jsonCondition]),
      tempCelsius: json[Endpoint.jsonTempCelsius],
    );
  }
}
