import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/widgets/custom_date_form_field.dart';
import 'package:visiteo/app/widgets/custom_form_field.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/formulaire_controller.dart';

class FormulaireView extends GetView<FormulaireController> {
  FormulaireView({Key? key}) : super(key: key);
  final formulaireController = Get.put(FormulaireController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              width: Get.width,
              padding: const EdgeInsets.only(left: 25, right: 25),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
                gradient: LinearGradient(
                  // begin: Alignment.topRight,
                  begin: const AlignmentDirectional(0, -1),
                  end: const AlignmentDirectional(0, 1),
                  colors: [
                    Colors.white,
                    AppColor.secondaryLight,
                    AppColor.primaryLight,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black.withOpacity(.6),
                      ),
                      child: const Text(
                        "Visiteo",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 3),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SvgPicture.asset(
                      "assets/images/notebook-pana.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -35),
              child: Container(
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 20.0,
                          offset: const Offset(0, 10.0))
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: const Center(
                  child: Text(
                    "Nouveau Visiteur",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                        letterSpacing: 3),
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: formulaireController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Numero"),
                            SizedBox(
                              width: 25,
                              child: Divider(
                                thickness: 1.5,
                                color: AppColor.primaryDark,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 25),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.white),
                          child: const Text("vst-001"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    CustomFormField(
                      label: "Nom",
                      hintText: "nom du visiteur",
                      validator: (nom) =>
                          formulaireController.validateName(nom),
                      controller: formulaireController.nomVisiteurController,
                      iconData: Icons.person,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 25),
                    CustomFormField(
                      label: "Tarif Journalier",
                      hintText: "en ariary",
                      validator: (tarif) =>
                          formulaireController.validateTarif(tarif),
                      controller: formulaireController.tarifController,
                      iconData: Icons.credit_card,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 25),
                    CustomFormField(
                      label: "Nombre de jour",
                      hintText: "nombre de jour",
                      validator: (nombreJours) =>
                          formulaireController.validateNombreJour(nombreJours),
                      controller: formulaireController.nombreJourController,
                      iconData: Icons.numbers,
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 25),
                    CustomDateFormField(
                      label: "Date",
                      hintText: "date du visite",
                      validator: (dateVisite) =>
                          formulaireController.validateDate(dateVisite),
                      controller: formulaireController.dateController,
                      iconData: Icons.date_range,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(327, 50),
                        elevation: 0,
                        backgroundColor: AppColor.primaryLight,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                      ),
                      onPressed: () => formulaireController.onAdd(),
                      child: const Text(
                        "Enregistrer",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(.6),
                        minimumSize: const Size(327, 50),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                      ),
                      onPressed: () => formulaireController.onAdd(),
                      child: const Text(
                        "Reinitialiser",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
