import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormulaireController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController nomVisiteurController = TextEditingController();
  TextEditingController tarifController = TextEditingController();
  TextEditingController nombreJourController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  validateName(String? nom) {
    return null;
  }

  validateTarif(String? tarif) {
    return null;
  }

  validateNombreJour(String? nombreJour) {
    return null;
  }

  validateDate(String? date) {
    return null;
  }

 void updateDate(DateTime date) {
    dateController.text = date.toString();
  }
  
  Future onAdd() async {
    // if (formKey.currentState!.validate()) {
    //   Get.snackbar("Success", "L'Information a été enregistré",
    //       snackPosition: SnackPosition.BOTTOM,
    //       colorText: Colors.white,
    //       backgroundColor: Colors.green);
    //   return;
    // }
    Get.snackbar("Error", nomVisiteurController.text,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red);
  }
}
