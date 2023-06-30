import 'dart:math' as math;
import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  final DateTime dateTime;
  ClockPainter({
    required this.dateTime,
  });

  //60 sec - 360, 1 sec - 6degree
  //12 hours  - 360, 1 hour - 30degrees, 1 min - 0.5degrees

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final radius = math.min(centerX, centerY);

    final double strokeWidth = 2;
    final double centerRadius = 8;

    final hourHandLength = radius * 0.35;
    final minuteHandLength = radius * 0.45;

    final hourHandThickness = 4.0;
    final minuteHandThickness = 3.0;

    final hour = dateTime.hour % 12;
    final minute = dateTime.minute;

    final hourAngle = (hour * 30 + (minute / 2)) * math.pi / 180;
    final minuteAngle = (minute * 6) * math.pi / 180;

    final hourHandX = centerX + hourHandLength * math.cos(hourAngle);
    final hourHandY = centerY + hourHandLength * math.sin(hourAngle);
    final minuteHandX = centerX + minuteHandLength * math.cos(minuteAngle);
    final minuteHandY = centerY + minuteHandLength * math.sin(minuteAngle);

    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = hourHandThickness
      ..strokeCap = StrokeCap.round;

    final minuteHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = minuteHandThickness
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(centerX, centerY), centerRadius, centerPaint);

    final markerPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < 12; i++) {
      final markerAngle = i * 30 * math.pi / 180;
      final markerX = centerX + (radius - 16) * math.cos(markerAngle);
      final markerY = centerY + (radius - 16) * math.sin(markerAngle);
      final markerEndX = centerX + radius * math.cos(markerAngle);
      final markerEndY = centerY + radius * math.sin(markerAngle);
      canvas.drawLine(
        Offset(markerX, markerY),
        Offset(markerEndX, markerEndY),
        markerPaint,
      );
    }

    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(hourHandX, hourHandY),
      hourHandPaint,
    );

    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(minuteHandX, minuteHandY),
      minuteHandPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
