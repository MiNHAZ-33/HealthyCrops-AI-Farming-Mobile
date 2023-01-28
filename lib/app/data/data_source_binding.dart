import 'package:get/get.dart';
import 'package:healthy_crops/app/data/data_source.dart';

class DataSourceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataSource>(() => DataSource(),
        tag: (DataSource).toString(), fenix: true);
  }
}
