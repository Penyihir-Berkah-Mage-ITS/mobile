import 'package:asa/app/controller/cache_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get i => Get.find<HomeController>();

  /*
  0 trending
  1 latest
  2 popular
  */
  RxInt current = 0.obs;
  PageController homePageController = PageController();

  ScrollController p1Controller = ScrollController();
  ScrollController p2Controller = ScrollController();
  ScrollController p3Controller = ScrollController();

  @override
  void onInit() {
    super.onInit();
    CacheController.i.getUserData();
  }
}
