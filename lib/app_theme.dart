import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get LightThemeData => ThemeData(
    colorSchemeSeed: Color(0xFF07ADAE),
    //colorSchemeSeed: AppColor.themeColor
    filledButtonTheme: _fillbuttontheme,
    inputDecorationTheme:_inputDecorartionTheme,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22
      )
    )
  );
  static ThemeData get DarkThemeData => ThemeData(
    colorSchemeSeed: Color(0xFF07ADAE),
    brightness: Brightness.dark,
    filledButtonTheme: _fillbuttontheme,
    inputDecorationTheme: _inputDecorartionTheme

  );
  static FilledButtonThemeData get _fillbuttontheme=> FilledButtonThemeData(
      style: FilledButton.styleFrom(
        fixedSize: Size.fromWidth(double.maxFinite),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(vertical: 12),
        textStyle: TextStyle(fontSize: 16, color: Colors.white),
        backgroundColor: Color(0xFF07ADAE),
      )
  );
  static InputDecorationTheme get _inputDecorartionTheme=> InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF07ADAE),
          )
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF07ADAE),
          )
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF07ADAE),
          )
      )


  );
}
