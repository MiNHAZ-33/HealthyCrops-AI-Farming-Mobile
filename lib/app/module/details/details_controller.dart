import 'package:get/get.dart';
import 'package:healthy_crops/app/model/details.dart';

import '../../data/data_source.dart';

class DetailsController extends GetxController {
  final DataSource _dataSource = Get.find(tag: (DataSource).toString());

  final _details = Details().obs;

  final _loading = false.obs;

  get loading => _loading.value;

  get details => _details.value;

  @override
  void onInit() {
    // getDiseaseDetails(Get.parameters['title']!);
    super.onInit();
  }

  getDiseaseDetails(String title) async {
    _loading.value = true;
    _details.value = await _dataSource.getDiseaseDetails(title);
    _loading.value = false;
  }
}
