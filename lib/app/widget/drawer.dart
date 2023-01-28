import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:healthy_crops/routes/routes.dart';

import '../../util/const.dart';
import '../module/home/home_controller.dart';

class MyDrawer extends GetView<HomeController> {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Healthy Crops',
                  style: TextStyle(color: darkTextColor, fontSize: 24),
                ),
                Text(
                  'AI - Farming',
                  style: TextStyle(color: darkTextColor, fontSize: 24),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.home);
                },
                leading: const Icon(Icons.home),
                title: drawerTile(
                  'Home',
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.search);
                },
                leading: const Icon(Icons.search),
                title: drawerTile(
                  'Search',
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.imagePick);
                },
                leading: const Icon(Icons.fit_screen_rounded),
                title: drawerTile(
                  'Detect Disease',
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Get.toNamed(Routes.about);
                },
                leading: const Icon(Icons.manage_accounts),
                title: drawerTile(
                  'About Us',
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  SystemNavigator.pop();
                },
                leading: const Icon(Icons.exit_to_app),
                title: drawerTile(
                  'Exit',
                ),
              ),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }

  Widget drawerTile(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20),
    );
  }
}
