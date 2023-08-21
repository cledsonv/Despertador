import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:despertador/src/feactures/domain/entities/alarm_entity.dart';
import 'package:despertador/src/feactures/presenter/controller/alarm_controller.dart';
import 'package:despertador/src/feactures/presenter/ui/atomic/custom_dropdown_button.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/custom_text_field.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_day_week.dart';
import 'package:despertador/src/feactures/presenter/ui/moleculs/select_hour.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ConfigAlarmPage extends StatefulWidget {
  final List<String> listWeek;
  final AlarmEntity alarm;
  final AlarmController ct;

  const ConfigAlarmPage({
    super.key,
    required this.listWeek,
    required this.ct,
    required this.alarm,
  });

  @override
  State<ConfigAlarmPage> createState() => _ConfigAlarmPageState();
}

class _ConfigAlarmPageState extends State<ConfigAlarmPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.alarm.title;
    descriptionController.text = widget.alarm.description;
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
              alarmEntity: widget.alarm.copyWith(
                title: titleController.text,
                description: descriptionController.text,
              ),
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
            alarmEntity: widget.alarm.copyWith(
              title: titleController.text,
              description: descriptionController.text,
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SelectHour(
                hour: DateTime.fromMillisecondsSinceEpoch(widget.alarm.dateTime)
                    .hour,
                minute:
                    DateTime.fromMillisecondsSinceEpoch(widget.alarm.dateTime)
                        .minute,
              ),
              const SizedBox(height: 20),
              SelectDayWeek(
                dayWeek: widget.alarm.dayWeek,
                listWeek: widget.listWeek,
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(
                    title: 'Nome do alarme',
                    textEditingController: titleController,
                    maxLenght: 30,
                    textInputType: TextInputType.text,
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
