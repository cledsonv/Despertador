import 'package:despertador/src/feactures/presenter/ui/moleculs/clock_view.dart';
import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Relógio'),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Text(
                '12:60',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const Text('Seg, 29 de maio de 2023'),
              const SizedBox(height: 20),
              const Center(
                child: ClockView(),
              ),
            ],
          ),
        ));
  }
}
