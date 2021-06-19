import 'package:battle_line/constant/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: MyColors.bodyColorDark,
  scaffoldBackgroundColor: MyColors.bodyColorDark,
  hintColor: MyColors.textColor,
  fontFamily: "Roboto",
  primaryColorLight: MyColors.buttonBackgroundColorDark,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
  ),
);
