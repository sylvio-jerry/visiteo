import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/formulaire/views/formulaire_view.dart';
import 'package:visiteo/app/modules/list/views/visitor_list_view.dart';
import 'package:visiteo/app/modules/tarif/views/tarif_view.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  RxBool isDarkMode = false.obs;

  final List screens = [
    VisitorListView(),
    FormulaireView(),
    const TarifView(),
  ];

  void handleBottomNav(index) {
    print(index);
    selectedIndex = index;
    update();
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    updateTheme();
  }

  void updateTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    update();
  }

  // void changeTheme() {
  //   Get.changeTheme(Get.isDarkMode ? ThemeData.light : ThemeData.dark);

  // }

}
