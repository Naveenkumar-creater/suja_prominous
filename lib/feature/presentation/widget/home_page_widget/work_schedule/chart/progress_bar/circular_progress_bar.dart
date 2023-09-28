import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
 
    Paint circle = Paint()
      ..color = Colors.black
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 70;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = 15
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    double angle = 2 * pi * (0/ 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
 
    return true;
  }
}
