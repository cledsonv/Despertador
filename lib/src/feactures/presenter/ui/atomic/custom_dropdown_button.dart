import 'package:neumorphic_ui/neumorphic_ui.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: const Color(0xffEAD7D7),
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(25),
        ),
        intensity: 0.9,
        surfaceIntensity: 0,
        depth: -3,
      ),
      child: DropdownButton(
        isExpanded: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        value: 'assets/marimba.mp3',
        items: const [
          DropdownMenuItem<String>(
            value: 'assets/marimba.mp3',
            child: Text('Marimba'),
          ),
          DropdownMenuItem<String>(
            value: 'assets/nokia.mp3',
            child: Text('Nokia'),
          ),
          DropdownMenuItem<String>(
            value: 'assets/mozart.mp3',
            child: Text('Mozart'),
          ),
          DropdownMenuItem<String>(
            value: 'assets/star_wars.mp3',
            child: Text('Star Wars'),
          ),
          DropdownMenuItem<String>(
            value: 'assets/one_piece.mp3',
            child: Text('One Piece'),
          ),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
