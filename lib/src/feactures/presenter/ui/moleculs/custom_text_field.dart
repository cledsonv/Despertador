import 'package:despertador/src/core/widget/alarm_text.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final int? maxLenght;
  final int? maxLines;
  final TextEditingController textEditingController;
  const CustomTextField({
    super.key,
    required this.title,
    this.maxLenght,
    required this.textEditingController,
    required this.hintText,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AlarmText(text: title),
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
            controller: textEditingController,
            maxLines: maxLines,
            maxLength: maxLenght,
            buildCounter: (BuildContext context,
                    {int? currentLength, int? maxLength, bool? isFocused}) =>
                null,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
