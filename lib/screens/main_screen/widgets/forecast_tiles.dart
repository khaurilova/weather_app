import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/common_widgets/weather_card_widget.dart';

class ForecastTiles extends StatelessWidget {
  const ForecastTiles({super.key, required this.selectedForecastIndex});

  final ValueListenable<int> selectedForecastIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        Widget forecastBody = const SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            forecastBody = ValueListenableBuilder<int>(
              valueListenable: selectedForecastIndex,
              builder: (context, selectedIndex, _) {
                final forecastItem = weather
                    .list[selectedIndex.clamp(0, weather.list.length - 1)];

                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          WeatherCardWidget(
                            icon: Icons.abc,
                            label: 'main',
                            info: [Text(forecastItem.weather.first.main)],
                          ),
                          const SizedBox(width: 8),
                          WeatherCardWidget(
                            icon: Icons.thermostat,
                            label: 'temperature',
                            info: [Text('${forecastItem.main.temp}')],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          WeatherCardWidget(
                            icon: Icons.water_drop,
                            label: 'humidity',
                            info: [Text('${forecastItem.main.humidity}%')],
                          ),
                          const SizedBox(width: 8),
                          WeatherCardWidget(
                            icon: Icons.air,
                            label: 'wind',
                            info: [Text('${forecastItem.wind.speed} m/s')],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          WeatherCardWidget(
                            icon: Icons.cloud,
                            label: 'clouds',
                            info: [Text('${forecastItem.clouds.all}%')],
                          ),
                          const SizedBox(width: 8),
                          WeatherCardWidget(
                            icon: Icons.compress,
                            label: 'pressure',
                            info: [Text('${forecastItem.main.pressure} hPa')],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
        return forecastBody;
      },
    );
  }
}
