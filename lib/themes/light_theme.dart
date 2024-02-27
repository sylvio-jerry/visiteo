import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: AppColor.bodyColorLight,
      primary: AppColor.primaryLight,
      secondary: AppColor.secondaryLight,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorLight,
    hintColor: AppColor.textColorLight,
    primaryColorLight: AppColor.buttonBgColorLight,
    textTheme: const TextTheme(
        displayLarge: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold)),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.black));
