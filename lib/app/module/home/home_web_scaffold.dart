import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/home/home_controller.dart';
import 'package:healthy_crops/app/widget/app_bar.dart';

import '../../../util/const.dart';
import '../../widget/disease_card.dart';
import '../../widget/drawer.dart';
import '../../widget/laoding.dart';

class HomeWebScaffold extends GetView<HomeController> {
  const HomeWebScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Row(
        children: [
          const MyDrawer(),
          Container(
            width: MediaQuery.of(context).size.width - 350,
            decoration: const BoxDecoration(
              color: backGroudColor,
            ),
            child: Obx(() => controller.loading
                    ? const MyLoading()
                    : SizedBox(
                        width: MediaQuery.of(context).size.width - 400,
                        child: Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemCount: controller.diseaseList.length,
                              itemBuilder: (context, index) {
                                var disease = controller.diseaseList[index];
                                return GestureDetector(
                                    onTap: () {
                                      controller
                                          .getDiseaseDetail(disease.title);
                                    },
                                    child: DiseaseCard(disease: disease));
                              }),
                        ),
                      )
                // : ListView.builder(
                //     itemCount: controller.diseaseList.length,
                //     itemBuilder: ((context, index) {
                //       var disease = controller.diseaseList[index];
                //       return GestureDetector(
                //           onTap: () {
                //             controller.getDiseaseDetail(disease.title);
                //           },
                //           child: DiseaseCard(disease: disease));
                //     }),
                //   ),
                ),
          ),
        ],
      ),
    );
  }
}
