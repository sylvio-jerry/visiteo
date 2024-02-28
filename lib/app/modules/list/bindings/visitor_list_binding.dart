import 'package:get/get.dart';
import '../controllers/visitor_list_controller.dart';

class VisitorListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitorListController>(
      () => VisitorListController(),
    );
  }
}
