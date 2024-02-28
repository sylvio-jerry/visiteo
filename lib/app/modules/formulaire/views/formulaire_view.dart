import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:visiteo/themes/app_color.dart';
import '../controllers/formulaire_controller.dart';

class FormulaireView extends GetView<FormulaireController> {
  const FormulaireView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.secondaryLight,
      body: const Center(
        child: Text(
          'FormulaireView',
          // style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
