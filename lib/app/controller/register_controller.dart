import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find<RegisterController>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  RxString usernameValue = "".obs;
  RxInt gender = (-1).obs;
  RxInt profilePicture = (-1).obs;

  RxMap<String, TextEditingController> form = {
    "username": TextEditingController(),
    "gender": TextEditingController(),
    "profile_picture": TextEditingController(),
  }.obs;

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
}
