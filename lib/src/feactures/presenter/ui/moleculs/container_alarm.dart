import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:flutter/material.dart';

class ContainerAlarm extends StatefulWidget {
  final void Function() onRemove;
  const ContainerAlarm({super.key, required this.onRemove});

  @override
  State<ContainerAlarm> createState() => _ContainerAlarmState();
}

class _ContainerAlarmState extends State<ContainerAlarm> {
  TimeOfDay time = const TimeOfDay(hour: 10, minute: 50);

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    bool switchValue = false;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.blueGrey[500],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.label),
              const SizedBox(width: 5),
              const Text('Trabalho'),
              const Spacer(),
              SizedBox(
                height: 30,
                width: 35,
                child: Transform.scale(
                  transformHitTests: false,
                  scale: .7,
                  child: Switch(
                    value: switchValue,
                    onChanged: (value) {
                      setState(() {
                        switchValue = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: time,
              );
              if (newTime == null) return;
              setState(() {
                time = newTime;
              });
            },
            child: Text(
              '$hours:$minutes',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          const Row(
            children: [
              Text('Seg, Ter, Qua, Qui, Sex'),
              Spacer(),
              Icon(Icons.arrow_drop_down_circle),
            ],
          ),
          ContainerDayWeek(),
          GestureDetector(
            onTap: widget.onRemove,
            child: const Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 5),
                Text('Excluir'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
