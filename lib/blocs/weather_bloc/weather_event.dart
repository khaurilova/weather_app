part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.started() = _Started;
  const factory WeatherEvent.getWeather({
    required double lat,
    required double lon,
  }) = _GetWeather;
  const factory WeatherEvent.getZipWeather({required int zip}) = _GetZipWeather;
}
