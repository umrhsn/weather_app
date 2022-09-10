part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class GetForecastLoading extends AppState {}

class GetForecastSuccess extends AppState {
  final CurrentEntity current;
  final ConditionEntity condition;

  final LocationEntity location;

  final ForecastDaysEntity forecast;

  const GetForecastSuccess({
    required this.current,
    required this.condition,
    required this.location,
    required this.forecast,
  });

  @override
  List<Object> get props => [
        current,
        condition,
        location,
        forecast,
      ];
}

class GetAstronomyLoading extends AppState {}

class GetAstronomySuccess extends AppState {
  final AstroEntity astro;

  const GetAstronomySuccess({required this.astro});

  @override
  List<Object> get props => [astro];
}
