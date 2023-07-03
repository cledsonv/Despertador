import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ContainerDayWeek extends StatelessWidget {
  final bool isSelect;
  final String text;
  const ContainerDayWeek(
      {super.key, required this.isSelect, required this.text});

  @override
  Widget build(BuildContext context) {
    return isSelect
        ? Neumorphic(
            style: NeumorphicStyle(
              color: const Color.fromARGB(136, 65, 34, 52),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              intensity: 0.9,
              depth: -3,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: AlarmText(
              text: text,
              typography: AlarmTypography.body,
              color: Colors.white,
            ),
          )
        : Neumorphic(
            style: NeumorphicStyle(
              color: const Color(0xffEAD7D7),
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
              intensity: 0.9,
              depth: 3,
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: AlarmText(
              text: text,
              typography: AlarmTypography.body,
            ),
          );
  }
}
