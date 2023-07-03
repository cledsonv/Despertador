import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/custom_dropdown_button.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_hour.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ConfigAlarmPage extends StatefulWidget {
  final List<String> dayWeek;
  final String id;
  final String title;
  final String description;
  final AlarmController ct;
  final bool active;
  final int dateTime;
  final int createAt;

  //final void Function() onSelectWeek;
  const ConfigAlarmPage(
      {super.key,
      required this.dayWeek,
      required this.title,
      required this.description,
      required this.ct,
      required this.active,
      required this.dateTime,
      required this.createAt,
      required this.id});

  @override
  State<ConfigAlarmPage> createState() => _ConfigAlarmPageState();
}

class _ConfigAlarmPageState extends State<ConfigAlarmPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
    super.initState();
  }

  @override
  void dispose() {
    titleController;
    descriptionController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAD7D7),
      appBar: AppBar(
        backgroundColor: const Color(0xffEAD7D7),
        title: AlarmText(
          text: widget.title,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          widget.ct.update(
            id: widget.id,
            title: titleController.text,
            description: descriptionController.text,
            active: widget.active,
            dateTime: widget.dateTime,
            createAt: widget.createAt,
          );
        },
      ),
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
                    child: TextField(
                      controller: titleController,
                      maxLength: 30,
                      buildCounter: (BuildContext context,
                              {int? currentLength,
                              int? maxLength,
                              bool? isFocused}) =>
                          null,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: InputBorder.none,
                        hintText: 'Escreva o título para o alarme',
                      ),
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
                    child: TextField(
                      controller: descriptionController,
                      maxLines: 6,
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: InputBorder.none,
                        hintText: 'Escreva a descrição para o alarme',
                      ),
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
