import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/api_services/models/forecast_weather.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/service_locater.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';
part 'forecast_bloc.freezed.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  ForecastBloc() : super(_Initial()) {
    on<_GetForecast>(onGetForecast);
  }
  final weatherRepository = getIt<WeatherRepository>();
  Future<void> onGetForecast(
    _GetForecast event,
    Emitter<ForecastState> emit,
  ) async {
    try {
      emit(ForecastState.loading());
      final response = await weatherRepository.getForecast(
        lat: event.lat,
        lon: event.lon,
      );
      emit(ForecastState.forecastMade(weather: response));
    } catch (e) {
      emit(ForecastState.initial());
    }
  }
}
