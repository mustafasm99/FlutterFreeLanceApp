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
  Color get primaryDark => Theme.of(this).primaryColorDark;
  // Access headline large text style
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;

  // Access headline medium text style
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;

  // Access headline small text style
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;

  // Font family
  String get fontFamily => 'Poppins';

  // Font color
  Color get fontColor => const Color(0xFF999999);
  Color get unActive => const Color(0xFFEBEBEB);
  Color get activeNavIcon => const Color(0xFF1c4752);
  Color get inActiveNavIcon => const Color(0xFFf8fbfc);
  Color get hoverColor => const Color(0xFFecf6f9);
}