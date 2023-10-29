import 'package:asa/app/controller/global_controller.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(() => GlobalController());
  }
}
