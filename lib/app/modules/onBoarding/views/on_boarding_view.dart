import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import 'package:visiteo/models/onboarding_info.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/on_boarding_controller.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  OnBoardingView({Key? key}) : super(key: key);

  // final pages = Get.find<OnBoardingController>().pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(children: [
          Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: PageView(
              controller: controller.pageController,
              children: controller.pages,
            ),
          ),
          GetBuilder<OnBoardingController>(builder: (state) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 110.0),
                child: SmoothPageIndicator(
                  controller: state.pageController,
                  count: state.pages.length,
                  onDotClicked: (index) => state.pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeIn),
                  effect: WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    activeDotColor: AppColor.primaryLight,
                  ),
                ),
              ),
            );
          })
        ]),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<OnBoardingController>(builder: (state) {
                // if (state.currentPage == 0) return const SizedBox.shrink();
                return ElevatedButton(
                  onPressed: controller.previousPage,
                  child: const Text('Précédent'),
                );
              }),
              //Next Button
              GetBuilder<OnBoardingController>(builder: (state) {
                return ElevatedButton(
                  onPressed: state.nextPage,
                  child: Text(state.currentPage == state.pages.length - 1
                      ? 'Commencer'
                      : 'Suivant'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem extends GetView<OnBoardingController> {
  const OnboardingItem({
    super.key,
    required this.item,
  });

  final OnboardingInfo item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          item.image,
          height: 350,
          width: 250,
          fit: BoxFit.cover,
        ),

        const SizedBox(height: 15),
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Text(item.descriptions,
            style: const TextStyle(color: Colors.grey, fontSize: 17),
            textAlign: TextAlign.center),
      ],
    );
  }
}
