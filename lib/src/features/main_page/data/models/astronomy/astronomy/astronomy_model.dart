import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/data/models/astronomy/astronomy/astro_model.dart';

class AstronomyModel {
  final AstroModel? astroModel;

  AstronomyModel({required this.astroModel});

  factory AstronomyModel.fromJson(Map<String, dynamic> json) {
    return AstronomyModel(
      astroModel: AstroModel.fromJson(
        json[Endpoint.jsonAstro] as Map<String, dynamic>,
      ),
    );
  }
}
