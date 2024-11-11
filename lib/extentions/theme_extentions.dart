import 'package:flutter/material.dart';

extension ThemeContext on BuildContext {
  // Access primary color
  Color get primaryColor => Theme.of(this).primaryColor;

  // Access scaffold background color
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  // Access primary color light
  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  // Access secondary color (onActiveColor)
  Color get onActiveColor => Theme.of(this).colorScheme.secondary;

  // Access headline large text style
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  // Access headline medium text style
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  // Access headline small text style
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
}
