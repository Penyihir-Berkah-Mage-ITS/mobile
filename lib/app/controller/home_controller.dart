import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/repository/post_repository.dart';
import 'package:asa/utils/debouncer.dart';
import 'package:asa/utils/show_alert.dart';
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

  RxMap<String, int> totalComments = <String, int>{}.obs;

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

  void updateData(PostModel data, bool isLiked) {
    trending.value = trending.map((element) {
      if (element.id == data.id) {
        return data.copyWith(is_liked: isLiked);
      }
      return element;
    }).toList();
    nearest.value = nearest.map((element) {
      if (element.id == data.id) {
        return data.copyWith(is_liked: isLiked);
      }
      return element;
    }).toList();
    latest.value = latest.map((element) {
      if (element.id == data.id) {
        return data.copyWith(is_liked: isLiked);
      }
      return element;
    }).toList();
  }

  void like(PostModel data) async {
    var debouncer = Debouncer(duration: Duration(milliseconds: 500));
    debouncer.run(() async {
      try {
        var post = data.is_liked!
            ? await PostRepository.unlike(data.id)
            : await PostRepository.like(data.id);

        updateData(post, !data.is_liked!);
        showInfo('Post ${!data.is_liked! ? "liked" : "unliked"}');
      } catch (_) {}
    });
  }
}
