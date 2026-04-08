import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem({super.key});

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassmorphicContainer(
          width: 60,
          height: 60,
          borderRadius: 100,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.1),
                Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: [
                0.1,
                1,
              ]),
          border: 1,
          blur: 30,
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.5),
              Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          shape: BoxShape.circle,
          child: Center(
              child: Icon(
            Icons.heart_broken_outlined,
            color: Colors.white,
            size: 20,
          )),
        ),
        SizedBox(
          height: 7,
        ),
        Text('Name')
      ],
    );
  }
}
