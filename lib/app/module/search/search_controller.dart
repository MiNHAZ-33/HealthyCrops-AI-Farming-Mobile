import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';
import 'package:healthy_crops/app/module/search/search_result_view.dart';

import '../../../routes/routes.dart';
import '../../data/data_source.dart';
import '../../model/disease.dart';

class SearchController extends GetxController {
  final DataSource _dataSource = Get.find(tag: (DataSource).toString());

  late TextEditingController searchController;

  final _diseaseList = <Disease>[].obs;

  final _loading = false.obs;
  get loading => _loading.value;

  get diseaseList => _diseaseList.value;

  final _isSearching = false.obs;
  get isSearching => _isSearching.value;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  void getSearchResult() async {
    _loading.value = true;
    _diseaseList.value =
        await _dataSource.getSearchResult(searchController.text);
    _loading.value = false;
    Get.to(() => const SearchResultView());
  }

  void getDiseaseDetail(String title) async {
    Get.find<DetailsController>().getDiseaseDetails(title);
    Get.toNamed(Routes.details, parameters: {'title': title});
  }
}
