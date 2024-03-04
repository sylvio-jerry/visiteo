import 'dart:developer';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/list/controllers/visitor_list_controller.dart';
import 'package:visiteo/services/database_helper.dart';
import 'package:visiteo/models/tarif_model.dart';

class TarifController extends GetxController {
  Rx<Tarif?> tarif = Rx<Tarif?>(null);
  DatabaseHelper db = DatabaseHelper();
  RxString visitorLength = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchVisitorTarif();
    getVisitorCount();
  }

  Future<void> fetchVisitorTarif() async {
    try {
      Tarif? fetchedTarif = await db.getVisitorTarif();
      tarif.value = fetchedTarif;
      log('tarif.value got: ${tarif.value}');
    } catch (e) {
      log('Erreur lors de la récupération du tarif des visiteurs: $e');
      tarif.value = null;
    }
  }

  Future<void> getVisitorCount() async {
    try {
      int count = await db.getVisitorCount();
      visitorLength.value = count.toString();
      log('Nombre total de visiteurs: $count');
    } catch (e) {
      log('Erreur lors de la récupération du nombre de visiteurs: $e');
    }
  }
}
