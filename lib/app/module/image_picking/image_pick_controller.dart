import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/data/data_source.dart';
import 'package:healthy_crops/app/model/detected.dart';
import 'package:healthy_crops/app/module/details/details_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/routes.dart';
import '../../model/catagory.dart';

class ImagePickingController extends GetxController {
  final DataSource _dataSource = DataSource();

  final _loading = false.obs;
  get loading => _loading.value;

  final selectedValue = ' '.obs;

  @override
  void onInit() {
    getCatagory();
    super.onInit();
  }

  @override
  void onClose() {
    image.value = null;
    super.onClose();
  }

  final ImagePicker _picker = ImagePicker();

  final _catagory = <Catagory>[].obs;
  get catagory => _catagory.value;

  // XFile? image;

  // var image = Rxn<XFile>().obs;
  var image = Rx<XFile?>(null);

  void pickImageFromGallery() async {
    final XFile? temp = await _picker.pickImage(source: ImageSource.gallery);
    if (temp != null) {
      image.value = temp;
      return;
    }
    return;
  }

  void pickImageFromCamera() async {
    final XFile? temp = await _picker.pickImage(source: ImageSource.camera);
    if (temp != null) {
      image.value = temp;
      return;
    }
    return;
  }

  getCatagory() async {
    _loading.value = true;
    _catagory.value = await _dataSource.getCatagory();
    _loading.value = false;
  }

  postData() async {
    if (selectedValue.value == ' ') {
      Get.snackbar('No Catagory', 'Catagory not selected',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    if (image.value == null) {
      Get.snackbar('No image', 'Select a valid image file',
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    _loading.value = true;
    Detected? det =
        await _dataSource.detectDisease(selectedValue.value, image.value!);

    var detail = Get.find<DetailsController>();
    detail.getDiseaseDetails(det!.disease!);
    Get.toNamed(Routes.details, parameters: {'title': det.disease!});
    _loading.value = false;
    image.value = null;
    selectedValue.value = ' ';
  }
}
