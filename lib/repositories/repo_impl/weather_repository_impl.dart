import 'package:weather_app/api_services/models/current_weather/current_weather.dart';
import 'package:weather_app/api_services/weather_api_service.dart';
import 'package:weather_app/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService api;

  WeatherRepositoryImpl({required this.api});

  @override
  Future<CurrentWeather> getWeather({
    required double lat,
    required double lon,
    String? units,
    String? mode,
    String? lang,
  }) async {
    try {
      final response = api.getWeather(lat: lat, lon: lon);
      return response;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<CurrentWeather> getZipWeather({
    required int zip,
    String? units,
    String? mode,
    String? lang,
  }) async {
    try {
      final response = await api.getZipWeather(zip: zip);
      return response;
    } on Exception {
      rethrow;
    }
  }
}
