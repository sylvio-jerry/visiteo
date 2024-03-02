import 'dart:developer';

import 'package:get/get.dart';

class TarifController extends GetxController {
  //TODO: Implement TarifController



  final count = 0.obs;
  @override
  void onInit() {
    //
    log("tarif view initialize");
    super.onInit();
  }

  @override
  void onReady() {
    log("tarif view onReady");
    super.onReady();
  }

  @override
  void onClose() {
    log("tarif view closed");
    super.onClose();
  }

  void increment() => count.value++;
}
