import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'What Todo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.indigo[600],
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
          headline2: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      home: Center(),
    );
  }
}
