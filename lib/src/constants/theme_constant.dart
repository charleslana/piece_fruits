import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Dosis',
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.black),
    headline2: TextStyle(color: Colors.black),
    headline3: TextStyle(color: Colors.black),
    headline4: TextStyle(color: Colors.black),
    headline5: TextStyle(color: Colors.black),
    headline6: TextStyle(color: Colors.black),
    subtitle1: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    headlineLarge: TextStyle(color: Colors.black),
  ),
  scaffoldBackgroundColor: const Color(0xffd0b562),
  colorScheme: const ColorScheme.dark().copyWith(
    primary: const Color(0xffd0b562),
    secondary: const Color(0xffd0b562),
  ),
  splashColor: Colors.black.withOpacity(0.3),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.black,
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black54),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black45),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black45,
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateColor.resolveWith((states) => Colors.black54),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.black,
  ),
  canvasColor: const Color(0xffd0b562),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffd0b562),
    foregroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xffd0b562),
    selectedItemColor: Colors.white,
  ),
  tabBarTheme: const TabBarTheme(
    indicator: ShapeDecoration(
      shape: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.white,
        ),
      ),
    ),
    labelColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: Color(0xffd0b562),
  ),
  errorColor: Colors.red,
);
