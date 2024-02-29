import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: AppColor.primaryLight.withOpacity(.2),
      primary: AppColor.primaryLight,
      secondary: AppColor.secondaryLight,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorLight,
    hintColor: AppColor.textColorLight,
    primaryColorLight: AppColor.buttonBgColorLight,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.black));
