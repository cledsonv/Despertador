import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/clock_view.dart';
import 'package:flutter/material.dart';

class ConfigAlarmPage extends StatelessWidget {
  final List<String> dayWeek;
  //final void Function() onSelectWeek;
  const ConfigAlarmPage({super.key, required this.dayWeek});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAD7D7),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(child: ClockView()),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              child: ListView.builder(
                itemCount: dayWeek.length,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, idx) => InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Center(
                      child: ContainerDayWeek(
                        isSelect: false,
                        text: dayWeek[idx].substring(0, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: AlarmText(
                  text: 'Próximo alarme programado\npara daqui a 4 horas.',
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
    );
  }
}
