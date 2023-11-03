import 'dart:io';

import 'package:asa/utils/filepicker_handler.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}
