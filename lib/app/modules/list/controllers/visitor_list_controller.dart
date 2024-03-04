import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/services/database_helper.dart';

class VisitorListController extends GetxController {
  RxList<Visitor> visitorList = <Visitor>[].obs;

  TextEditingController searchEditingController = TextEditingController();
  RxBool isLoading = true.obs;

// Déclaration d'un objet DatabaseHelper
  DatabaseHelper db = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    // Chargez les visiteurs au démarrage
    log("initialiaztion => VisitorListController");
    loadVisitorList();
  }

  @override
  void onClose() {
    super.onClose();
    log("closed  => VisitorListController");
  }

  Future<void> loadVisitorList() async {
    try {
      isLoading.value = true;
      List<Visitor> visitors = await db.getAllVisitor();
      // Mettez à jour la liste des visiteurs et isLoading
      visitorList.assignAll(visitors);
      isLoading.value = false;
      log("liste fetched here==>  $visitorList");
    } catch (e) {
      log('Erreur lors du chargement des visiteurs: $e');
      isLoading.value = false;
    }
  }

  Future<void> deleteVisitor(Visitor visitor) async {
    try {
      isLoading.value = true;
      await db.deleteVisitor(
          visitor); // Supprimez le visiteur de la base de données
      visitorList.remove(visitor); // Supprimez le visiteur de la liste locale
      isLoading.value = false;
      Get.snackbar(
        'Succès',
        'Le visiteur a été supprimé avec succès.',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      log('Erreur lors du suppression du visitor: $e');
      isLoading.value = false;
      Get.snackbar(
        'Erreur',
        'Une erreur s\'est produite lors de la suppression du visiteur.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> searchVisitors() async {
    try {
      isLoading.value = true;
      String query = searchEditingController.text.trim().toLowerCase();
      if (query.isNotEmpty) {
        List<Visitor> searchResults = await db.searchVisitorsByQuery(query);
        visitorList.assignAll(searchResults);
      } else {
        // Si la requête est vide, rechargez la liste complète des visiteurs
        loadVisitorList();
      }
    } catch (e) {
      log('Erreur lors de la recherche des visiteurs: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void resetSearch() {
    searchEditingController.clear();
  }
}
