import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  primaryColorLight: const Color(0xFFE1F1F5),
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  primaryColorDark: const Color(0xFF3C97AF),
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    headlineSmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFFE1F1F5), // This is the onActiveColor
  ),
);