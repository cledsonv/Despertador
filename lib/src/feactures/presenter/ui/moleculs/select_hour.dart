import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/select_time_zone.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SelectHour extends StatefulWidget {
  final int hour;
  final int minute;
  const SelectHour({super.key, required this.hour, required this.minute});

  @override
  State<SelectHour> createState() => _SelectHourState();
}

class _SelectHourState extends State<SelectHour> {
  int hourConvert = 1;

  @override
  void initState() {
    if (widget.hour == 0) {
      hourConvert = 12;
    } else if (widget.hour > 12) {
      hourConvert = widget.hour - 12;
    } else {
      hourConvert = widget.hour;
    }
    super.initState();
  }

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
              value: hourConvert,
              zeroPad: true,
              infiniteLoop: true,
              onChanged: (value) {
                setState(
                  () {},
                );
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
              value: widget.minute,
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
