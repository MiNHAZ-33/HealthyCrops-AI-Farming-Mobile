import 'package:get/get.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController(), fenix: true);
  }
}
