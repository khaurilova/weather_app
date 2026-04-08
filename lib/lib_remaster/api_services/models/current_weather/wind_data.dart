import 'package:freezed_annotation/freezed_annotation.dart';
part 'wind_data.g.dart';

@JsonSerializable()
class WindData {
  final double speed;
  final int deg;
  final double? gust;
  WindData({required this.speed, required this.deg, this.gust});

  factory WindData.fromJson(Map<String, dynamic> json) =>
      _$WindDataFromJson(json);
}
