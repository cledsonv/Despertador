import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:flutter/material.dart';

class SelectTimeZone extends StatelessWidget {
  final void Function()? onPressedAM;
  final void Function()? onPressedPM;
  const SelectTimeZone({
    super.key,
    required this.onPressedAM,
    required this.onPressedPM,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressedAM,
          child: const AlarmText(
            text: 'AM',
            typography: AlarmTypography.title,
            color: true ? null : Colors.grey,
          ),
        ),
        TextButton(
          onPressed: onPressedPM,
          child: const AlarmText(
            text: 'PM',
            typography: AlarmTypography.title,
            color: false ? null : Colors.grey,
          ),
        ),
      ],
    );
  }
}
