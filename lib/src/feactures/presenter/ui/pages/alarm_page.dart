import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/container_alarm.dart';
import 'package:despertador/src/feactures/presenter/ui/pages/config_alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  AlarmController ct = GetIt.I();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Alarme'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ct.create();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: ct.listAlarm.length,
          itemBuilder: (context, idx) {
            var alarm = ct.listAlarm[idx];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConfigAlarmPage(),
                ),
              ),
              child: ContainerAlarm(
                onRemove: () {
                  setState(() {
                    ct.delete(alarm.id!);
                  });
                },
              ),
            );
          }),
    );
  }
}
