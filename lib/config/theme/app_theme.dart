import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal, 
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

const bool dark = true;

class AppTheme{
  final int selectedColor;
  final bool isDarkMode ;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
    }): assert( selectedColor >= 0, 'Selected color must be greater then 0'),
        assert( selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length -1}');

      ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false
        )
      );
}