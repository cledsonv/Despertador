import 'dart:async';
import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/container_alarm.dart';
import 'package:despertador/src/feactures/presenter/ui/pages/config_alarm_page.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import 'dart:math' as math;

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  AlarmController ct = GetIt.I();
  DateTime date = DateTime.now();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        date = DateTime.now();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAD7D7),
      floatingActionButton: NeumorphicFloatingActionButton(
        style: const NeumorphicStyle(
          color: Color(0xff593A58),
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        onPressed: () {
          setState(
            () {
              ct.create();
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlarmText(
                    text: DateFormat('HH:mm').format(date),
                    typography: AlarmTypography.clock,
                  ),
                  Transform.rotate(
                    angle: -math.pi / 2,
                    child: const AlarmText(
                      text: 'PM',
                      typography: AlarmTypography.title,
                    ),
                  ),
                ],
              ),
            ),
            SliverList.builder(
              itemCount: ct.listAlarm.length,
              itemBuilder: (context, idx) {
                var alarm = ct.listAlarm[idx];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ConfigAlarmPage(dayWeek: ct.listWeek),
                    ),
                  ),
                  child: ContainerAlarm(
                    activeAlarm: alarm.active,
                    dayWeek: ct.listWeek,
                    onActiveAlarm: (value) {
                      setState(() {
                        alarm.active = value;
                        ct.update(
                          id: alarm.id!,
                          title: alarm.title,
                          active: alarm.active,
                          dateTime: alarm.dateTime,
                          createAt: alarm.createAt,
                        );
                      });
                    },
                    onRemove: () {
                      setState(
                        () {
                          ct.delete(alarm.id!);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
