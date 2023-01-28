import 'package:get/get.dart';
import 'package:healthy_crops/app/module/about/about.dart';
import 'package:healthy_crops/app/module/details/details_binding.dart';
import 'package:healthy_crops/app/module/details/details_view.dart';
import 'package:healthy_crops/app/module/home/home_binding.dart';
import 'package:healthy_crops/app/module/home/home_view.dart';
import 'package:healthy_crops/app/module/image_picking/image_pick_binding.dart';
import 'package:healthy_crops/app/module/image_picking/image_pick_view.dart';
import 'package:healthy_crops/app/module/search/search_view.dart';

import '../app/module/search/search_binding.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.details,
      page: () => DetailsView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.imagePick,
      page: () => const ImagePickingView(),
      binding: ImagePickingBinding(),
    ),
    GetPage(name: Routes.about, page: ()=> const AboutView()),
  ];
}

class Routes {
  static const String home = "/";

  static const String details = "/details";

  static const String search = '/search';

  static const String imagePick = '/imagepick';

  static const String about = '/about';
}
