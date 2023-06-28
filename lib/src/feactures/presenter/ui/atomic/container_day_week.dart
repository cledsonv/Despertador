import 'package:flutter/material.dart';

class ContainerDayWeek extends StatelessWidget {
  const ContainerDayWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text('S'),
      ),
    );
  }
}
