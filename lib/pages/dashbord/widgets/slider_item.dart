import 'dart:math';

import 'package:finailtask/extentions/theme_extentions.dart';
import 'package:finailtask/pages/create_project/sliders/slid1.dart';
import 'package:finailtask/util/icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardSliderItem extends StatelessWidget {
  final String title;
  final int counter;
  const DashboardSliderItem({
    super.key,
    required this.title,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 120,
      padding: const EdgeInsets.only(right: 0 , top: 20 , bottom: 0 , left: 30),
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF3c97af), context.primaryColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: context.fontFamily,
                ),
              ),
              Text(
                counter.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),

        Positioned(
          right: 0,
          child: ProjectIcons.SinWave(
            color: Colors.white,
            size: 50,
          ),
        ),

        // CustomPaint(
        //   size: const Size(70, 50),
        //   painter: SineWavePainter(),
        // )
      ]),
    );
  }
}

class SineWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..shader = LinearGradient(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double amplitude = size.height / 4; // Adjust the wave's height
    final double frequency = 1; // Adjust the wave's frequency
    final double phase = pi + 0.5; // Optional phase shift

    // Move to the start of the wave
    path.moveTo(0, size.height / 2);

    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 +
          amplitude * sin((frequency * x / size.width) * 2 * pi + phase);
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
