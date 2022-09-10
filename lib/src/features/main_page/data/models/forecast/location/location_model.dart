import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  /// ['location']
  const LocationModel({
    required final String city, // name
    required final String region, // region
    required final double latitude, // lat
    required final double longitude, // lon
  }) : super(city: city, region: region, latitude: latitude, longitude: longitude);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      city: json[Endpoint.jsonCity] as String,
      region: json[Endpoint.jsonRegion] as String,
      latitude: json[Endpoint.jsonLatitude] as double,
      longitude: json[Endpoint.jsonLongitude] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        Endpoint.jsonCity: city,
        Endpoint.jsonRegion: region,
        Endpoint.jsonLatitude: latitude,
        Endpoint.jsonLongitude: longitude,
      };
}
