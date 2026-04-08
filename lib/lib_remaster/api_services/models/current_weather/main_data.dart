import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_data.g.dart';

@JsonSerializable()
class MainData {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int seaLevel;
  @JsonKey(name: 'grnd_level')
  final int grndLevel;

  MainData({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  factory MainData.fromJson(Map<String, dynamic> json) =>
      _$MainDataFromJson(json);
}
