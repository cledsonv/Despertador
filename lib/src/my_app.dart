import 'package:despertador/src/feactures/presenter/ui/pages/alarm_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.leagueSpartanTextTheme(),
      ),
      home: AlarmPage(),
    );
  }
}
