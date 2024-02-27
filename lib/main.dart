import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/themes/app_theme.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Visiteo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    ),
  );
}
