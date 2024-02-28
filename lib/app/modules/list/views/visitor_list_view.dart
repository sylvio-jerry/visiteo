import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/visitor_list_controller.dart';
import 'package:visiteo/app/widgets/visitor_item.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/themes/app_color.dart';

class VisitorListView extends GetView<VisitorListController> {
  VisitorListView({Key? key}) : super(key: key);
  final visitorController = Get.put(VisitorListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      // extendBodyBehindAppBar: true,
      backgroundColor: AppColor.secondaryLight,
      body: Column(
        children: [
          Container(
            height: 150,
            width: Get.width,
            padding: const EdgeInsets.only(left: 25, right: 25),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                  bottomLeft: Radius.circular(50.0)),
              gradient: LinearGradient(
                begin: Alignment.topRight,
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
              fit: BoxFit.scaleDown,
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
                  color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColor.primaryLight,
                      size: 20.0,
                    ),
                    border: InputBorder.none,
                    // hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    hintText: 'Rechercher'),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return visitorController.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        // shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemBuilder: (context, index) {
                          Visitor visitor =
                              visitorController.visitorList[index];
                          return VisitorItem(visitor: visitor);
                        },
                        itemCount: visitorController.visitorList.length,
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
