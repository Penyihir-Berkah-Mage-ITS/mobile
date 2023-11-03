import 'dart:io';

import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/models/user/user_model.dart';
import 'package:asa/app/repository/user_repository.dart';
import 'package:asa/utils/filepicker_handler.dart';
import 'package:asa/utils/form_converter.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide MultipartFile, FormData;

class EditProfileController extends GetxController {
  static EditProfileController get i => Get.find<EditProfileController>();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isChanged = false.obs;

  Rxn<UserModel> user = Rxn<UserModel>();
  RxMap<String, TextEditingController> form = {
    "username": TextEditingController(),
    "phone": TextEditingController(),
    "gender": TextEditingController()
  }.obs;

  RxnString gender = RxnString();
  Rxn<File> picture = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  void getUser() {
    user.value = CacheController.i.user.value;
    CacheController.i.getUserData();

    gender.value = user.value!.gender;
    form['username']!.text = user.value!.username;
    form['phone']!.text = user.value!.phone;
  }

  void edit() async {
    if (formKey.currentState!.validate()) {
      if (picture.value != null) {
        var jsonData = {
          "picture": await MultipartFile.fromFile(picture.value!.path),
        };
        var formData = FormData.fromMap(jsonData);
        await UserRepository.editImage(formData);
      }

      var data = formConverter(form);
      data['gender'] = gender.value!;

      try {
        var request = await UserRepository.edit(data);
        CacheController.i.user.value = request;

        showAlert("Success edit profile data", isSuccess: true);
        Get.back();
      } catch (_) {}
    }
  }

  void pickAvatar() async {
    var file = await pickFile(extensions: ['jpeg', 'jpg', 'png']);
    picture.value = file;
    isChanged.value = true;
  }
}
