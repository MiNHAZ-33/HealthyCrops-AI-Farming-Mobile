import 'package:get/get.dart';
import 'package:healthy_crops/app/data/data_source_binding.dart';
import 'package:healthy_crops/app/module/details/details_binding.dart';
import 'package:healthy_crops/app/module/home/home_binding.dart';
import 'package:healthy_crops/app/module/image_picking/image_pick_binding.dart';
import 'package:healthy_crops/app/module/search/search_binding.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    HomeBindings().dependencies();
    DetailBinding().dependencies();
    DataSourceBinding().dependencies();
    SearchBinding().dependencies();
    ImagePickingBinding().dependencies();
  }
}
