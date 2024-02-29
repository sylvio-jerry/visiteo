import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: AppColor.white,
    primary: AppColor.primaryLight,
    secondary: AppColor.secondaryLight,
  ),
  scaffoldBackgroundColor: AppColor.bodyColorLight,
  hintColor: AppColor.hintStyleColor,
  primaryColorLight: AppColor.primaryLight,
  primaryIconTheme: IconThemeData(color: AppColor.textColorLight,),
  iconTheme:IconThemeData(color: AppColor.textColorLight,),
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 14,
    ),
    bodySmall: TextStyle(
      color: AppColor.textColorLight,
      fontSize: 14,
    ),
  ),
  buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.normal, buttonColor: Colors.white),
);
