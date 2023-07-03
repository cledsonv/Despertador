import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ContainerAlarm extends StatefulWidget {
  final List<String> listWeek;
  final bool activeAlarm;
  final List<String> dayWeek;
  final String title;
  final void Function(bool)? onActiveAlarm;
  final void Function() onRemove;

  const ContainerAlarm({
    super.key,
    required this.onRemove,
    required this.listWeek,
    required this.onActiveAlarm,
    required this.activeAlarm,
    required this.title,
    required this.dayWeek,
  });

  @override
  State<ContainerAlarm> createState() => _ContainerAlarmState();
}

class _ContainerAlarmState extends State<ContainerAlarm> {
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 50);

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return Neumorphic(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      style: NeumorphicStyle(
        color: const Color(0xffEAD7D7),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(25),
        ),
        intensity: 0.9,
        surfaceIntensity: 0,
        depth: 3,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.title.isNotEmpty
                  ? Row(
                      children: [
                        NeumorphicIcon(
                          Icons.label,
                          size: 28,
                          style: const NeumorphicStyle(
                            color: Color(0xff412234),
                            depth: 10,
                          ),
                        ),
                        const SizedBox(width: 5),
                        AlarmText(
                          text: widget.title,
                          typography: AlarmTypography.body,
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              GestureDetector(
                onTap: () async {
                  TimeOfDay? newTime = await showTimePicker(
                    helpText: 'Selecionar a hora',
                    context: context,
                    initialTime: time,
                  );
                  if (newTime == null) return;
                  setState(() {
                    time = newTime;
                  });
                },
                child: AlarmText(
                  text: '$hours:$minutes',
                  typography: AlarmTypography.hour,
                ),
              ),
              SizedBox(
                height: 30,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.listWeek.length,
                  itemBuilder: (context, idx) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: AlarmText(
                      text: widget.listWeek[idx].substring(0, 3),
                      color: widget.dayWeek.contains(widget.listWeek[idx])
                          ? null
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: widget.onRemove,
                child: const Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    AlarmText(text: 'Excluir'),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          NeumorphicSwitch(
            value: widget.activeAlarm,
            onChanged: widget.onActiveAlarm,
            height: 30,
            style: const NeumorphicSwitchStyle(
              activeThumbColor: Colors.white,
              activeTrackColor: Color.fromARGB(40, 65, 34, 52),
              trackDepth: -4,
            ),
          ),
        ],
      ),
    );
  }
}
