// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

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
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = const Color(0xFF444974);

    var outlineBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var centerFillBrush = Paint()..color = const Color(0xFFEAECFF);

    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 25, fillBrush);
    canvas.drawCircle(center, radius - 25, outlineBrush);

    var hourHandX = centerX +
        0.4 *
            radius *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        0.4 *
            radius *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 0.5 * radius * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerY + 0.5 * radius * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    var secHandX = centerX + 0.7 * radius * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerY + 0.7 * radius * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    canvas.drawCircle(center, 10, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 30) {
      if (i % 90 == 0) {
        var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
        var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

        var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
        var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
        canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
