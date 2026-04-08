import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/lib_remaster/api_services/models/current_weather/main_data.dart';
import 'package:weather_app/lib_remaster/api_services/models/current_weather/sys_data.dart';

import 'package:weather_app/lib_remaster/api_services/models/current_weather/weather_data.dart';
import 'package:weather_app/lib_remaster/api_services/models/current_weather/wind_data.dart';

part 'current_weather.g.dart';

@JsonSerializable()
class CurrentWeather {
  final CoordsData coord;
  final List<WeatherData> weather;
  final String base;
  final MainData main;
  final int visibility;
  final WindData wind;
  final RainData rain;
  final CloudsData clouds;
  final int dt;
  final SysData sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}

@JsonSerializable()
class CoordsData {
  final double lon;
  final double lat;

  CoordsData({required this.lon, required this.lat});

  factory CoordsData.fromJson(Map<String, dynamic> json) =>
      _$CoordsDataFromJson(json);
}

@JsonSerializable()
class RainData {
  @JsonKey(name: '1h')
  final double hour;

  RainData({required this.hour});

  factory RainData.fromJson(Map<String, dynamic> json) =>
      _$RainDataFromJson(json);
}

@JsonSerializable()
class CloudsData {
  final int all;

  CloudsData({required this.all});

  factory CloudsData.fromJson(Map<String, dynamic> json) =>
      _$CloudsDataFromJson(json);
}
