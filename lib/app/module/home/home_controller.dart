import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/data/data_source.dart';
import 'package:healthy_crops/app/model/catagory.dart';
import 'package:healthy_crops/app/model/disease.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';
import 'package:healthy_crops/routes/routes.dart';

class HomeController extends GetxController {
  final DataSource _dataSource = Get.find(tag: (DataSource).toString());

  late TextEditingController searchController;

  final _catagory = <Catagory>[].obs;
  final _diseaseList = <Disease>[].obs;

  final _loading = false.obs;
  get loading => _loading.value;

  get catagory => _catagory.value;
  get diseaseList => _diseaseList.value;

  final _isSearching = false.obs;
  get isSearching => _isSearching.value;

  @override
  void onInit() {
    searchController = TextEditingController();
    getDiseaseList();
    super.onInit();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  getCatagory() async {
    _catagory.value = await _dataSource.getCatagory();
  }

  getDiseaseList() async {
    _loading.value = true;
    _diseaseList.value = await _dataSource.getDiseaseList();
    _loading.value = false;
  }

  void getDiseaseDetail(String title) async {
    // var diseaseDetail = await _dataSource.getDiseaseDetails(title);
    var det = Get.find<DetailsController>();
    det.getDiseaseDetails(title);
    Get.toNamed(Routes.details, parameters: {'title': title});
  }
}
