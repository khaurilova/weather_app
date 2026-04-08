import 'package:flutter/material.dart';
import 'package:weather_app/lib_remaster/home_screen/widgets/activity_item.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 40,
        height: 220,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 210, 207, 199),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x25d7d7d7),
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: Text('See all'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisExtent: 115.0,
                          crossAxisCount: 4,
                        ),
                    itemCount: 11,
                    itemBuilder: (context, index) {
                      return ActivityItem();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
