import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/container_day_week.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/custom_dropdown_button.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_hour.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ConfigAlarmPage extends StatefulWidget {
  final List<String> listWeek;
  final String id;
  final String title;
  final String description;
  final List<String> dayWeek;
  final AlarmController ct;
  final bool active;
  final int dateTime;
  final int createAt;

  //final void Function() onSelectWeek;
  const ConfigAlarmPage(
      {super.key,
      required this.listWeek,
      required this.title,
      required this.description,
      required this.ct,
      required this.active,
      required this.dateTime,
      required this.createAt,
      required this.id,
      required this.dayWeek});

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
          text: titleController.text,
          overflow: TextOverflow.ellipsis,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.ct.update(
              id: widget.id,
              title: titleController.text,
              description: descriptionController.text,
              active: widget.active,
              dayWeek: widget.dayWeek,
              dateTime: widget.dateTime,
              createAt: widget.createAt,
            );
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff593A58),
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
        onPressed: () {
          widget.ct.update(
            id: widget.id,
            title: titleController.text,
            description: descriptionController.text,
            active: widget.active,
            dayWeek: widget.dayWeek,
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
                  itemCount: widget.listWeek.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, idx) => InkWell(
                    onTap: () {
                      setState(() {
                        widget.dayWeek.contains(widget.listWeek[idx])
                            ? widget.dayWeek.remove(widget.listWeek[idx])
                            : widget.dayWeek.add(widget.listWeek[idx]);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Center(
                        child: ContainerDayWeek(
                          isSelect: widget.dayWeek.contains(
                            widget.listWeek[idx],
                          ),
                          text: widget.listWeek[idx].substring(0, 1),
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
