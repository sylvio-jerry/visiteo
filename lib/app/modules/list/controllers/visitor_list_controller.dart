import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/visitor_model.dart';

class VisitorListController extends GetxController {
  RxList<Visitor> visitorList = <Visitor>[].obs;

  TextEditingController SearchEditingController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    Visitor test_1 = Visitor(
        nom: "john legend fffffeeeefeefeffefefezzzzfefefefefzzzzzffzfzfz",
        tarifJournalier: 25000,
        nombreJour: 7,
        date: "2025");
    Visitor test_2 = Visitor(
        nom: "Mark warol",
        tarifJournalier: 25000,
        nombreJour: 10,
        date: "2023");
    Visitor test_3 = Visitor(
        nom: "Mark warol",
        tarifJournalier: 25000,
        nombreJour: 10,
        date: "2024");
    Visitor test_4 = Visitor(
        nom: "Yve Jean", tarifJournalier: 900, nombreJour: 8, date: "2024");
    visitorList.add(test_1);
    visitorList.add(test_2);
    visitorList.add(test_3);
    visitorList.add(test_4);
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
