import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/app/module/search/search_controller.dart';
import 'package:healthy_crops/app/widget/drawer.dart';
import 'package:healthy_crops/app/widget/laoding.dart';
import 'package:healthy_crops/util/const.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroudColor,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: mainColor,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Obx(
          () => controller.loading
              ? const MyLoading()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          label: const Text('Search'),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              controller.searchController.clear();
                            },
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.getSearchResult();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(buttonColor),
                      ),
                      child: const Text('Search'),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
