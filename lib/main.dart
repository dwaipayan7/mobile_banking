import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_banking/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Banking App',
      theme: ThemeData(
        textTheme: GoogleFonts.jostTextTheme(),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

