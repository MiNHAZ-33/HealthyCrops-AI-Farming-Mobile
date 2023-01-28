import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/home/home_controller.dart';
import 'package:healthy_crops/app/widget/app_bar.dart';
import 'package:healthy_crops/app/widget/laoding.dart';
import 'package:healthy_crops/util/const.dart';

import '../../widget/disease_card.dart';
import '../../widget/drawer.dart';

class HomeMobileScaffold extends GetView<HomeController> {
  const HomeMobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6EDD9).withOpacity(1),
      appBar: myAppBar,
      drawer: const MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          color: backGroudColor,
        ),
        child: Obx(
          () => controller.loading
              ? const MyLoading()
              : ListView.builder(
                  itemCount: controller.diseaseList.length,
                  itemBuilder: ((context, index) {
                    var disease = controller.diseaseList[index];
                    return GestureDetector(
                      onTap: () {
                        controller.getDiseaseDetail(disease.title);
                      },
                      child: DiseaseCard(disease: disease),
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
