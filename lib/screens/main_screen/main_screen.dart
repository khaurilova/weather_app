import 'package:flutter/material.dart';
import 'package:weather_app/api_services/models/current_weather/current_weather.dart';
import 'package:weather_app/blocs/forecast_bloc/forecast_bloc.dart';
import 'package:weather_app/blocs/weather_bloc/weather_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/screens/forecast_bloc_widget.dart';
import 'package:weather_app/common_widgets/weather_card_widget.dart';
import 'package:weather_app/screens/main_screen/widgets/animated_tab_bar.dart';
import 'package:weather_app/screens/main_screen/widgets/tab_bar_item.dart';
import 'package:weather_app/screens/weather_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  CurrentWeather? weatherData;
  // final _controller = NotchBottomBarController();
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final List<Widget> bottomBarPages = [
    //   HomeScreen(),
    //   const ReflectionScreen(),
    //   const ActivitiesScreen(),
    // ];
    return Scaffold(
      appBar: AppBar(
        bottom: AnimatedTabBar(preferredSize: Size.fromHeight(50)),
        actionsPadding: EdgeInsets.only(right: 15),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Align(
          alignment: AlignmentGeometry.centerLeft,
          child: Text('Good morning, Night City!'),
        ),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onLongPress: () {
              context.read<ForecastBloc>().add(
                const ForecastEvent.getForecast(lat: 51.509865, lon: -0.118092),
              );
            },
            onTap: () {
              context.read<WeatherBloc>().add(
                const WeatherEvent.getZipWeather(zip: 10456),
              );
            },
            onDoubleTap: () {
              context.read<WeatherBloc>().add(
                const WeatherEvent.getWeather(lat: 51.509865, lon: -0.118092),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: SizedBox.shrink(),
    );
  }
}
         

      
      
      // weatherData != null
      //     ? SizedBox(
      //         width: 360,
      //         height: 250,
      //         child: DecoratedBox(
      //           decoration: BoxDecoration(
      //             color: const Color.fromARGB(255, 249, 239, 236),
      //             borderRadius: BorderRadius.circular(15),
      //           ),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               if (weatherData != null)
      //                 Column(
      //                   children: [
      //                     Text('Tempreture: ${weatherData!.main.temp},'),
      //                     Text('Feels like: ${weatherData!.main.feelsLike}'),
      //                   ],
      //                 ),
      //             ],
      //           ),
      //         ),
      //       )
      //     : SizedBox.shrink(),
    
    //       PageView(
    //         controller: _pageController,
    //         physics: const NeverScrollableScrollPhysics(),
    //         children: List.generate(
    //           bottomBarPages.length,
    //           (index) => bottomBarPages[index],
    //         ),
    //       ),

    //       bottomNavigationBar: AnimatedNotchBottomBar(
    //         notchBottomBarController: _controller,
    //         color: Color(0xff333333),
    //         bottomBarItems: [
    //           const BottomBarItem(
    //             inActiveItem: Icon(
    //               Icons.home_outlined,
    //               color: Color.fromARGB(255, 255, 255, 255),
    //             ),
    //             activeItem: Icon(
    //               Icons.home_filled,
    //               color: Color.fromARGB(255, 255, 255, 255),
    //             ),
    //           ),
    //           const BottomBarItem(
    //             inActiveItem: Icon(
    //               Icons.star_outline,
    //               color: Color.fromARGB(255, 255, 255, 255),
    //             ),
    //             activeItem: Stack(
    //               children: [
    //                 DecoratedBox(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.circle,
    //                     color: Color(0xff333333),
    //                   ),
    //                 ),
    //                 Icon(Icons.star, color: Color(0xff33433)),
    //               ],
    //             ),
    //           ),
    //           const BottomBarItem(
    //             inActiveItem: Icon(
    //               Icons.star,
    //               color: Color.fromARGB(255, 255, 255, 255),
    //             ),
    //             activeItem: Icon(
    //               Icons.star,
    //               color: Color.fromARGB(255, 255, 255, 255),
    //             ),
    //           ),
    //         ],
    //         onTap: (index) {
    //           _pageController.jumpToPage(index);
    //         },
    //         kIconSize: 24,
    //         kBottomRadius: 15,
    //       ),
    //       // bottomNavigationBar: BottomNavigationBar(
    //       //   items: [
    //       //     BottomNavigationBarItem(
    //       //         icon: Icon(Icons.public_sharp), label: 'hello'),
    //       //     BottomNavigationBarItem(
    //       //         icon: Icon(Icons.public_sharp), label: 'hello'),
    //       //   ],
    //       // ),
    //     );



