// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sys_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysData _$SysDataFromJson(Map<String, dynamic> json) => SysData(
  type: (json['type'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  country: json['country'] as String,
  sunrise: (json['sunrise'] as num).toInt(),
  sunset: (json['sunset'] as num).toInt(),
);

Map<String, dynamic> _$SysDataToJson(SysData instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
