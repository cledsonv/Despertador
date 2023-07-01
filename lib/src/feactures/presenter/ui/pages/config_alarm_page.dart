import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/custom_dropdown_button.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_hour.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ConfigAlarmPage extends StatefulWidget {
  final List<String> dayWeek;
  //final void Function() onSelectWeek;
  const ConfigAlarmPage({super.key, required this.dayWeek});

  @override
  State<ConfigAlarmPage> createState() => _ConfigAlarmPageState();
}

class _ConfigAlarmPageState extends State<ConfigAlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAD7D7),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SelectHour(),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                child: ListView.builder(
                  itemCount: widget.dayWeek.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) => InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Center(
                        child: ContainerDayWeek(
                          isSelect: false,
                          text: widget.dayWeek[idx].substring(0, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AlarmText(text: 'Nome do alarme'),
                  const SizedBox(height: 10),
                  Neumorphic(
                    style: NeumorphicStyle(
                      color: const Color(0xffEAD7D7),
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(25),
                      ),
                      intensity: 0.9,
                      surfaceIntensity: 0,
                      depth: -3,
                    ),
                    child: const TextField(
                      maxLength: 30,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          border: InputBorder.none,
                          hintText: 'Escreva o título para o alarme'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AlarmText(text: 'Descrição do alarme'),
                  const SizedBox(height: 10),
                  Neumorphic(
                    style: NeumorphicStyle(
                      color: const Color(0xffEAD7D7),
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(25),
                      ),
                      intensity: 0.9,
                      surfaceIntensity: 0,
                      depth: -3,
                    ),
                    child: const TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          border: InputBorder.none,
                          hintText: 'Escreva a descrição para o alarme'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AlarmText(text: 'Escolha um toque'),
                  const SizedBox(height: 10),
                  const CustomDropdownButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
