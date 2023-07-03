import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/container_alarm.dart';
import 'package:despertador/src/feactures/presenter/ui/pages/config_alarm_page.dart';
import 'package:flutter/material.dart';

class ListContainerAlarm extends StatefulWidget {
  final AlarmEntity alarm;
  final AlarmController ct;
  const ListContainerAlarm({super.key, required this.alarm, required this.ct});

  @override
  State<ListContainerAlarm> createState() => _ListContainerAlarmState();
}

class _ListContainerAlarmState extends State<ListContainerAlarm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfigAlarmPage(
            listWeek: widget.ct.listWeek,
            alarm: widget.alarm,
            ct: widget.ct,
          ),
        ),
      ),
      child: ContainerAlarm(
        activeAlarm: widget.alarm.active,
        listWeek: widget.ct.listWeek,
        dayWeek: widget.alarm.dayWeek,
        title: widget.alarm.title,
        onActiveAlarm: (value) {
          setState(() {
            widget.ct.update(
              alarmEntity: widget.alarm.copyWith(active: value),
            );
          });
        },
        onRemove: () {
          setState(
            () {
              widget.ct.delete(widget.alarm.id!);
            },
          );
        },
      ),
    );
  }
}
