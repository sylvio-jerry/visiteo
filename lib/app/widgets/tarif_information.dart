import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/tarif_model.dart';
import 'package:visiteo/themes/app_color.dart';

class TarifInformation extends StatelessWidget {
  const TarifInformation({super.key, required this.tarif});
  final Tarif tarif;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: Get.width,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    child: const Text(
                      'Informations sur le tarif',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            margin: const EdgeInsets.symmetric(vertical: 25.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.grey[200],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: AppColor.primaryLight),
                                  child: Text(
                                    "MARS",
                                    style: TextStyle(
                                      color: AppColor.bodyColorLight,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Text(
                                  "9",
                                  style: TextStyle(
                                    color: AppColor.bodyColorDark,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text(
                                  "2025",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 68, 65, 65),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: AppColor.bodyColorDark.withOpacity(.6)),
                            child: Text(
                              "7 Jours",
                              style: TextStyle(
                                color: AppColor.bodyColorLight,
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          // height: 200,
                          padding: const EdgeInsets.all(5.0),
                          margin: const EdgeInsets.only(top: 25.0, left: 25.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            // color: AppColor.primaryLight.withOpacity(.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: AppColor.primaryLight),
                                    child: Text(
                                      "VST-001",
                                      style: TextStyle(
                                        color: AppColor.bodyColorLight,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Nom"),
                                      SizedBox(
                                        width: 15,
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
                                    child: SizedBox(
                                      width: Get.width * 0.4,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                "John legend ddddddddddddd",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              //tarif journalier
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tarif Journalier",
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: AppColor.primaryDark,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(.2),
                                    ),
                                    child: Text(
                                      "123545 Ariary",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              //tarif payé
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Tarif Payé",
                                  ),
                                  SizedBox(
                                    width: 50,
                                    child: Divider(
                                      thickness: 1.5,
                                      color: AppColor.primaryDark,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5.0),
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey.withOpacity(.2),
                                    ),
                                    child: Text(
                                      "69523 Ariary",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
