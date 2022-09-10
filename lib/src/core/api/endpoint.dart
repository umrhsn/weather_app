class Endpoint {
  static const String baseUrl = 'https://api.weatherapi.com';
  static const String version = '/v1';
  static const String apiKey = '882d316f165b4cf995b124925220709';

  /// queries
  static const String queryKey = 'key';
  static const String queryQ = 'q';
  static const String queryDays = 'days';
  static const String queryAqi = 'aqi';
  static const String queryAlerts = 'alerts';
  static const String queryDate = 'dt';

  /// yes and no
  static const String no = 'no';
  static const String yes = 'yes';

  /// json objects
  /// [forecast] endpoint
  /// example api call:
  // baseUrl
  // version
  // current
  // queryKey{apiKey}
  // queryQ{Cairo}
  // queryDays{7}
  // queryAqi{yes}"
  // queryAlerts{yes}"
  static const String forecast = '/forecast.json';
  // location
  static const String jsonLocation = 'location';
  static const String jsonCity = 'name';
  static const String jsonRegion = 'region';
  static const String jsonLatitude = 'lat';
  static const String jsonLongitude = 'lon';
  // current
  static const String jsonCurrent = 'current';
  static const String jsonIsDay = 'is_day';
  static const String jsonLastUpdatedEpoch = 'last_updated_epoch';
  static const String jsonLastUpdated = 'last_updated';
  static const String jsonTempCelsius = 'temp_c';
  static const String jsonFeelsLikeCelsius = 'feelslike_c';
  static const String jsonUvIndex = 'uv';
  static const String jsonWindKph = 'wind_kph';
  static const String jsonHumidity = 'humidity';
  static const String jsonCondition = 'condition';
  static const String jsonImgUrl = 'icon';
  // forecast
  static const String jsonForecast = 'forecast';
  static const String jsonForecastDay = 'forecastday';
  static const String jsonDate = 'date';
  static const String jsonDateEpoch = 'date_epoch';
  static const String jsonDay = 'day';
  static const String jsonMaxTempCelsius = 'maxtemp_c';
  static const String jsonMinTempCelsius = 'mintemp_c';
  static const String jsonChanceOfRain = 'daily_chance_of_rain';
  static const String jsonHour = 'hour';
  static const String jsonTime = 'time';

  /// [astronomy] endpoint
  /// example api call:
  /// "baseUrl
  /// version
  /// astronomy
  /// queryKey{apiKey}
  /// queryQ{Cairo}
  /// queryDate{2022-09-10}"
  static const String astronomy = '/astronomy.json';

  // astronomy
  static const String jsonAstronomy = 'astronomy';
  static const String jsonAstro = 'astro';
  static const String jsonSunrise = 'sunrise';
  static const String jsonSunset = 'sunset';
}
