import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appThemeData => ThemeData(
        primaryColor: Colors.blueAccent,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        ),
      );
}
