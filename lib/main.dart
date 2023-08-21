import 'package:alarm/alarm.dart';
import 'package:despertador/src/core/inject/inject.dart';
import 'package:despertador/src/my_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Alarm.init();
  Inject.inicialize();

  runApp(const MyApp());
}
