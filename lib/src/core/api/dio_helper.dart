import 'package:dio/dio.dart';
import 'package:weather_app/src/core/api/endpoint.dart';

class DioHelper {
  static final DioHelper _instance = DioHelper._internal();
  static Dio? dio;

  factory DioHelper() => _instance;

  DioHelper._internal() {
    dio = Dio(BaseOptions(
      baseUrl: '${Endpoint.baseUrl}${Endpoint.version}',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}
