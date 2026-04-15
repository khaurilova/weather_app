import 'package:weather_app/api_services/models/current_weather/current_weather.dart';

abstract class WeatherRepository {
  Future<CurrentWeather> getWeather({
    required double lat,
    required double lon,
    String? units,
    String? mode,
    String? lang,
  });

  Future<CurrentWeather> getZipWeather({
    required int zip,
    String? units,
    String? mode,
    String? lang,
  });
}
