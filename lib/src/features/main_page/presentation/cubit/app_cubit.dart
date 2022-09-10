import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/api/dio_helper.dart';
import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/astronomy/astronomy_api_model.dart';
import 'package:weather_app/src/features/main_page/data/models/forecast/forecast_api_model.dart';
import 'package:weather_app/src/features/main_page/domain/entities/astro_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/current_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_by_hour_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_day_item_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/forecast_days_entity.dart';
import 'package:weather_app/src/features/main_page/domain/entities/location_entity.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  ForecastApiModel? _forecastApiModel;
  AstronomyApiModel? _astronomyApiModel;

  void getForecastData() async {
    DioHelper();

    emit(GetForecastLoading());
    _printState('GetForecastLoading');

    Response forecastResponse = await DioHelper.getData(url: Endpoint.forecast, query: {
      Endpoint.queryKey: Endpoint.apiKey,
      Endpoint.queryQ: 'Cairo', // TODO: according to location
      Endpoint.queryDays: 7,
      Endpoint.queryAqi: Endpoint.yes,
      Endpoint.queryAlerts: Endpoint.yes,
    });

    _forecastApiModel = ForecastApiModel.fromJson(forecastResponse.data);

    var currentModel = _forecastApiModel!.currentModel!;
    var isDay = currentModel.isDay;
    var lastUpdatedEpoch = currentModel.lastUpdatedEpoch;
    var lastUpdated = currentModel.lastUpdated;
    var tempCelsius = currentModel.tempCelsius;
    var feelsLikeCelsius = currentModel.feelsLikeCelsius;
    var uvIndex = currentModel.uvIndex;
    var windKph = currentModel.windKph;
    var humidity = currentModel.humidity;
    var currentConditionModel = currentModel.conditionModel;
    var currentImgUrl = currentConditionModel.imgUrl;
    CurrentEntity current = CurrentEntity(
      isDay: isDay,
      lastUpdatedEpoch: lastUpdatedEpoch,
      lastUpdated: lastUpdated,
      tempCelsius: tempCelsius,
      feelsLikeCelsius: feelsLikeCelsius,
      uvIndex: uvIndex,
      windKph: windKph,
      humidity: humidity,
      conditionModel: currentConditionModel,
    );
    ConditionEntity currentCondition = ConditionEntity(imgUrl: currentImgUrl);
    _printCurrent(current);

    var locationModel = _forecastApiModel!.locationModel!;
    var city = locationModel.city;
    var region = locationModel.region;
    var latitude = locationModel.latitude;
    var longitude = locationModel.longitude;
    LocationEntity location = LocationEntity(
      city: city,
      region: region,
      latitude: latitude,
      longitude: longitude,
    );
    _printLocation(location);

    var forecastModel = _forecastApiModel!.forecastModel!;
    var forecastDayModel = forecastModel.forecastDayModel!;
    var forecastDays = forecastDayModel.forecastDays;
    for (var day in forecastDays) {
      var date = day.date;
      var dateEpoch = day.dateEpoch;
      var dayModel = day.dayModel;
      var minTempCelsius = dayModel.minTempCelsius;
      var maxTempCelsius = dayModel.minTempCelsius;
      var chanceOfRain = dayModel.chanceOfRain;
      var forecastConditionModel = dayModel.conditionModel;
      var forecastImgUrl = forecastConditionModel.imgUrl;
      var hoursModel = day.hoursModel;
      var hoursList = day.hoursModel.forecastDaysByHour;
      for (var hour in hoursList) {
        var time = hour.time;
        var conditionModel = hour.conditionModel;
        var hourImgUrl = conditionModel.imgUrl;
        var tempCelsius = hour.tempCelsius;
        ForecastDayByHourEntity(
          time: time,
          conditionModel: conditionModel,
          tempCelsius: tempCelsius,
        );
        ConditionEntity(imgUrl: hourImgUrl);
      }
      ForecastDayItemEntity forecastDayItem = ForecastDayItemEntity(
          date: date, dateEpoch: dateEpoch, dayModel: dayModel, hoursModel: hoursModel);
      DayEntity(
          maxTempCelsius: maxTempCelsius,
          minTempCelsius: minTempCelsius,
          chanceOfRain: chanceOfRain,
          conditionModel: forecastConditionModel);
      ConditionEntity(imgUrl: forecastImgUrl);
      _printForecastDayItem(forecastDayItem);
    }
    ForecastDaysEntity forecastDaysEntity = ForecastDaysEntity(forecastDays: forecastDays);

    emit(GetForecastSuccess(
      current: current,
      condition: currentCondition,
      location: location,
      forecast: forecastDaysEntity,
    ));
    _printState('GetForecastSuccess');
  }

  void getAstronomyData() async {
    DioHelper();

    emit(GetAstronomyLoading());
    _printState('GetAstronomyLoading');

    Response astronomyResponse = await DioHelper.getData(url: Endpoint.astronomy, query: {
      Endpoint.queryKey: Endpoint.apiKey,
      Endpoint.queryQ: 'Cairo', // TODO: according to location
      Endpoint.queryDate: '2022-09-10', // TODO: get current day
    });

    _astronomyApiModel = AstronomyApiModel.fromJson(astronomyResponse.data);

    String sunrise = _astronomyApiModel!.astronomyModel!.astroModel!.sunrise;
    String sunset = _astronomyApiModel!.astronomyModel!.astroModel!.sunset;

    AstroEntity astro = AstroEntity(sunrise: sunrise, sunset: sunset);

    _printAstro(astro);

    emit(GetAstronomySuccess(astro: astro));
    _printState('GetAstronomySuccess');
  }
}

void _printState(String name) => debugPrint('state is $name');

void _printCurrent(CurrentEntity current) {
  debugPrint('-----------------CurrentEntity----------------');
  debugPrint('isDay = ${current.isDay}');
  debugPrint('lastUpdatedEpoch = ${current.lastUpdatedEpoch}');
  debugPrint('lastUpdated = ${current.lastUpdated}');
  debugPrint('tempCelsius = ${current.tempCelsius}');
  debugPrint('feelsLikeCelsius = ${current.feelsLikeCelsius}');
  debugPrint('uvIndex = ${current.uvIndex}');
  debugPrint('windKph = ${current.windKph}');
  debugPrint('humidity = ${current.humidity}');
  debugPrint('imgUrl = ${current.conditionModel.imgUrl}');
}

void _printLocation(LocationEntity location) {
  debugPrint('-----------------LocationEntity----------------');
  debugPrint('city = ${location.city}');
  debugPrint('region = ${location.region}');
  debugPrint('latitude = ${location.latitude}');
  debugPrint('longitude = ${location.longitude}');
}

void _printForecastDayItem(ForecastDayItemEntity forecastDay) {
  debugPrint('-----------------ForecastDayItemEntity----------------');
  debugPrint('date = ${forecastDay.date}');
  debugPrint('dateEpoch = ${forecastDay.dateEpoch}');
  debugPrint('maxTempCelsius = ${forecastDay.dayModel.maxTempCelsius}');
  debugPrint('maxTempCelsius = ${forecastDay.dayModel.maxTempCelsius}');
}

void _printAstro(AstroEntity astro) {
  debugPrint('-----------------AstroEntity----------------');
  debugPrint('sunrise = ${astro.sunrise}');
  debugPrint('sunset = ${astro.sunset}');
}
