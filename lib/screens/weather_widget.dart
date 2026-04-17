import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:weather_app/common_widgets/weather_card_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      listener: (context, state) {
        state.whenOrNull(
          weatherObtained: (_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Данные получены')));
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: SizedBox.shrink()),

          loading: () => const Center(child: CircularProgressIndicator()),

          weatherObtained: (weather) => Center(
            child: WeatherCardWidget(
              icon: Icons.check_box,
              label: 'Weather',
              info: [
                Text('Temperature: ${weather.main.temp}'),
                Text('Feels like: ${weather.main.feelsLike}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
