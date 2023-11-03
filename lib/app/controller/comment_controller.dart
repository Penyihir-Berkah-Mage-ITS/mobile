import 'package:asa/app/models/comment/comment_model.dart';
import 'package:asa/app/repository/comment_repository.dart';
import 'package:asa/utils/debouncer.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  static CommentController get i => Get.find<CommentController>();

  RxList<CommentModel> comments = <CommentModel>[].obs;

  TextEditingController commentInput = TextEditingController();
  RxString commentText = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAllComment();
  }

  void getAllComment() {
    String id = Get.parameters['id']!;
    CommentRepository.getAllComment(id).then((value) {
      comments.value = value;
    }).catchError((_) {});
  }

  void addComment() {
    final debouncer = Debouncer(duration: Duration(milliseconds: 300));

    debouncer.run(() async {
      try {
        var data = {
          "content": commentInput.text,
        };
        await CommentRepository.add(Get.parameters['id']!, data);
        getAllComment();

        showInfo("Success comment");
      } catch (_) {}
    });
  }

  void like(CommentModel data) {
    var debouncer = Debouncer(duration: Duration(milliseconds: 500));
    debouncer.run(() async {
      try {
        data.isLiked!
            ? await CommentRepository.unlike(data.id, Get.parameters['id']!)
            : await CommentRepository.like(data.id, Get.parameters['id']!);

        // updateData(post, !data.is_liked!);
        showInfo('Post ${!data.isLiked! ? "liked" : "unliked"}');
        getAllComment();
      } catch (_) {}
    });
  }
}
