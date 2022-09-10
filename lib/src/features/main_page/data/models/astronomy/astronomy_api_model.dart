import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/astronomy/astronomy/astronomy_model.dart';

class AstronomyApiModel {
  /// ['astronomy']
  final AstronomyModel? astronomyModel;

  AstronomyApiModel({required this.astronomyModel});

  factory AstronomyApiModel.fromJson(Map<String, dynamic> json) {
    return AstronomyApiModel(
      astronomyModel: AstronomyModel.fromJson(
        json[Endpoint.jsonAstronomy] as Map<String, dynamic>,
      ),
    );
  }
}
