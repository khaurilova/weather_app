import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class WeatherApiService {
  final Dio dio;
  WeatherApiService({required this.dio});

  final String baseURL = 'https://api.openweathermap.org/data/3.0/onecall';
  final String apiKey = '2f3c7d1327560ac385d3596a066b7ac6';

  Future<void> getOverView(
      {required double lat,
      required double lon,
      DateTime? date,
      String? units}) async {
    try {
      final response = await dio.get(
          '$baseURL/overview?lat=$lat&lon=$lon&appid=$apiKey&date=$date&units=$units');
      print(response);
    } catch (e) {
      throw Exception();
    }
  }
}
