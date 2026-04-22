import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/common_widgets/weather_card_widget.dart';

class ForecastTiles extends StatelessWidget {
  const ForecastTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        Widget forecastBody = SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            Column(
              children: [
                Row(
                  children: [
                    WeatherCardWidget(
                      icon: Icons.abc,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                    WeatherCardWidget(
                      icon: Icons.ac_unit_sharp,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                  ],
                ),
                Row(
                  children: [
                    WeatherCardWidget(
                      icon: Icons.accessibility_new,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                    WeatherCardWidget(
                      icon: Icons.add_comment_rounded,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                  ],
                ),
                Row(
                  children: [
                    WeatherCardWidget(
                      icon: Icons.add_to_drive_sharp,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                    WeatherCardWidget(
                      icon: Icons.align_vertical_center,
                      label: 'main',
                      info: [Text('${weather.list[0].weather[0].main}')],
                    ),
                  ],
                ),
              ],
            );
          },
        );
        return forecastBody;
      },
    );
  }
}
