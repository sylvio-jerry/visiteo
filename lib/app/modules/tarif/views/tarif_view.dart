import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';
import 'package:visiteo/models/tarif_model.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/tarif_controller.dart';
import 'package:visiteo/app/widgets/tarif_item.dart';
import 'package:visiteo/models/visitor_model.dart';

class TarifView extends GetView<TarifController> {
  const TarifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SingleChildScrollView(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                width: Get.width,
                height: Get.height * .55,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/images/7.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 20.0,
                      offset: const Offset(0, 30.0),
                    )
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Colors.white,
                      AppColor.primaryLight,
                      AppColor.secondaryLight,
                    ],
                  ),
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(top: 150),
                width: Get.width,
                margin: const EdgeInsets.only(bottom: 100),
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black.withOpacity(.3),
                ),
                child: const Text(
                  "Analayse des tarifs clients",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 3,
                    fontSize: 18,
                  ),
                ),
              ),
            ]),
            // const SizedBox(height: 5),
            Transform.translate(
              offset: const Offset(0, -50),
              child: SizedBox(
                height: 190,
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              TarifItem(
                                status: "MINIMUM",
                                statusColor: Colors.black.withOpacity(.6),
                                tarif: Tarif(
                                    tarifMin: 2000,
                                    tarifMax: 5000,
                                    tarifTotal: 7000,
                                    visitor: Visitor(
                                        nom: "legend ",
                                        tarifJournalier: 25000,
                                        nombreJour: 7,
                                        date: "2025")),
                              ),
                              TarifItem(
                                  status: "MAXIMUMM",
                                  statusColor: Colors.blueGrey.withOpacity(.4),
                                  tarif: Tarif(
                                      tarifMin: 2000,
                                      tarifMax: 5000,
                                      tarifTotal: 7000,
                                      visitor: Visitor(
                                          nom: "john doe",
                                          tarifJournalier: 25000,
                                          nombreJour: 7,
                                          date: "2025"))),
                              TarifItem(
                                status: "TOTALE",
                                statusColor: Colors.red.withOpacity(.7),
                                tarif: Tarif(
                                    tarifMin: 2000,
                                    tarifMax: 5000,
                                    tarifTotal: 7000,
                                    visitor: Visitor(
                                        nom: " dark",
                                        tarifJournalier: 25000,
                                        nombreJour: 7,
                                        date: "2025")),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
