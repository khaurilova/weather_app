import 'package:flutter/material.dart';
import 'package:weather_app/api_services/models/forecast_weather.dart';

class WeatherCardWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final List<Text> info;
  const WeatherCardWidget({
    super.key,

    required this.icon,
    required this.label,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .5 - 20,
      height: MediaQuery.sizeOf(context).height * .3,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 249, 239, 236),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Icon(icon), SizedBox(width: 5), Text(label)]),
            Spacer(),

            ...info,
          ],
        ),
      ),
    );
  }
}
