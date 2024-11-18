import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
  primaryColorLight: const Color.fromARGB(255, 0, 0, 0),
  primarySwatch: Colors.blue,
  primaryColor: const Color(0xFFA0D2DF),
  primaryColorDark: const Color(0xFF3C97AF),
  scaffoldBackgroundColor: const Color(0xFFF7FBFC),
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    headlineSmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color.fromARGB(255, 255, 255, 255), // This is the onActiveColor
  ),
);