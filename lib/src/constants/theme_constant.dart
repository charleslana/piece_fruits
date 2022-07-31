import 'package:flutter/material.dart';
import 'package:piece_fruits/src/constants/color_constant.dart';

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
  hintColor: Colors.black,
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: backgroundColor,
    secondary: backgroundColor,
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
  canvasColor: backgroundColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: backgroundColor,
    foregroundColor: Colors.black,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: backgroundColor,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    selectedLabelStyle: TextStyle(fontFamily: 'Lato'),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  cardTheme: const CardTheme(
    color: backgroundColor,
  ),
  errorColor: Colors.red,
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
);
