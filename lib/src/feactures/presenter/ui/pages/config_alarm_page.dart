import 'dart:math';

import 'package:despertador/src/feactures/presenter/ui/moleculs/clock_painter.dart';
import 'package:flutter/material.dart';

class ConfigAlarmPage extends StatelessWidget {
  const ConfigAlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 175,
                  height: 175,
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: CustomPaint(
                      painter: ClockPainter(dateTime: DateTime.now()),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
