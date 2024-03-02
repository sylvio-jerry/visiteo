import 'dart:convert';
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
    loadVisitorList();
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
}
