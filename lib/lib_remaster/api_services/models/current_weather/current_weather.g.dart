// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      coord: CoordsData.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherData.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
      main: MainData.fromJson(json['main'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num).toInt(),
      wind: WindData.fromJson(json['wind'] as Map<String, dynamic>),
      rain: json['rain'] == null
          ? null
          : RainData.fromJson(json['rain'] as Map<String, dynamic>),
      clouds: CloudsData.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: (json['dt'] as num).toInt(),
      sys: SysData.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: (json['timezone'] as num).toInt(),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      cod: (json['cod'] as num).toInt(),
    );

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'rain': instance.rain,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

CoordsData _$CoordsDataFromJson(Map<String, dynamic> json) => CoordsData(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$CoordsDataToJson(CoordsData instance) =>
    <String, dynamic>{'lon': instance.lon, 'lat': instance.lat};

RainData _$RainDataFromJson(Map<String, dynamic> json) =>
    RainData(hour: (json['1h'] as num?)?.toDouble());

Map<String, dynamic> _$RainDataToJson(RainData instance) => <String, dynamic>{
  '1h': instance.hour,
};

CloudsData _$CloudsDataFromJson(Map<String, dynamic> json) =>
    CloudsData(all: (json['all'] as num).toInt());

Map<String, dynamic> _$CloudsDataToJson(CloudsData instance) =>
    <String, dynamic>{'all': instance.all};
