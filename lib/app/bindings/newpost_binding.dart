import 'package:asa/app/controller/newpost_controller.dart';
import 'package:get/get.dart';

class NewPostBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPostController>(() => NewPostController());
  }
}
