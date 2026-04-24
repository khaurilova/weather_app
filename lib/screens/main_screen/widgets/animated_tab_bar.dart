import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/screens/main_screen/widgets/tab_bar_item.dart';

class AnimatedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AnimatedTabBar({
    super.key,
    required this.preferredSize,
    required this.selectedForecastIndex,
  });

  final ValueNotifier<int> selectedForecastIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        Widget tabBarBody = const SizedBox.shrink();
        state.whenOrNull(
          forecastMade: (weather) {
            tabBarBody = DefaultTabController(
              length: weather.list.length,
              child: ValueListenableBuilder<int>(
                valueListenable: selectedForecastIndex,
                builder: (context, selectedIndex, _) {
                  final activeIndex = selectedIndex.clamp(
                    0,
                    weather.list.length - 1,
                  );

                  return TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                    labelPadding: const EdgeInsets.only(left: 14),
                    onTap: (index) => selectedForecastIndex.value = index,
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
            );
          },
        );

        return tabBarBody;
      },
    );
  }

  @override
  final Size preferredSize;
}
