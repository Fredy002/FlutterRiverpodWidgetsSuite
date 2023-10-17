import 'package:flutter/material.dart';
import 'package:widgets_app/config/theme/appTheme.dart';
import 'package:widgets_app/src/screens/buttons/buttonsScreen.dart';
import 'package:widgets_app/src/screens/cards/cardsScreen.dart';
import 'package:widgets_app/src/screens/home/homeScreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 9).getTheme(),
      home: const HomeScreen(),
      routes: {
        '/buttons':(context) => const ButtonsScreen(),
        '/cards':(context) => const CardsScreen()
      },
    );
  }
}
