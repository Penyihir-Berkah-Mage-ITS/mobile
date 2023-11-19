import 'dart:io';

import 'package:asa/app/controller/home_controller.dart';
import 'package:asa/app/presentation/widget/app_loading.dart';
import 'package:asa/app/repository/post_repository.dart';
import 'package:asa/utils/debouncer.dart';
import 'package:asa/utils/filepicker_handler.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;
import 'package:video_player/video_player.dart';

class NewPostController extends GetxController {
  static NewPostController get i => Get.find<NewPostController>();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  RxMap<String, TextEditingController> form = {
    "content": TextEditingController(),
  }.obs;

  VideoPlayerController? videoController;
  RxDouble aspectRatio = 1.0.obs;
  Rxn<File> attachment = Rxn<File>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 0 No Attachment
  // 1 Image
  // 2 Video
  RxInt type = 0.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tooltipkey.currentState?.ensureTooltipVisible();
    });
  }

  void pickVideo() async {
    var file = await pickFile(
      extensions: ["mp4"],
    );

    attachment.value = file;
    type.value = 2;

    try {
      videoController = VideoPlayerController.file(attachment.value!)
        ..initialize().then((value) {
          aspectRatio.value = videoController!.value.aspectRatio;
        });
    } catch (err) {
      showAlert(err.toString());
    }
  }

  void pickImage() async {
    var file = await pickFile(extensions: ['jpeg', 'jpg', 'png']);
    attachment.value = file;
    type.value = 1;
  }

  RxBool isLoading = false.obs;
  final debouncer = Debouncer(duration: Duration(milliseconds: 300));

  void post(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      // var data = formConverter(form);
      debouncer.run(() async {
        try {
          isLoading.value = true;

          Map<String, dynamic> data = {'content': form['content']!.text};

          if (attachment.value != null) {
            data['attachment'] = await MultipartFile.fromFile(
              attachment.value!.path,
            );
          }

          // ignore: use_build_context_synchronously
          showLoadingDialog(context, isLoading);

          final formData = FormData.fromMap(data);
          await PostRepository.create(formData);
          await HomeController.i.getLatest();
          await HomeController.i.getNearest();
          await HomeController.i.getTrending();

          await Future.delayed(Duration(milliseconds: 50), () async {
            isLoading.value = false;
            await Future.delayed(Duration(milliseconds: 50), () {
              isLoading.value = true;
            });
          });

          showAlert("Success create post", isSuccess: true);
          Get.back();
        } catch (err) {
          showAlert(err.toString());
        }
      });
    }
  }
}
