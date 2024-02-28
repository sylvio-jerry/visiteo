import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.secondaryLight.withOpacity(.2),
      primary: AppColor.primaryDark,
      secondary: AppColor.secondaryDark,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.textColorDark,
    primaryColorLight: AppColor.buttonBgColorDark,
   textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
