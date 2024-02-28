import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/onBoarding/views/on_boarding_view.dart';
import 'package:visiteo/models/onboarding_info.dart';
import 'package:visiteo/app/routes/app_pages.dart';

class OnBoardingController extends GetxController {
  int currentPage = 0;
  // RxInt currentPage = 0.obs;
  RxBool isLastPage = false.obs;

  final PageController pageController = PageController();

  final pages = [
    OnboardingItem(
      item: OnboardingInfo(
          title: "Gestion Simplifiée",
          descriptions:
              "Optez pour une gestion efficace de vos établissements avec VISITEO, votre solution tout-en-un.",
          image: "assets/images/onboarding_1.svg"),
    ),
    OnboardingItem(
      item: OnboardingInfo(
          title: "Accès à distance",
          descriptions:
              "Avec VISITEO, profitez d'une gestion de données de qualité et d'une accessibilité totale. Gérez vos données en toute simplicité, où que vous soyez.",
          image: "assets/images/onboarding_2.svg"),
    ),
    OnboardingItem(
      item: OnboardingInfo(
          title: "Facile à Utiliser",
          descriptions:
              "Profitez d'une expérience fluide et moderne avec VISITEO, une interface intuitive pour une gestion sans tracas.",
          image: "assets/images/onboarding_3.svg"),
    ),
    OnboardingItem(
      item: OnboardingInfo(
          title: "Prêt à Démarrer",
          descriptions:
              "Découvrez les avantages de VISITEO et commencez à optimiser la gestion de vos établissements dès aujourd'hui.",
          image: "assets/images/onboarding_4.svg"),
    ),
  ];
  
  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      update();
    });
  }

  void nextPage() {
    if (currentPage == pages.length - 1) {
      Get.offNamed(Routes.HOME);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
