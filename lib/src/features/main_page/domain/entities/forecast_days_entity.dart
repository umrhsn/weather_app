import 'package:equatable/equatable.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast/forecast_day_item_model.dart';

class ForecastDaysEntity extends Equatable {
  final List<ForecastDayItemModel> forecastDays;

  const ForecastDaysEntity({required this.forecastDays});

  @override
  List<Object?> get props => throw UnimplementedError();
}
