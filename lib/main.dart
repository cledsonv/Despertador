import 'package:despertador/src/core/inject/inject.dart';
import 'package:despertador/src/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  Inject.inicialize();
  runApp(const MyApp());
}
