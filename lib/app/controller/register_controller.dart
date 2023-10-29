import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  static RegisterController get i => Get.find<RegisterController>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();

  RxString usernameValue = "".obs;
  TextEditingController username = TextEditingController();

  List<String> exampleName = <String>[
    "skywalker123",
    'skylovers123',
    'johndoe456',
    'falconPilot7',
    'galacticQueen',
    'starGazer123',
    'spaceExplorer42',
    'lightSaberMaster'
  ];
}
