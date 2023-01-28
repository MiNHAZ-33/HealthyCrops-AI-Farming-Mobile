import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:healthy_crops/app/module/home/home_controller.dart';
import 'package:healthy_crops/app/module/home/home_mobile_scaffold.dart';
import 'package:healthy_crops/app/module/home/home_web_scaffold.dart';
import 'package:healthy_crops/app/widget/main_layout.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      mobileLayout: HomeMobileScaffold(),
      webLayout: HomeWebScaffold(),
    );
  }
}
