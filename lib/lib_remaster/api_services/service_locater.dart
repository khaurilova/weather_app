import 'package:get_it/get_it.dart';
import 'package:weather_app/lib_remaster/api_services/weather_api_service.dart';

import 'dio.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<DioClient>(() {
    return DioClient(baseUrl: 'https://api.openweathermap.org/data/2.5');
  });

  getIt.registerLazySingleton<WeatherApiService>(() {
    return WeatherApiService(dio: getIt<DioClient>().dio);
  });
}
