import 'package:equatable/equatable.dart';

class LocationEntity extends Equatable {
  final String city;
  final String region;
  final double latitude;
  final double longitude;

  const LocationEntity(
      {required this.city, required this.region, required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [city, region, latitude, longitude];
}
