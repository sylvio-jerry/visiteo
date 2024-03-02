import 'package:get/get.dart';

import '../modules/formulaire/bindings/formulaire_binding.dart';
import '../modules/formulaire/views/formulaire_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list/bindings/visitor_list_binding.dart';
import '../modules/list/views/visitor_list_view.dart';
import '../modules/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/onBoarding/views/on_boarding_view.dart';
import '../modules/tarif/bindings/tarif_binding.dart';
import '../modules/tarif/views/tarif_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => const OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.TARIF,
      page: () => const TarifView(),
      binding: TarifBinding(),
    ),
    GetPage(
      name: _Paths.FORMULAIRE,
      page: () => const FormulaireView(),
      binding: FormulaireBinding(),
    ),
    GetPage(
      name: _Paths.VISITOR_LIST,
      page: () => const VisitorListView(),
      binding: VisitorListBinding(),
    ),
  ];
}
