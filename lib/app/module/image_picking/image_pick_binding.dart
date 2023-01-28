import 'package:get/get.dart';
import 'package:healthy_crops/app/module/image_picking/image_pick_controller.dart';

class ImagePickingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImagePickingController>(() => ImagePickingController(), fenix: true);
  }
}
