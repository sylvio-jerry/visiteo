import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/visitor_list_controller.dart';
import 'package:visiteo/app/widgets/visitor_item.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/themes/app_color.dart';

class VisitorListView extends GetView<VisitorListController> {
  const VisitorListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Container(
            height: 120,
            width: Get.width,
            padding: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)),
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
            child: SvgPicture.asset(
              "assets/images/webinar_1.svg",
              // height: 80,
              fit: BoxFit.contain,
            ),
          ),
          Transform.translate(
            offset: const Offset(0, -35),
            child: Container(
              height: 60,
              padding: const EdgeInsets.only(left: 20, top: 8),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 20.0,
                      offset: const Offset(0, 10.0))
                ],
                borderRadius: BorderRadius.circular(10.0),
                // color: Colors.white,
                color: AppColor.white,
              ),
              child: TextField(
                controller: controller.searchEditingController,
                onChanged: (query) => controller.searchVisitors(),
                style: TextStyle(color: AppColor.textColorLight),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColor.primaryLight,
                    size: 20.0,
                  ),
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Theme.of(context).hintColor, fontSize: 14),
                  hintText: 'Rechercher',
                ),
              ),
            ),
          ),
          Expanded(
            child: GetX<VisitorListController>(
              builder: (controller) {
                return controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : controller.visitorList.isEmpty
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  "assets/images/no_data.svg",
                                  height: Get.height * .5,
                                  fit: BoxFit.contain,
                                ),
                                const Text(
                                  'Aucun visiteur',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (context, index) {
                              Visitor visitor = controller.visitorList[index];
                              return VisitorItem(visitor: visitor);
                            },
                            itemCount: controller.visitorList.length,
                          );
              },
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
