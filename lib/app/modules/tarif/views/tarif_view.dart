import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/tarif_controller.dart';

class TarifView extends GetView<TarifController> {
  const TarifView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryLight,
      body: const Center(
        child: Text(
          'TarifView',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
