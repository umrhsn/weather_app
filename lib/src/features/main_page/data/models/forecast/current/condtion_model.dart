import 'package:weather_app/src/core/api/endpoint.dart';
import 'package:weather_app/src/features/main_page/domain/entities/current_entity.dart';

class ConditionModel extends ConditionEntity {
  const ConditionModel({required final String imgUrl}) : super(imgUrl: imgUrl);

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(imgUrl: json[Endpoint.jsonImgUrl] as String);
  }

  Map<String, dynamic> toJson() => {Endpoint.jsonImgUrl: imgUrl};
}
