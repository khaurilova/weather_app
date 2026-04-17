import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/common_widgets/weather_card_widget.dart';

import '../blocs/forecast_bloc/forecast_bloc.dart';

class ForecastBlocWidget extends StatelessWidget {
  const ForecastBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForecastBloc, ForecastState>(
      listener: (context, state) {
        state.whenOrNull(
          forecastMade: (_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Данные получены')));
          },
        );
      },
      builder: (context, state) {
        Widget forecastBody = SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            forecastBody = WeatherCardWidget(
              icon: Icons.do_not_disturb_off_rounded,
              label: 'You are here',
              info: [
                Text('City: ${weather.city.name}'),
                Text('0: ${weather.city.population}'),
              ],
            );
          },
        );
        return forecastBody;
      },
    );
  }
}
