import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/formulaire/views/formulaire_view.dart';
import 'package:visiteo/app/modules/list/views/visitor_list_view.dart';
import 'package:visiteo/app/modules/tarif/views/tarif_view.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  final List screens = [
     VisitorListView(),
    const FormulaireView(),
    const TarifView(),
  ];

  void handleBottomNav(index) {
    print(index);
    selectedIndex = index;
    update();
  }

  void changeTheme() {
    Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
  }
}
