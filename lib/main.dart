import 'package:flutter/material.dart';
import 'Input_page.dart';
import 'Results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        primaryColor: Color(0xff0A0E22),
        buttonColor: Colors.pink,
        scaffoldBackgroundColor: Color(0xff0A0E22),
        accentColor: Colors.pink,
      ),
      home: InputPage(),
    );
  }
}
