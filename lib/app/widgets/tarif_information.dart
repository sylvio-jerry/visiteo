import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/app/modules/tarif/controllers/tarif_controller.dart';
import 'package:visiteo/models/tarif_model.dart';
import 'package:visiteo/themes/app_color.dart';
import 'package:intl/intl.dart';

class TarifInformation extends GetView<TarifController> {
  const TarifInformation({super.key, this.status});
  final String? status;

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
                  GetX<TarifController>(
                    builder: (controller) {
                      final tarifValue = controller.tarif.value;
                      if (tarifValue != null) {
                        final visitor = status == "MINIMUM"
                            ? tarifValue.minVisitor
                            : tarifValue.maxVisitor;
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 25.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[200],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: AppColor.primaryLight),
                                        child: Text(
                                          DateFormat("MMM", "fr_FR")
                                              .format(visitor.date),
                                          style: TextStyle(
                                            color: AppColor.bodyColorLight,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        DateFormat(DateFormat.DAY)
                                            .format(visitor.date),
                                        style: TextStyle(
                                          color: AppColor.bodyColorDark,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        DateFormat(DateFormat.YEAR)
                                            .format(visitor.date),
                                        style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 68, 65, 65),
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                      color: AppColor.bodyColorDark
                                          .withOpacity(.6)),
                                  child: Text(
                                    "${visitor.nombreJour.toString()} Jour(s)",
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
                                margin: const EdgeInsets.only(
                                    top: 25.0, left: 25.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          margin:
                                              const EdgeInsets.only(left: 25),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              color: AppColor.primaryLight),
                                          child: Text(
                                            visitor.numero.toString(),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          margin:
                                              const EdgeInsets.only(left: 25),
                                          padding: const EdgeInsets.all(5.0),
                                          child: SizedBox(
                                            width: Get.width * 0.4,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Text(
                                                      visitor.nom,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            color:
                                                Colors.blueGrey.withOpacity(.2),
                                          ),
                                          child: Text(
                                            visitor.tarifJournalier.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //tarif payé
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            color:
                                                Colors.blueGrey.withOpacity(.2),
                                          ),
                                          child: Text(
                                            visitor.getFormattedTarif(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
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
