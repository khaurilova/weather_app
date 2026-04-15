import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_data.g.dart';

@JsonSerializable()
class WeatherData {
  final int id;
  final String main;
  final String description;
  final String icon;
  WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
