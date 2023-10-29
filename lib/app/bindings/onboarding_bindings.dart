import 'package:asa/app/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
