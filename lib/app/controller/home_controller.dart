import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/repository/post_repository.dart';
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

  RxList<PostModel> trending = <PostModel>[].obs;
  RxList<PostModel> latest = <PostModel>[].obs;
  RxList<PostModel> nearest = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    CacheController.i.getUserData();
    getTrending();
    getNearest();
    getLatest();
  }

  Future onRefresh() async {
    print('asd');
  }

  void getTrending() async {
    try {
      var request = await PostRepository.getTrending();
      trending.value = request;
    } catch (_) {}
  }

  void getNearest() async {
    try {
      var request = await PostRepository.getNearest();
      nearest.value = request;
    } catch (_) {}
  }

  void getLatest() async {
    try {
      var request = await PostRepository.getLatest();
      latest.value = request;
    } catch (_) {}
  }
}
