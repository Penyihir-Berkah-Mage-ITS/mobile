import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPostController extends GetxController {
  static NewPostController get i => Get.find<NewPostController>();
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tooltipkey.currentState?.ensureTooltipVisible();
    });
  }
}
