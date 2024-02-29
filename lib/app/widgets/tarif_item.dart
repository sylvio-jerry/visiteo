import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/tarif_model.dart';
import 'package:visiteo/themes/app_color.dart';
import 'package:visiteo/app/widgets/tarif_information.dart';

class TarifItem extends StatelessWidget {
  const TarifItem({
    super.key,
    required this.statusColor,
    required this.status,
    required this.tarif,
  });

  final Color statusColor;
  final String status;
  final Tarif tarif;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showTarifInformation(context),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13.0),
          ),
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(13.0),
                      topLeft: Radius.circular(13.0)),
                ),
                child: Center(
                  child: Text(
                    status,
                    style: TextStyle(
                      color: AppColor.bodyColorLight,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      height: 2,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Tarif payé",
                          style: TextStyle(
                            color: AppColor.bodyColorDark,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                        child: Divider(
                          thickness: 1.5,
                          color: statusColor,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        width: Get.width,
                        // height: 50,
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(10.0),
                          color: statusColor.withOpacity(.6),
                        ),
                        child: Text(
                          "123545 Ariary",
                          style: TextStyle(
                            color: AppColor.bodyColorLight,
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(color: AppColor.primaryDark),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showTarifInformation(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      context: context,
      builder: (BuildContext context) {
        return TarifInformation(tarif: tarif);
      },
    );
  }
}
