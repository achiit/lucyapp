import 'dart:math';

import 'package:flutter/material.dart';

class CircleWithArrowsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double radius = min(centerX, centerY) * 0.8;

    final Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Paint arrowPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(centerX, centerY), radius, circlePaint);

    // Draw arrows
    drawArrow(canvas, centerX, centerY - radius, arrowPaint); // Top
    drawArrow(canvas, centerX, centerY + radius, arrowPaint); // Bottom
    drawArrow(canvas, centerX - radius, centerY, arrowPaint); // Left
    drawArrow(canvas, centerX + radius, centerY, arrowPaint); // Right
  }

  void drawArrow(Canvas canvas, double x, double y, Paint paint) {
    final double arrowWidth = 10.0;
    final double arrowHeight = 20.0;
    final double halfArrowWidth = arrowWidth / 2;

    Path path = Path();
    path.moveTo(x - halfArrowWidth, y);
    path.lineTo(x + halfArrowWidth, y);
    path.lineTo(x, y + arrowHeight);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
