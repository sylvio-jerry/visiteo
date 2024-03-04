import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/tarif_controller.dart';
import 'package:visiteo/app/widgets/tarif_item.dart';

class TarifView extends GetView<TarifController> {
  const TarifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: SingleChildScrollView(
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
            Transform.translate(
              offset: const Offset(0, -50),
              child: SizedBox(
                height: 190,
                width: Get.width,
                child: Row(
                  children: [
                    Expanded(
                      child: GetX<TarifController>(
                        builder: (controller) {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  TarifItem(
                                    status: "MINIMUM",
                                    statusColor: Colors.black.withOpacity(.6),
                                    tarifAmount:
                                        controller.tarif.value?.getMinTarif ??
                                            "",
                                    visitorDetail: controller
                                            .tarif.value?.minVisitor.numero ??
                                        "",
                                  ),
                                  TarifItem(
                                    status: "MAXIMUM",
                                    statusColor:
                                        Colors.blueGrey.withOpacity(.4),
                                    tarifAmount:
                                        controller.tarif.value?.getMaxTarif ??
                                            "",
                                    visitorDetail: controller
                                            .tarif.value?.maxVisitor.numero ??
                                        "",
                                  ),
                                  TarifItem(
                                    status: "TOTALE",
                                    statusColor: Colors.red.withOpacity(.7),
                                    tarifAmount:
                                        controller.tarif.value?.getTotalTarif ??
                                            "",
                                    visitorDetail:
                                        "${controller.visitorLength} Visiteur(s)",
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
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
