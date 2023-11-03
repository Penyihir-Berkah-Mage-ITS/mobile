import 'package:asa/app/models/comment/comment_model.dart';
import 'package:asa/app/repository/comment_repository.dart';
import 'package:asa/utils/debouncer.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
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
}
