import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/domain/entities/astro_entity.dart';

class AstroModel extends AstroEntity {
  const AstroModel({
    required final String sunrise,
    required final String sunset,
  }) : super(sunrise: sunrise, sunset: sunset);

  factory AstroModel.fromJson(Map<String, dynamic> json) {
    return AstroModel(
      sunrise: json[Endpoint.jsonSunrise] as String,
      sunset: json[Endpoint.jsonSunset] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        Endpoint.jsonSunrise: sunrise,
        Endpoint.jsonSunset: sunset,
      };
}
