import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/repository/auth_repository.dart';
import 'package:asa/routes/app_route.dart';
import 'package:asa/services/token/app_token.dart';
import 'package:asa/utils/form_converter.dart';
import 'package:asa/utils/show_alert.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find<RegisterController>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxString usernameValue = "".obs;
  RxInt gender = (-1).obs;
  RxInt profilePicture = (-1).obs;

  RxMap<String, TextEditingController> form = {
    "username": TextEditingController(),
    'password': TextEditingController(),
    "gender": TextEditingController(),
    "email": TextEditingController(),
    "profile_picture": TextEditingController(),
    "phone": TextEditingController(),
  }.obs;
  TextEditingController confirmPassword = TextEditingController();

  List<String> exampleName = <String>[
    "skywalker123",
    'skylovers123',
    'johndoe456',
    'falconPilot7',
    'galacticQueen',
    'starGazer123',
    'spaceExplorer42',
    'lightSaberMaster',
  ];

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        var data = formConverter(form);
        await AuthController.register(data);
        var requestLogin = await AuthController.login(data);
        await UserToken.setToken(requestLogin.token);
        await CacheController.i.getUserData();
        Get.offAllNamed(AppRoute.home);
        showAlert("Login success", isSuccess: true);
      } catch (_) {}
    }
  }
}
