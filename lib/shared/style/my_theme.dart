import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: colorGreen,
      scaffoldBackgroundColor: colorGreen,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: colorGreen,
          onPrimary: Colors.white,
          secondary: colorGreen,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: colorGreen,
          onBackground: colorGreen,
          surface: Colors.grey,
          onSurface: colorBlack),
      appBarTheme: AppBarTheme(
          backgroundColor: colorGreen,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: colorGreen),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorGreen),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: colorGreen),
      ),
      floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: colorGreen),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: colorGreen,
          unselectedItemColor: Colors.grey));
}