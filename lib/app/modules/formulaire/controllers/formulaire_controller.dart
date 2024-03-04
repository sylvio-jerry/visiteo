import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/services/database_helper.dart';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:visiteo/app/modules/home/controllers/home_controller.dart';

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

  //visitorToUpdate
  Rx<Visitor?> visitorToUpdate = Rx<Visitor?>(null);

  @override
  void onReady() {
    log("onReady called inside formulaire_controller");
    getNewNumero();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    log("closed  => FormulaireController");
  }

  //validation formulaire
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

  void resetVisitorToUpdate() {
    visitorToUpdate.value = null;
    log("reset formulaire called");
    return;
  }

  void clearFields() {
    // Réinitialiser la validation des champs et valeur  des  champs
    formKey.currentState?.reset();
    nomVisiteurController.clear();
    tarifController.clear();
    nombreJourController.clear();
    dateController.clear();
    return;
  }

  void setVisitorToUpdate() {
    if (visitorToUpdate.value != null) {
      nomVisiteurController.text = visitorToUpdate.value?.nom ?? "";
      tarifController.text =
          visitorToUpdate.value?.tarifJournalier.toString() ?? "";
      nombreJourController.text =
          visitorToUpdate.value?.nombreJour.toString() ?? "";
      newNumeroVisitor.value = visitorToUpdate.value?.numero.toString() ?? "";
      dateController.text =
          DateFormat('dd/MM/yyyy').format(visitorToUpdate.value!.date);
    }
    return;
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

  Future<void> onSubmit() async {
    if (formKey.currentState!.validate()) {
      if (visitorToUpdate.value == null) {
        // Si aucun argument n'est passé, cela signifie qu'il s'agit d'un nouvel ajout
        // Utiliser les valeurs des contrôleurs pour créer un nouvel objet Visitor
        Visitor newVisitor = Visitor(
          nom: nomVisiteurController.text,
          tarifJournalier: int.parse(tarifController.text),
          nombreJour: int.parse(nombreJourController.text),
          numero: newNumeroVisitor.value,
          date: DateFormat('dd/MM/yyyy').parse(dateController.text),
        );

        // Ajouter le visiteur à la base de données ou effectuer toute autre opération requise
        await db.insertVisitor(newVisitor);
        clearFields();
      } else {
        final homeController = Get.find<HomeController>();
        // S'il y a des arguments, cela signifie qu'il s'agit d'une mise à jour
        // Utiliser les valeurs des contrôleurs pour mettre à jour le visiteur existant
        Visitor updatedVisitor = Visitor(
          id: visitorToUpdate.value!.id,
          nom: nomVisiteurController.text,
          tarifJournalier: int.parse(tarifController.text),
          nombreJour: int.parse(nombreJourController.text),
          numero: newNumeroVisitor.value,
          date: DateFormat('dd/MM/yyyy').parse(dateController.text),
        );

        // Mettre à jour le visiteur dans la base de données ou effectuer toute autre opération requise
        await db.updateVisitor(updatedVisitor);
        clearFields();
        homeController.handleBottomNav(0);
      }

      // Afficher un message de succès
      Get.snackbar("Success", "L'information a été enregistrée",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green);

      // handle bottom navbar
    } else {
      // Si la validation échoue, afficher les messages d'erreur appropriés
      Get.snackbar("Erreur", "Veuillez corriger les erreurs dans le formulaire",
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      resetVisitorToUpdate();
    }
  }
}
