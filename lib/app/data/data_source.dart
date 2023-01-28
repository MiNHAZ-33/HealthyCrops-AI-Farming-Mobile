import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:healthy_crops/app/model/catagory.dart';
import 'package:healthy_crops/app/model/details.dart';
import 'package:healthy_crops/app/model/detected.dart';
import 'package:healthy_crops/app/model/disease.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart' as gett;

class DataSource {
  final String baseUrl =
      'https://healthycrops-ai-farming.onrender.com/api/crop';
  // final String baseUrl = 'http://192.168.77.14:8000/api/crop';
  // final String baseUrl = 'http://192.168.43.232:8000/api/crop';

  Future getCatagory() async {
    try {
      var response = await Dio().get('$baseUrl/croplist');

      List<Catagory> cat = response.data 
          .map((cat) => Catagory.fromJson(cat))
          .toList()
          .cast<Catagory>();

      return cat;
    } catch (e) {
      gett.Get.snackbar('Server Error', 'Internel Server Error');
    }
  }

  Future getDiseaseList() async {
    debugPrint('Getting disease list');
    try {
      var response = await Dio().get('$baseUrl/diseaselist');

      List<Disease> cat = response.data
          .map((cat) => Disease.fromJson(cat))
          .toList()
          .cast<Disease>();

      return cat;
    } catch (e) {
      gett.Get.snackbar('Server Error', 'Internel Server Error');
    }
  }

  Future getDiseaseDetails(String title) async {
    debugPrint(title);

    String newUrl = Uri.encodeComponent(title);

    try {
      var response = await Dio().get("$baseUrl/$newUrl");

      Details cat = Details.fromJson(response.data);

      return cat;
    } catch (e) {
      gett.Get.snackbar('Server Error', 'Internel Server Error');
    }
  }

  Future getSearchResult(String keyword) async {
    try {
      var response = await Dio().get('$baseUrl/diseaselist/?search=$keyword');

      List<Disease> cat = response.data
          .map((cat) => Disease.fromJson(cat))
          .toList()
          .cast<Disease>();

      return cat;
    } catch (e) {
      gett.Get.snackbar('Server Error', 'Internel Server Error');
    }
  }

  Future detectDisease(String catagory, XFile image) async {
    String fileName = image.path.split('/').last;

    FormData formData = FormData.fromMap({
      'crop': catagory,
      'image': await MultipartFile.fromFile(image.path, filename: fileName)
    });

    try {
      var response = await Dio().post('$baseUrl/AI_Search', data: formData);

      Detected cat = Detected.fromJson(response.data);

      return cat;
    } catch (e) {
      gett.Get.snackbar('Server Error', 'Interner Server Error');
    }
  }
}
