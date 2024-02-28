import 'package:get/get.dart';

import '../controllers/tarif_controller.dart';

class TarifBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TarifController>(
      () => TarifController(),
    );
  }
}
