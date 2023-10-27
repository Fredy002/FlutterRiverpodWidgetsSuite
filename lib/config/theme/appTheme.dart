// ignore_for_file: file_names

import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.black,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.deepOrange,
  Colors.deepPurple
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false, this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        //appBarTheme: const AppBarTheme(centerTitle: false)
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode);
}
