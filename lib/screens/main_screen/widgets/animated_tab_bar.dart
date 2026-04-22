import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api_services/models/forecast_weather.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/screens/main_screen/widgets/forecast_tiles.dart';
import 'package:weather_app/screens/main_screen/widgets/tab_bar_item.dart';

class AnimatedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedTabBar({super.key, required this.preferredSize});

  @override
  Widget build(BuildContext context) {
    final controller;

    final animation;
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        Widget tapBarBody = SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            tapBarBody = DefaultTabController(
              length: weather.list.length,
              child: Builder(
                builder: (context) => AnimatedBuilder(
                  animation:
                      DefaultTabController.of(context).animation ??
                      DefaultTabController.of(context),
                  builder: (context, widget) {
                    final activeIndex =
                        (DefaultTabController.of(context).animation?.value ??
                                DefaultTabController.of(
                                  context,
                                ).index.toDouble())
                            .round()
                            .clamp(0, weather.list.length - 1);
                    return TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.symmetric(horizontal: 5),
                      // controller: TabController(length:weather.list.length , vsync: TickerProvider),
                      tabs: List.generate(
                        weather.list.length,
                        (index) => TabBarItem(
                          isSelected: activeIndex == index,
                          date: weather.list[index].dtTxt,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
        return Column(children: [tapBarBody, ForecastTiles()]);
      },
    );
  }

  @override
  final Size preferredSize;
}
