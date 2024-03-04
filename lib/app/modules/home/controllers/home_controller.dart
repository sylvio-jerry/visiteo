import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/formulaire/views/formulaire_view.dart';
import 'package:visiteo/app/modules/list/controllers/visitor_list_controller.dart';
import 'package:visiteo/app/modules/list/views/visitor_list_view.dart';
import 'package:visiteo/app/modules/tarif/views/tarif_view.dart';
import 'package:visiteo/app/modules/tarif/controllers/tarif_controller.dart';
import 'package:visiteo/app/modules/formulaire/controllers/formulaire_controller.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  RxBool isDarkMode = false.obs;

  final visitorListController = Get.find<VisitorListController>();
  final formulaireController = Get.find<FormulaireController>();
  final tarifController = Get.find<TarifController>();

  final List<Widget> screens = [
    const VisitorListView(),
    const FormulaireView(),
    const TarifView(),
  ];

  @override
  void onClose() {
    super.onClose();
    log("closed  => VisitorListController");
  }

  void handleBottomNav(index) {
    log("bottom nav changed $index");
    selectedIndex = index;
    if (index == 0) {
      log("index changed to $index");
      visitorListController.resetSearch();
      visitorListController.loadVisitorList();
      formulaireController.resetVisitorToUpdate();
      formulaireController.clearFields();
      formulaireController.getNewNumero();
    } else if (index == 1) {
      log("index changed to $index");
    } else if (index == 2) {
      log("index changed to $index");
      tarifController.fetchVisitorTarif();
      tarifController.getVisitorCount();
      formulaireController.resetVisitorToUpdate();
      formulaireController.clearFields();
      formulaireController.getNewNumero();
    }
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
}
