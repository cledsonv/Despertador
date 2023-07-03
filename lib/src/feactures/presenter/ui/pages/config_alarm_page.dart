import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/custom_dropdown_button.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/custom_text_field.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_day_week.dart';
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
              SelectDayWeek(dayWeek: widget.dayWeek, listWeek: widget.listWeek),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    title: 'Nome do alarme',
                    textEditingController: titleController,
                    maxLenght: 30,
                    hintText: 'Escreva o título para o alarme',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    title: 'Descrição do alarme',
                    textEditingController: descriptionController,
                    maxLines: 6,
                    hintText: 'Escreva a descrição para o alarme',
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
