import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/services/database_helper.dart';
import 'dart:developer';
import 'package:intl/intl.dart';

class FormulaireController extends GetxController {
  // Déclaration d'un objet DatabaseHelper
  DatabaseHelper db = DatabaseHelper();

  //form controller
  final formKey = GlobalKey<FormState>();
  TextEditingController nomVisiteurController = TextEditingController();
  TextEditingController tarifController = TextEditingController();
  TextEditingController nombreJourController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //new numero
  RxString newNumeroVisitor = "".obs;

  //loading new numero
  RxBool isLoading = true.obs;

  @override
  void onReady() {
    log("onReady called inside formulaire_controller");
    getNewNumero();
    super.onReady();
  }

  @override
  void onClose() {
    log("FormulaireController onclose called");
    clearFields();
    super.onClose();
  }

  String? validateName(String? nom) {
    if (nom == null || nom.isEmpty) {
      return "Veuillez entrer le nom du visiteur";
    }
    return null;
  }

  String? validateTarif(String? tarif) {
    if (tarif == null || tarif.isEmpty) {
      return "Veuillez entrer le tarif journalier";
    }
    if (int.tryParse(tarif) == null) {
      return "Veuillez entrer un tarif valide";
    }
    return null;
  }

  String? validateNombreJour(String? nombreJours) {
    if (nombreJours == null || nombreJours.isEmpty) {
      return "Veuillez entrer le nombre de jours";
    }
    if (int.tryParse(nombreJours) == null) {
      return "Veuillez entrer un nombre de jours valide";
    }
    return null;
  }

  String? validateDate(String? dateVisite) {
    if (dateVisite == null || dateVisite.isEmpty) {
      return "Veuillez sélectionner une date";
    }
    return null;
  }

  Future<void> onAdd() async {
    if (formKey.currentState!.validate()) {
      // Si la validation réussit, vous pouvez procéder à l'ajout du visiteur
      // Utilisez les valeurs des contrôleurs pour créer un nouvel objet Visitor
      Visitor newVisitor = Visitor(
        nom: nomVisiteurController.text,
        tarifJournalier: int.parse(tarifController.text),
        nombreJour: int.parse(nombreJourController.text),
        numero: newNumeroVisitor.value,
        date: DateFormat('dd/MM/yyyy').parse(dateController.text),
      );

      // Ajoutez le visiteur à la base de données ou effectuez toute autre opération requise
      await db.insertVisitor(newVisitor);

      // Affichez un message de succès
      Get.snackbar("Success", "L'information a été enregistrée",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      clearFields();
      await getNewNumero();
    } else {
      // Si la validation échoue, affichez les messages d'erreur appropriés
      Get.snackbar("Erreur", "Veuillez corriger les erreurs dans le formulaire",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  void clearFields() {
    nomVisiteurController.clear();
    tarifController.clear();
    nombreJourController.clear();
    dateController.clear();
  }

  Future<String> getNewNumero() async {
    isLoading.value = true;
    log("getNewNumero  function called");
    String newNum = await db.generateNumero();
    newNumeroVisitor.value = newNum;
    isLoading.value = false;
    log("getNewNumero  in formulaireView==> $newNum");
    return newNum;
  }
}
