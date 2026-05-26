import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const NazvaApp());
}

class NazvaApp extends StatelessWidget {
  const NazvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nazva',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F1FA),
        primaryColor: const Color(0xFF7E57C2),
        fontFamily: 'Roboto',
      ),
      home: const WelcomePage(),
    );
  }
}