import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/formulaire/views/formulaire_view.dart';
import 'package:visiteo/app/modules/list/views/visitor_list_view.dart';
import 'package:visiteo/app/modules/tarif/views/tarif_view.dart';
import 'package:visiteo/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxBool isDarkMode = false.obs;

  final List<Widget> screens = [
    const VisitorListView(),
    const FormulaireView(),
    const TarifView(),
  ];

  void handleBottomNav(index) {
    log("bottom nav changed $index");
    selectedIndex.value = index;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    updateTheme();
  }

  void updateTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    update();
  }
}
