import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';

import '../../util/const.dart';

var myAppBar = AppBar(
  backgroundColor: mainColor,
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Healthy Crops',
        style: TextStyle(),
      ),
      Text(
        'AI-Farming',
        style: TextStyle(
          fontSize: 15,
        ),
      )
    ],
  ),
);

AppBar detailAppBar() {
  var contoller = Get.find<DetailsController>();

  return AppBar(
    backgroundColor: mainColor,
    centerTitle: true,
    title: Obx(
      () => contoller.loading
          ? const Text('')
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  contoller.details.title,
                  style: const TextStyle(),
                ),
                Text(
                  contoller.details.cropTitle,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                )
              ],
            ),
    ),
  );
}
