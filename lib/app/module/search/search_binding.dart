import 'package:get/get.dart';
import 'package:healthy_crops/app/module/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController(), fenix: true);
  }
}
