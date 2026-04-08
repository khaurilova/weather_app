import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/lib_remaster/api_services/dio.dart';
import 'package:weather_app/lib_remaster/api_services/models/models.dart'
    show CurrentWeather;
import 'package:weather_app/lib_remaster/api_services/service_locater.dart';

class WeatherApiService {
  final Dio dio;
  WeatherApiService({required this.dio});

  final String apiKey = '2f3c7d1327560ac385d3596a066b7ac6';
  final String baseUrl = getIt<DioClient>().baseUrl;

  Future<CurrentWeather> getWeather({
    required double lat,
    required double lon,
    String? units,
    String? mode,
    String? lang,
  }) async {
    try {
      final response = await dio.get(
        '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=$units&mode=$mode&lang=$lang',
      );
      print(response);
      final ourData = CurrentWeather.fromJson(response.data);
      print(ourData);
      return ourData;
    } catch (e) {
      throw Exception();
    }
  }
}
