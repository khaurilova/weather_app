import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TabBarItem extends StatelessWidget {
  final bool isSelected;
  final String date;
  const TabBarItem({super.key, required this.isSelected, required this.date});

  @override
  Widget build(BuildContext context) {
    DateTime parsedDate = DateTime.parse(date);

    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(parsedDate);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 102, 145, 183)
            : Colors.transparent,

        border: BoxBorder.all(
          color: isSelected
              ? Colors.transparent
              : const Color.fromARGB(255, 31, 35, 34),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          '$formattedDate',
          style: TextStyle(
            color: isSelected
                ? const Color.fromARGB(255, 240, 240, 240)
                : const Color.fromARGB(255, 31, 35, 34),
          ),
        ),
      ),
    );
  }
}
