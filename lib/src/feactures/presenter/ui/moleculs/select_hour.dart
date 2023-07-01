import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/select_time_zone.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectHour extends StatefulWidget {
  const SelectHour({super.key});

  @override
  State<SelectHour> createState() => _SelectHourState();
}

class _SelectHourState extends State<SelectHour> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              minValue: 1,
              maxValue: 12,
              value: 3,
              zeroPad: true,
              infiniteLoop: true,
              onChanged: (value) {
                setState(() {});
              },
              itemWidth: 100,
              itemHeight: 75,
              textStyle: const TextStyle(
                color: Color.fromARGB(114, 65, 34, 52),
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
              selectedTextStyle: const TextStyle(
                color: Color(0xff412234),
                fontSize: 60,
                fontWeight: FontWeight.w600,
              ),
            ),
            const AlarmText(
              text: ':',
              typography: AlarmTypography.hour,
            ),
            NumberPicker(
              minValue: 0,
              maxValue: 59,
              value: 23,
              zeroPad: true,
              infiniteLoop: true,
              itemWidth: 100,
              itemHeight: 75,
              onChanged: (value) {
                setState(() {});
              },
              textStyle: const TextStyle(
                color: Color.fromARGB(114, 65, 34, 52),
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
              selectedTextStyle: const TextStyle(
                color: Color(0xff412234),
                fontSize: 60,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SelectTimeZone(
          onPressedAM: () {},
          onPressedPM: () {},
        ),
      ],
    );
  }
}
