// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindData _$WindDataFromJson(Map<String, dynamic> json) => WindData(
  speed: (json['speed'] as num).toDouble(),
  deg: (json['deg'] as num).toInt(),
  gust: (json['gust'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WindDataToJson(WindData instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
  'gust': instance.gust,
};
