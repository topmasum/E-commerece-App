import 'package:flutter/material.dart';
class AppTheme{
  static ThemeData get LightThemeData=> ThemeData(
      colorSchemeSeed: Color(0xFF07ADAE)
  );
  static ThemeData get DarkThemeData=> ThemeData(
      colorSchemeSeed: Color(0xFF07ADAE),
    brightness: Brightness.dark
  );
}