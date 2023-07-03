import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/clock_now.dart';
import 'package:despertador/src/feactures/presenter/ui/organisms/list_container_alarm.dart';
import 'package:get_it/get_it.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

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
            const SliverToBoxAdapter(
              child: ClockNow(),
            ),
            SliverList.builder(
              itemCount: ct.listAlarm.length,
              itemBuilder: (context, idx) {
                var alarm = ct.listAlarm[idx];
                return ListContainerAlarm(
                  alarm: alarm,
                  ct: ct,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
