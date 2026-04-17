part of 'forecast_bloc.dart';

@freezed
class ForecastEvent with _$ForecastEvent {
  const factory ForecastEvent.started() = _Started;
  const factory ForecastEvent.getForecast({
    required double lat,
    required double lon,
  }) = _GetForecast;
}
