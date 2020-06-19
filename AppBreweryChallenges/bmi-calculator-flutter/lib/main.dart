import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = 0xFF0A0E21;
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(backgroundColor),
        scaffoldBackgroundColor: Color(backgroundColor),
      ),
    );
  }
}
