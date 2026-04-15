import 'package:flutter/material.dart';

import 'package:weather_app/screens/home_screen/widgets/activity_card.dart';
import 'package:weather_app/screens/home_screen/widgets/motivation_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actionsPadding: EdgeInsets.only(right: 15),
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   title: Align(
      //       alignment: AlignmentGeometry.centerLeft,
      //       child: Text('Good morning, Night City!')),
      //   automaticallyImplyLeading: false,
      //   actions: [Icon(Icons.settings)],
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.public_sharp), label: 'hello'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.public_sharp), label: 'hello'),
      //   ],
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [MotivationCard(), Spacer(), ActivityCard(), Spacer()],
      ),
    );
  }
}
