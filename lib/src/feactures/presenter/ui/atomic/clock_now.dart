import 'dart:async';

import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class ClockNow extends StatefulWidget {
  const ClockNow({super.key});

  @override
  State<ClockNow> createState() => _ClockNowState();
}

class _ClockNowState extends State<ClockNow> {
  DateTime date = DateTime.now();

  @override
  void initState() {
    if (mounted) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          date = DateTime.now();
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlarmText(
          text: DateFormat('HH:mm').format(date),
          typography: AlarmTypography.clock,
        ),
        Transform.rotate(
          angle: -math.pi / 2,
          child: const AlarmText(
            text: 'PM',
            typography: AlarmTypography.title,
          ),
        ),
      ],
    );
  }
}
