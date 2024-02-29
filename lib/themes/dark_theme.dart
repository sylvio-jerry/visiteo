import 'package:flutter/material.dart';
import 'app_color.dart';

ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.black.withOpacity(.3),
      primary: AppColor.primaryDark,
      secondary: AppColor.secondaryDark,
    ),
    scaffoldBackgroundColor: AppColor.bodyColorDark,
    hintColor: AppColor.hintStyleColor,
    primaryColorDark: AppColor.primaryDark,
    primaryIconTheme: IconThemeData(
      color: AppColor.textColorDark,
    ),
    iconTheme: IconThemeData(
      color: AppColor.textColorDark,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColor.textColorDark,
        fontSize: 40,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: TextStyle(
        color: AppColor.textColorDark,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      displaySmall: TextStyle(
        color: AppColor.textColorDark,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: AppColor.textColorDark,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: AppColor.textColorLight,
        fontSize: 14,
      ),
    ),
    buttonTheme: const ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.white));
