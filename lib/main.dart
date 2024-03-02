import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sportivo_website/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sportivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false).copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}
