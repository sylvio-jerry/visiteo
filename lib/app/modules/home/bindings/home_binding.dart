import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../list/controllers/visitor_list_controller.dart';
import '../../formulaire/controllers/formulaire_controller.dart';
import '../../tarif/controllers/tarif_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<VisitorListController>(
      () => VisitorListController(),
    );
    Get.lazyPut<FormulaireController>(
      () => FormulaireController(),
    );
    Get.lazyPut<TarifController>(
      () => TarifController(),
    );
  }
}
