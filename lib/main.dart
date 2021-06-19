import 'package:flutter/material.dart';
import 'package:bmicalculator/input_page.dart';


void main() {
  runApp(BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF2B3347),
        scaffoldBackgroundColor: Color(0xFF2B3347),
        textTheme: TextTheme(
          bodyText2: TextStyle(
              color: Color(0xFFFFFFFF),
          ),
        )
      ),
      home: InputPage(),
      routes: {
        '/mainPage': (context) => InputPage()
      },
    );
  }
}

