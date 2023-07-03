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
            id: widget.alarm.id!,
            title: widget.alarm.title,
            description: widget.alarm.description,
            dayWeek: widget.alarm.dayWeek,
            active: widget.alarm.active,
            createAt: widget.alarm.createAt,
            dateTime: widget.alarm.dateTime,
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
            widget.alarm.active = value;
            widget.ct.update(
              id: widget.alarm.id!,
              dayWeek: widget.alarm.dayWeek,
              title: widget.alarm.title,
              description: widget.alarm.description,
              active: widget.alarm.active,
              dateTime: widget.alarm.dateTime,
              createAt: widget.alarm.createAt,
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
