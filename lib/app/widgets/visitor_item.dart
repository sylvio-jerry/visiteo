import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visiteo/app/modules/home/controllers/home_controller.dart';
import 'package:visiteo/app/modules/list/controllers/visitor_list_controller.dart';
import 'package:visiteo/models/visitor_model.dart';
import 'package:visiteo/themes/app_color.dart';
import 'package:visiteo/app/modules/formulaire/controllers/formulaire_controller.dart';

class VisitorItem extends StatelessWidget {
  final Visitor visitor;
  VisitorItem({Key? key, required this.visitor}) : super(key: key);
  final visitorListContainer = Get.find<VisitorListController>();
  final homeController = Get.find<HomeController>();
  final formulaireController = Get.find<FormulaireController>();

  void onTap() {
    // Appeler la méthode pour naviguer vers le formulaireView
    formulaireController.visitorToUpdate.value = visitor;
    formulaireController.setVisitorToUpdate();
    homeController.handleBottomNav(1);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Dismissible(
        key: Key(visitor.id
            .toString()), // Utilisez une clé unique pour chaque élément
        direction: DismissDirection
            .horizontal, // Autorisez le swipe horizontal seulement
        onDismissed: (direction) {
          // Supprimez le visiteur lorsque l'utilisateur effectue un swipe
          if (direction == DismissDirection.endToStart ||
              direction == DismissDirection.startToEnd) {
            // Effectuez la suppression du visiteur ici, par exemple en appelant une méthode dans le contrôleur
            visitorListContainer.deleteVisitor(visitor);
          }
        },
        background: Container(
          color: Colors.red
              .withOpacity(.7), // Couleur d'arrière-plan lors du swipe
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        child: Container(
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
                        DateFormat("MMM", "fr_FR").format(visitor.date),
                        style: TextStyle(
                          color: AppColor.bodyColorLight,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Text(
                      DateFormat(DateFormat.DAY).format(visitor.date),
                      style: TextStyle(
                        color: AppColor.bodyColorDark,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      DateFormat(DateFormat.YEAR).format(visitor.date),
                      style: const TextStyle(
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
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                visitor.getFormattedTarif(),
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
                          visitor.numero,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
