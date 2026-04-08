import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/lib_remaster/activities_screen.dart';
import 'package:weather_app/lib_remaster/api_services/dio.dart';
import 'package:weather_app/lib_remaster/api_services/whether_api_secrvice.dart';
import 'package:weather_app/lib_remaster/home_screen/home_screen.dart';
import 'package:weather_app/lib_remaster/reflection_screen.dart';

import 'api_services/service_locater.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = NotchBottomBarController();
  final _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> bottomBarPages = [
      HomeScreen(),
      const ReflectionScreen(),
      const ActivitiesScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
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
            onDoubleTap: () {
              getIt<WeatherApiService>().getWeather(
                lat: 51.509865,
                lon: -0.118092,
              );
            },
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),

      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: _controller,
        color: Color(0xff333333),
        bottomBarItems: [
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_outlined,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.star_outline,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            activeItem: Stack(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff333333),
                  ),
                ),
                Icon(Icons.star, color: Color(0xff33433)),
              ],
            ),
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.star,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            activeItem: Icon(
              Icons.star,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        kIconSize: 24,
        kBottomRadius: 15,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.public_sharp), label: 'hello'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.public_sharp), label: 'hello'),
      //   ],
      // ),
    );
  }
}
