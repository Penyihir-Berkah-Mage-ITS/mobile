import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  static LoginController get i => Get.find<LoginController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxMap<String, TextEditingController> form = {
    "username": TextEditingController(),
    "password": TextEditingController(),
  }.obs;

  void login() {
    if (formKey.currentState!.validate()) {
      //
    }
  }
}
