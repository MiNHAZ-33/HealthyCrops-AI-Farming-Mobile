import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/search/search_controller.dart';
import 'package:healthy_crops/app/widget/tile_text.dart';
import '../../../util/const.dart';
import '../../widget/disease_card.dart';
import '../../widget/drawer.dart';
import '../../widget/laoding.dart';

class SearchResultView extends GetView<SearchController> {
  const SearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Search Result'),
      ),
      drawer: const MyDrawer(),
      body: Obx(
        () => controller.loading
            ? const MyLoading()
            : controller.diseaseList.length == 0
                ? const Center(child: TileText(title: 'No result found'))
                : ListView.builder(
                    itemCount: controller.diseaseList.length,
                    itemBuilder: ((context, index) {
                      var disease = controller.diseaseList[index];
                      return GestureDetector(
                          onTap: () {
                            controller.getDiseaseDetail(disease.title);
                          },
                          child: DiseaseCard(disease: disease));
                    }),
                  ),
      ),
    );
  }
}
