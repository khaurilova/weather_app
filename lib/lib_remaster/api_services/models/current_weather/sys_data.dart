import 'package:freezed_annotation/freezed_annotation.dart';
part 'sys_data.g.dart';

@JsonSerializable()
class SysData {
  final int? type;
  final int? id;
  final String country;
  final int sunrise;
  final int sunset;

  SysData({
    this.type,
    this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysData.fromJson(Map<String, dynamic> json) =>
      _$SysDataFromJson(json);
}
