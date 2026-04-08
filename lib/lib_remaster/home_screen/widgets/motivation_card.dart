import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MotivationCard extends StatefulWidget {
  const MotivationCard({super.key});

  @override
  State<MotivationCard> createState() => _MotivationCardState();
}

class _MotivationCardState extends State<MotivationCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 40,
        height: 220,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 28, 25, 19),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0x25d7d7d7),
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/sunny/Mask group.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                child: Center(
                  child: Text(
                    'data',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GlassmorphicContainer(
                  width: 30,
                  height: 30,
                  borderRadius: 100,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [0.1, 1],
                  ),
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
                    ),
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
