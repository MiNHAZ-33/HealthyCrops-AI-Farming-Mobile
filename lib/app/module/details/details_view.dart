import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';
import 'package:healthy_crops/app/widget/app_bar.dart';
import 'package:healthy_crops/app/widget/drawer.dart';
import 'package:healthy_crops/app/widget/laoding.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:healthy_crops/util/const.dart';

// ignore: must_be_immutable
class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(),
      backgroundColor: backGroudColor,
      drawer: const MyDrawer(),
      body: Obx(
        () => controller.loading
            ? const MyLoading()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      items: controller.details.galleryDisease
                          .map<Widget>((item) => Image.network(item.imageUrl))
                          .toList(),
                      options: CarouselOptions(
                        height: 240.0,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                      ),
                    ),
                    Markdown(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        data: controller.details.description)
                  ],
                ),
              ),
      ),
    );
  }
}
