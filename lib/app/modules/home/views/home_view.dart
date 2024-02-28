import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryLight,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: Scaffold.of(context).openDrawer,
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.changeTheme();
            },
            icon: const Icon(Icons.light_mode, color: Colors.black),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: controller.selectedIndex,
        items: [
          Icon(
            Icons.list_rounded,
            size: 30,
            color: Colors.black.withOpacity(.6),
          ),
          Icon(
            Icons.add_circle,
            size: 30,
            color: Colors.black.withOpacity(.6),
          ),
          Icon(
            Icons.bar_chart,
            size: 30,
            color: Colors.black.withOpacity(.6),
          )
        ],
        backgroundColor: AppColor.secondaryLight,
        color: AppColor.primaryLight.withOpacity(.2),
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) => controller.handleBottomNav(index),
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.grey[300],
          child: Column(children: [
            //logo
            DrawerHeader(
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(10.0), // Choisir le rayon souhaité
                child: Image.asset(
                  "assets/images/7.png",
                  fit: BoxFit
                      .cover, // Assure que l'image est correctement ajustée
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(color: Colors.grey[400]),
            ),
            Column(
              children: [
                const Text(
                  "Visiteo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15),
                  child: const Text(
                    "V.1.0",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
      body: GetBuilder<HomeController>(builder: (state) {
        return Container(child: state.screens[state.selectedIndex]);
      }),
    );
  }
}
