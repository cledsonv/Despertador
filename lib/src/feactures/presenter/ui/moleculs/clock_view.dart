import 'dart:math';
import 'package:despertador/src/feactures/presenter/ui/moleculs/clock_painter.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(16),
      style: const NeumorphicStyle(
        color: Color(0xffEAD7D7),
        boxShape: NeumorphicBoxShape.circle(),
        intensity: 0.9,
        surfaceIntensity: 0,
        depth: -3,
        shadowLightColor: Colors.white,
      ),
      child: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: const NeumorphicStyle(
          color: Color(0xffEAD7D7),
          boxShape: NeumorphicBoxShape.circle(),
          intensity: 0.6,
          surfaceIntensity: 0,
          depth: 5,
          shadowLightColor: Colors.white,
        ),
        child: Neumorphic(
          style: const NeumorphicStyle(
            color: Color(0xffEAD7D7),
            boxShape: NeumorphicBoxShape.circle(),
            intensity: 0.9,
            surfaceIntensity: 0,
            depth: 3,
            shadowLightColor: Colors.white,
          ),
          child: SizedBox(
            width: 175,
            height: 175,
            child: Transform.rotate(
              angle: -pi / 2,
              child: CustomPaint(
                painter: ClockPainter(dateTime: DateTime.now()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
