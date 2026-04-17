import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/api_services/models/forecast_weather.dart';
import 'package:weather_app/api_services/models/models.dart';
import 'package:weather_app/dio.dart';

import 'package:weather_app/service_locater.dart';

class WeatherApiService {
  final Dio dio;
  WeatherApiService({required this.dio});

  final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  final String baseUrl = getIt<DioClient>().baseUrl;

  Future<CurrentWeather> getWeather({
    required double lat,
    required double lon,
    String? units,
    String? mode,
    String? lang,
  }) async {
    try {
      if (apiKey.isEmpty) {
        throw const FormatException(
          'OPENWEATHER_API_KEY is missing in the .env file',
        );
      }
      final response = await dio.get(
        '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=$units&mode=$mode&lang=$lang',
      );
      print(response);
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw FormatException(
          'Expected weather response as JSON object, got ${data.runtimeType}',
        );
      }
      final ourData = CurrentWeather.fromJson(data);
      print(ourData);
      return ourData;
    } catch (e) {
      throw Exception();
    }
  }

  Future<CurrentWeather> getZipWeather({
    required int zip,
    String? mode,
    String? lang,
    String? units,
  }) async {
    try {
      if (apiKey.isEmpty) {
        throw const FormatException(
          'OPENWEATHER_API_KEY is missing in the .env file',
        );
      }
      final response = await dio.get(
        '$baseUrl/weather?zip=$zip&appid=$apiKey&units=$units&mode=$mode&lang=$lang',
      );
      print(response);
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw FormatException(
          'Expected weather response as JSON object, got ${data.runtimeType}',
        );
      }
      final ourData = CurrentWeather.fromJson(data);
      return ourData;
    } catch (e) {
      throw Exception();
    }
  }

  Future<ForecastWeather> getForecast({
    required double lat,
    required double lon,
    String? mode,
    String? lang,
    String? units,
    int? cnt,
  }) async {
    try {
      if (apiKey.isEmpty) {
        throw const FormatException(
          'OPENWEATHER_API_KEY is missing in the .env file',
        );
      }
      final response = await dio.get(
        '$baseUrl/forecast?lat=$lat&lon=$lon&appid=$apiKey',
      );
      print(response);
      final data = response.data;
      if (data is! Map<String, dynamic>) {
        throw FormatException(
          'Expected weather response as JSON object, got ${data.runtimeType}',
        );
      }
      final ourData = ForecastWeather.fromJson(data);
      return ourData;
    } catch (e) {
      throw Exception();
    }
  }
}
