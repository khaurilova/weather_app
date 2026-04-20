import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api_services/models/forecast_weather.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/screens/main_screen/widgets/tab_bar_item.dart';

class AnimatedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedTabBar({super.key, required this.preferredSize});

  @override
  Widget build(BuildContext context) {
    final controller = DefaultTabController.of(context);
    final animation = controller.animation;
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        Widget forecastBody = SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            forecastBody = AnimatedBuilder(
              animation: animation ?? controller,
              builder: (context, widget) {
                return TabBar(
                  isScrollable: true,
                  // controller: TabController(length:weather.list.length , vsync: TickerProvider),
                  tabs: List.generate(
                    weather.list.length,
                    (index) => TabBarItem(
                      isSelected: true,
                      date: weather.list[index].dtTxt,
                    ),
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

  @override
  final Size preferredSize;
}
