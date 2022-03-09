import 'package:bmi_app/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff111639), // App bar
        scaffoldBackgroundColor: Color(0xff111639), // scaff background
      ),
      home: InputPage(),
    );
  }
}

