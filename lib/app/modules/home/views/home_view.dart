import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
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
          //toogle theme
          GetX<HomeController>(builder: (controller) {
            return IconButton(
              onPressed: () {
                controller.toggleTheme();
              },
              icon: Icon(
                controller.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.black,
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return CurvedNavigationBar(
          index: controller.selectedIndex,
          height: 65.0,
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
          backgroundColor: Theme.of(context).colorScheme.secondary,
          color: Theme.of(context).colorScheme.primary.withOpacity(.5),
          animationDuration: const Duration(milliseconds: 300),
          onTap: controller.handleBottomNav,
        );
      }),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.grey[300],
          child: SizedBox(
            height: Get.height,
            child: Column(children: [
              //logo
              DrawerHeader(
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // Choisir le rayon souhaité
                  child: Image.asset(
                    "assets/images/6.jpg",
                    fit: BoxFit
                        .cover, // Assure que l'image est correctement ajustée
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    child: Text(
                      "@_scofild - 2024",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return IndexedStack(
            index: controller.selectedIndex,
            children: controller.screens,
          );
        },
      ),
    );
  }
}
