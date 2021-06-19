import 'package:battle_line/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: MyColors.bodyColor,
  scaffoldBackgroundColor: MyColors.bodyColor,
  hintColor: MyColors.textColor,
  primaryColorLight: MyColors.buttonBackgroundColor,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
);
