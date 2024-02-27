import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.bodyColorDark,
      primary: AppColor.primaryDark,
      secondary: AppColor.secondaryDark,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColorDark,
    primaryColorLight: AppColor.buttonBgColorDark,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
