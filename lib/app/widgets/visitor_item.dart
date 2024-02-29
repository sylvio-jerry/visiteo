import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/themes/app_color.dart';

class VisitorItem extends StatelessWidget {
  final Visitor visitor;
  const VisitorItem({Key? key, required this.visitor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      // height: 100,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Row(
        children: [
          //date box
          Container(
            padding: const EdgeInsets.all(5.0),
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
                  visitor.nombreJour.toString(),
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
          //second box
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //first box
                  SizedBox(
                    width: Get.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                visitor.nom,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            "${visitor.nombreJour} Jours",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //second box
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.grey[200]),
                    child: Text(
                      "vst-001",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
