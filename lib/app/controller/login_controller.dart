import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/repository/auth_repository.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/services/token/app_token.dart';
import 'package:asa/utils/form_converter.dart';
import 'package:asa/utils/show_alert.dart';
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
      var data = formConverter(form);
      AuthController.login(data).then((value) async {
        showAlert("Login success", isSuccess: true);
        await UserToken.setToken(value.token);
        await CacheController.i.getUserData();
        Get.offAllNamed(AppRoute.home);
      }).catchError((_) {});
    }
  }
}
