import 'package:flutter/material.dart';

class ContainerDayWeek extends StatelessWidget {
  const ContainerDayWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 224, 224, 224),
            offset: Offset(4, 4),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 8,
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Container Neumorphic',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
