part of 'forecast_bloc.dart';

@freezed
class ForecastState with _$ForecastState {
  const factory ForecastState.initial() = _Initial;
  const factory ForecastState.loading() = _Loading;

  const factory ForecastState.forecastMade({required ForecastWeather weather}) =
      _ForecastMade;
}
