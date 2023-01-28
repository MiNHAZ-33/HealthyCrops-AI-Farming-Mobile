import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/image_picking/image_pick_controller.dart';
import 'package:healthy_crops/app/widget/app_bar.dart';
import 'package:healthy_crops/app/widget/drawer.dart';
import 'package:healthy_crops/app/widget/laoding.dart';
import 'package:healthy_crops/app/widget/tile_text.dart';
import 'package:healthy_crops/util/const.dart';

class ImagePickingView extends GetView<ImagePickingController> {
  const ImagePickingView({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: backGroudColor,
      drawer: const MyDrawer(),
      body: Obx(
        () => controller.loading
            ? const MyLoading()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(flex: 2, child: Container()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Row(
                            children: const [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Choose Crop Type',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: List<DropdownMenuItem<String>>.from(
                            controller.catagory
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.title,
                                    child: Text(
                                      item.title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )
                                .toList()
                              ..add(
                                const DropdownMenuItem<String>(
                                  value: ' ',
                                  child: Text(
                                    'Choose a crop type',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                          ),
                          value: controller.selectedValue.isEmpty
                              ? ' '
                              : controller.selectedValue.value,
                          onChanged: (value) {
                            controller.selectedValue.value = value.toString();
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios_outlined,
                          ),
                          iconSize: 14,
                          iconEnabledColor: Colors.yellow,
                          iconDisabledColor: Colors.grey,
                          buttonHeight: 50,
                          buttonWidth: 180,
                          buttonPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: mainColor,
                          ),
                          buttonElevation: 2,
                          itemHeight: 40,
                          itemPadding:
                              const EdgeInsets.only(left: 14, right: 14),
                          dropdownMaxHeight: 200,
                          dropdownWidth: 200,
                          dropdownPadding: null,
                          dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: mainColor,
                          ),
                          dropdownElevation: 8,
                          scrollbarRadius: const Radius.circular(40),
                          scrollbarThickness: 6,
                          scrollbarAlwaysShow: true,
                          offset: const Offset(-20, 0),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickImageFromGallery();
                        },
                        child: SizedBox(
                          height: 60,
                          width: 70,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            color: mainColor,
                            elevation: 2,
                            child: const Center(
                              child: Icon(
                                Icons.source,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickImageFromCamera();
                        },
                        child: SizedBox(
                          height: 60,
                          width: 70,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            color: mainColor,
                            elevation: 2,
                            child: const Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.image.value == null
                      ? const TileText(title: 'No Image Selected')
                      : Container(
                          height: 200,
                          width: 200,
                          child: Image.file(
                            File(controller.image.value!.path),
                          ),
                        ),
                  Flexible(flex: 2, child: Container()),
                  InkWell(
                    onTap: () {
                      controller.postData();
                    },
                    child: Container(
                      height: 60,
                      // width: 150,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        color: buttonColor,
                        elevation: 2,
                        child: const Center(
                          child: Text(
                            'Start Detection',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
