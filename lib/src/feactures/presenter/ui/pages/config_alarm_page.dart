import 'dart:math';

import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
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

            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) => ContainerDayWeek(),
              ),
            ),
           Neumorphic
          ],
        ),
      ),
    );
  }
}
// GestureDetector(
//             onTap: () async {
//               TimeOfDay? newTime = await showTimePicker(
//                 context: context,
//                 initialTime: time,
//               );
//               if (newTime == null) return;
//               setState(() {
//                 time = newTime;
//               });
//             },
//             child: Text(
//               '$hours:$minutes',
//               style: Theme.of(context).textTheme.headlineLarge,
//             ),
//           ),