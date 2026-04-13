import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/lib_remaster/api_services/models/current_weather/current_weather.dart';
import 'package:weather_app/lib_remaster/api_services/service_locater.dart';
import 'package:weather_app/lib_remaster/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(_Initial()) {
    on<_GetWeather>(onGetWeather);
    on<_GetZipWeather>(onGetZipWeather);
  }

  final weatherRepository = getIt<WeatherRepository>();
  Future<void> onGetWeather(
    _GetWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherState.loading());
      final response = await weatherRepository.getWeather(
        lat: event.lat,
        lon: event.lon,
      );
      emit(WeatherState.weatherObtained(weather: response));
    } catch (e) {
      emit(WeatherState.initial());
    }
  }

  Future<void> onGetZipWeather(
    _GetZipWeather event,
    Emitter<WeatherState> emit,
  ) async {
    try {
      emit(WeatherState.loading());
      final response = await weatherRepository.getZipWeather(zip: event.zip);
      emit(WeatherState.weatherObtained(weather: response));
    } catch (e) {
      emit(WeatherState.initial());
    }
  }
}
