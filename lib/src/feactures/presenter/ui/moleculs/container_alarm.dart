import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ContainerAlarm extends StatefulWidget {
  final List<String> listWeek;
  final bool activeAlarm;
  final List<String> dayWeek;
  final String title;
  final AlarmController ct;
  final AlarmEntity alarm;

  const ContainerAlarm({
    super.key,
    required this.listWeek,
    required this.activeAlarm,
    required this.title,
    required this.dayWeek,
    required this.ct,
    required this.alarm,
  });

  @override
  State<ContainerAlarm> createState() => _ContainerAlarmState();
}

class _ContainerAlarmState extends State<ContainerAlarm> {
  @override
  Widget build(BuildContext context) {
    // final hours = time.hour.toString().padLeft(2, '0');
    // final minutes = time.minute.toString().padLeft(2, '0');
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
                    initialTime: TimeOfDay.now(),
                  );
                  if (newTime == null) return;
                  setState(() {
                    print(newTime);
                    widget.ct.setAlarm(
                      alarm: widget.alarm,
                      hour: newTime.hour,
                      minutes: newTime.minute,
                    );
                  });
                },
                child: AlarmText(
                  text:
                      '${DateTime.fromMillisecondsSinceEpoch(widget.alarm.dateTime).hour.toString().padLeft(2, '0')}:${DateTime.fromMillisecondsSinceEpoch(widget.alarm.dateTime).minute.toString().padLeft(2, '0')}',
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
                onTap: () {
                  setState(
                    () {
                      widget.ct.delete(widget.alarm.id!);
                    },
                  );
                },
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
            onChanged: (value) {
              setState(() {
                widget.ct.update(
                  alarmEntity: widget.alarm.copyWith(active: value),
                );
              });
            },
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
