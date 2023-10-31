import 'package:asa/app/controller/cache_controller.dart';
import 'package:asa/app/controller/global_controller.dart';
import 'package:get/get.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GlobalController>(GlobalController());
    Get.put<CacheController>(CacheController());
  }
}
