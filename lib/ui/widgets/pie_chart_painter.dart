import 'dart:math';

import 'package:flutter/material.dart';

class PieChartPainter extends CustomPainter {
  final double currentProgress;
  final Color color;
  final double outlineWidth;

  PieChartPainter({
    this.currentProgress,
    this.color,
    this.outlineWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = outlineWidth
      ..color = color
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = false
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 10;

    canvas.drawCircle(center, radius + outlineWidth + outlineWidth / 2,
        outerCircle); // this draws main outer circle

    double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      true,
      completeArc,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
